

/*

Rails.application.routes.draw do
  get "/users/:user_id/books/:book_id" => "books#fetch"
end

 users_books_path true, "hello" # /users/42/books/123


app.get('/users/:userId/books/:bookId', function (req, res) {
  ...
})


app.get("users", ":userID", "books", ":bookID") { req in
  ...
}


<a href="/users/42/book/123">Blob Autobiography</a>
<a href="/users/42/book/321">Blobbed around the world</a>

 "/users/\(user.id)/books/\(book.id)"

 router.parse("/users/42/books/123") // (42, 123)
 router.print((user.id, book.id)) // "/users/42/books/123"

 */

import _URLRouting


struct SearchOptions {
  var sort: Sort = .title
  var direction: Direction = .asc
  var count = 10

  enum Direction: String, CaseIterable {
    case asc, desc
  }
  enum Sort: String, CaseIterable {
    case title, category
  }
}

enum SiteRoute {
  case user(id: Int)
  case book(userId: Int, bookId: Int)
  case searchBooks(userId: Int, options: SearchOptions)
}

let router = OneOf {
  Route(.case(SiteRoute.user(id:))) {
    Path {
      "users"
      Digits()
    }
  }

  Route(.case(SiteRoute.book(userId:bookId:))) {
    Path {
      "users"
      Digits()
      "books"
      Digits()
    }
  }

  Route(.case(SiteRoute.searchBooks(userId:options:))) {
    Path { "users"; Digits(); "books"; "search" }
    Parse(.memberwise(SearchOptions.init)) {
      Query {
        Field("sort", default: .title) { SearchOptions.Sort.parser() }
        Field("direction", default: .asc) { SearchOptions.Direction.parser() }
        Field("count", default: 10) { Digits() }
      }
    }
  }
}

try router.match(path: "/users/42/books/search?count=100")
router.path(for: .searchBooks(userId: 42, options: .init(sort: .category, direction: .desc, count: 100)))

try router.match(path: "/users/42/books/123")
router.path(for: .book(userId: 42, bookId: 123))
router.path(for: .user(id: 42))

// users/42/books/search?sort=title&direction=asc
// POST users/42/books, body={"title": "Blob Cookbook", "category": "Cooking", ...}

import Foundation

let request = URLRequest(url: URL(string: "users/42/books?sort=title&direction=asc")!)

