import Benchmark
import Foundation
import Parsing

/*
 This benchmark demonstrates how you can build a URL request router that can transform an input
 request into a more well-structured data type, such as an enum. We build a router that can
 recognize one of 5 routes for a website.
 */

let routingSuite = BenchmarkSuite(name: "Routing") { suite in
  enum Route: Equatable {
    case home
    case contactUs
    case episodes(Episodes)

    enum Episodes: Equatable {
      case index
      case episode(id: Int, route: Episode)
    }

    enum Episode: Equatable {
      case show
      case comments(Comments)

      enum Comments: Equatable {
        case post(Comment)
        case show(count: Int?)

        struct Comment: Decodable, Equatable {
          let commenter: String
          let message: String
        }
      }
    }
  }

  let router = OneOf {
    Routing(Route.home) {
      Method.get
    }

    Routing(Route.contactUs) {
      Method.get
      Path(FromUTF8View { "contact-us".utf8 })
    }

    Routing(Route.episodes) {
      Path(FromUTF8View { "episodes".utf8 })

      OneOf {
        Routing(Route.Episodes.index) {
          Method.get
        }

        Routing(Route.Episodes.episode) {
          Path(FromUTF8View { Int.parser() })

          OneOf {
            Routing(Route.Episode.show) {
              Method.get
            }

            Routing(Route.Episode.comments) {
              Path(FromUTF8View { "comments".utf8 })

              OneOf {
                Routing(Route.Episode.Comments.post) {
                  Method.post
                  Body {
                    JSON(Route.Episode.Comments.Comment.self)
                  }
                }

                Routing(Route.Episode.Comments.show) {
                  Method.get
                  Query("count", Int.parser(), default: 10)
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
    {"commenter": "Blob", "message": "Hi!"}
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

  var output: [Route]!
  var expectedOutput: [Route] = [
    .home,
    .contactUs,
    .episodes(.index),
    .episodes(.episode(id: 1, route: .show)),
    .episodes(.episode(id: 1, route: .comments(.show(count: 10)))),
    .episodes(.episode(id: 1, route: .comments(.show(count: 20)))),
    .episodes(.episode(id: 1, route: .comments(.post(.init(commenter: "Blob", message: "Hi!"))))),
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
}
