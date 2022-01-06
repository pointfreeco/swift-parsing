import Benchmark
import Foundation
import Parsing
import URLRouting

/*
 This benchmark demonstrates how you can build a URL request router that can transform an input
 request into a more well-structured data type, such as an enum. We build a router that can
 recognize one of 5 routes for a website.
 */

let routingSuite = BenchmarkSuite(name: "Routing") { suite in
  enum AppRoute: Equatable {
    case home
    case contactUs
    case episodes(Episodes)

    enum Episodes: Equatable {
      case index
      case episode(id: Episode.ID, route: Episode)
    }

    enum Episode: Equatable {
      struct ID: Equatable, RawRepresentable {
        var rawValue: Int
      }

      case show
      case comments(Comments)

      enum Comments: Equatable {
        case post(Comment)
        case show(count: Int?)

        struct Comment: Decodable, Encodable, Equatable {
          let commenter: String
          let message: String
        }
      }
    }
  }

  let router = OneOf {
    Route(/AppRoute.home) {
      Method.get
    }

    Route(/AppRoute.contactUs) {
      Method.get
      Path { FromUTF8View { "contact-us".utf8 } }
    }

    Route(/AppRoute.episodes) {
      Path { FromUTF8View { "episodes".utf8 } }

      OneOf {
        Route(/AppRoute.Episodes.index) {
          Method.get
        }

        Route(/AppRoute.Episodes.episode) {
          Path { AppRoute.Episode.ID.parser(rawValue: Int.parser()) }

          OneOf {
            Route(/AppRoute.Episode.show) {
              Method.get
            }

            Route(/AppRoute.Episode.comments) {
              Path { FromUTF8View { "comments".utf8 } }

              OneOf {
                Route(/AppRoute.Episode.Comments.post) {
                  Method.post
                  Body {
                    JSON(AppRoute.Episode.Comments.Comment.self)
                  }
                }

                Route(/AppRoute.Episode.Comments.show) {
                  Method.get
                  Query {
                    Field("count", Int.parser(), default: 10)
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  var postRequest = URLRequest(url: URL(string: "/episodes/1/comments")!)
  postRequest.httpMethod = "POST"
  postRequest.httpBody = Data("""
    {"commenter":"Blob","message":"Hi!"}
    """.utf8)
  let requests = [
    URLRequest(url: URL(string: "/")!),
    URLRequest(url: URL(string: "/contact-us")!),
    URLRequest(url: URL(string: "/episodes")!),
    URLRequest(url: URL(string: "/episodes/1")!),
    URLRequest(url: URL(string: "/episodes/1/comments")!),
    URLRequest(url: URL(string: "/episodes/1/comments?count=20")!),
    postRequest,
  ]
  .map { URLRequestData(request: $0)! }

  var output: [AppRoute]!
  var expectedOutput: [AppRoute] = [
    .home,
    .contactUs,
    .episodes(.index),
    .episodes(.episode(id: .init(rawValue: 1), route: .show)),
    .episodes(.episode(id: .init(rawValue: 1), route: .comments(.show(count: 10)))),
    .episodes(.episode(id: .init(rawValue: 1), route: .comments(.show(count: 20)))),
    .episodes(.episode(id: .init(rawValue: 1), route: .comments(.post(.init(commenter: "Blob", message: "Hi!"))))),
  ]
  suite.benchmark(
    name: "Parser",
    run: {
      output = requests.map {
        var input = $0
        return router.parse(&input)!
      }
    },
    tearDown: {
      precondition(output == expectedOutput)
    }
  )

  var input: [URLRequestData]!
  suite.benchmark(
    name: "Printer",
    run: {
      input = expectedOutput.map {
        router.print($0)!
      }
    },
    tearDown: {
      precondition(input == requests)
    }
  )
}
