import Parsing
import XCTest
import _URLRouting

class RoutingErrorTests: XCTestCase {
  func testError() {
    enum BookRoute {
      case fetch
    }
    let bookRouter = OneOf {
      Route(.case(BookRoute.fetch))
    }

    struct Options {
      var sort: Sort = .name
      var direction: Direction = .asc
      var count: Int = 10

      enum Direction: String, CaseIterable, Decodable {
        case asc, desc
      }
      enum Sort: String, CaseIterable, Decodable {
        case name
        case category = "category"
      }
    }
    enum BooksRoute {
      case book(id: UUID, route: BookRoute)
      case search(Options)
    }
    let booksRouter = OneOf {
      Route(.case(BooksRoute.book(id:route:))) {
        Path { UUID.parser() }
        bookRouter
      }
      Route(.case(BooksRoute.search)) {
        Path { "search" }
        Parse(.memberwise(Options.init(sort:direction:count:))) {
          Query {
            Field("sort", default: .name) { Options.Sort.parser() }
            Field("direction", default: .asc) { Options.Direction.parser() }
            Field("count", default: 10) { Int.parser() }
          }
        }
      }
    }

    enum UserRoute {
      case books(BooksRoute)
      case fetch
    }
    let userRouter = OneOf {
      Route(.case(UserRoute.books)) {
        Path { "books" }
        booksRouter
      }

      Route(.case(UserRoute.fetch))
    }

    struct CreateUser: Codable {
      let bio: String
      let name: String
    }
    enum UsersRoute {
      case create(CreateUser)
      case user(id: Int, route: UserRoute)
    }
    let usersRouter = OneOf {
      Route(.case(UsersRoute.create)) {
        Method.post
        Body(.json(CreateUser.self))
      }

      Route(.case(UsersRoute.user(id:route:))) {
        Path { Int.parser() }
        userRouter
      }
    }

    enum SiteRoute {
      case aboutUs
      case contactUs
      case home
      case users(UsersRoute)
    }
    let siteRouter = OneOf {
      Route(.case(SiteRoute.aboutUs)) {
        Path { "about-us" }
      }
      Route(.case(SiteRoute.contactUs)) {
        Path { "contact-us" }
      }
      Route(.case(SiteRoute.home))

      Route(.case(SiteRoute.users)) {
        Path { "users" }
        usersRouter
      }
    }

    XCTAssertThrowsError(try siteRouter.parse(URLRequestData(path: "/123"))) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:2
        1 | /123
          |  ^ expected "about-us"
          |  ^ expected "contact-us"
          |  ^ expected end of input
          |  ^ expected "users"
        """,
        "\(error)"
      )
    }
  }
}
