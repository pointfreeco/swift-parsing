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
      case comments
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
              Method.get
              Path(FromUTF8View { "comments".utf8 })
            }
          }
        }
      }
    }
  }

  let requests = [
    URL(string: "/")!,
    URL(string: "/contact-us")!,
    URL(string: "/episodes")!,
    URL(string: "/episodes/1")!,
    URL(string: "/episodes/1/comments")!,
  ]
  .map { URLRequestData(url: $0)! }

  var output: [Route]!
  var expectedOutput: [Route] = [
    .home,
    .contactUs,
    .episodes(.index),
    .episodes(.episode(id: 1, route: .show)),
    .episodes(.episode(id: 1, route: .comments)),
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
