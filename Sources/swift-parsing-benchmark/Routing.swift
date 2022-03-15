import Benchmark
import Foundation
import Parsing
import _URLRouting

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// This benchmark demonstrates how you can build a URL request router that can transform an input
/// request into a more well-structured data type, such as an enum. We build a router that can
/// recognize one of 5 routes for a website.
let routingSuite = BenchmarkSuite(name: "Routing") { suite in
  let requests = [
    URLRequestData(),
    URLRequestData(path: ["contact-us"]),
    URLRequestData(path: ["episodes"]),
    URLRequestData(path: ["episodes", "1"]),
    URLRequestData(path: ["episodes", "1", "comments"]),
    URLRequestData(path: ["episodes", "1", "comments"], query: ["count": ["20"]]),
    URLRequestData(
      method: "POST",
      path: ["episodes", "1", "comments"],
      body: .init(#"{"commenter":"Blob","message":"Hi!"}"#.utf8)
    ),
  ]

  var output: [AppRoute]!
  var expectedOutput: [AppRoute] = [
    .home,
    .contactUs,
    .episodes(.index),
    .episodes(.episode(id: 1, route: .show)),
    .episodes(.episode(id: 1, route: .comments(.show(count: 10)))),
    .episodes(.episode(id: 1, route: .comments(.show(count: 20)))),
    .episodes(
      .episode(id: 1, route: .comments(.post(.init(commenter: "Blob", message: "Hi!"))))),
  ]
  suite.benchmark("Parser") {
    output = try requests.map {
      var input = $0
      return try AppRoute.router().parse(&input)
    }
  } tearDown: {
    precondition(output == expectedOutput)
    precondition(requests == output.map { try! AppRoute.router().print($0) })
  }
}

enum AppRoute: Equatable {
  case home
  case contactUs
  case episodes(Episodes)
}

enum Episodes: Equatable {
  case index
  case episode(id: Int, route: Episode)
}

enum Episode: Equatable {
  case show
  case comments(Comments)
}

enum Comments: Equatable {
  case post(Comment)
  case show(count: Int)
}

struct Comment: Codable, Equatable {
  let commenter: String
  let message: String
}

extension Comments {
  static func router() -> some ParserPrinter<URLRequestData, Self> {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .sortedKeys

    return OneOf {
      Route(.case(Self.post)) {
        Method.post
        HTTPBody {
          Parse(.data.json(Comment.self, encoder: encoder))
        }
      }

      Route(.case(Self.show)) {
        Query {
          Field("count", Int.parser(), default: 10)
        }
      }
    }
  }
}

extension Episode {
  static func router() -> some ParserPrinter<URLRequestData, Self> {
    OneOf {
      Route(Self.show)

      Route(.case(Self.comments)) {
        Path { From(.utf8) { "comments".utf8 } }

        Comments.router()
      }
    }
  }
}

extension Episodes {
  static func router() -> some ParserPrinter<URLRequestData, Self> {
    OneOf {
      Route(Self.index)

      Route(.case(Self.episode)) {
        Path { Int.parser() }

        Episode.router()
      }
    }
  }
}

extension AppRoute {
  static func router() -> some ParserPrinter<URLRequestData, Self> {
    OneOf {
      Route(Self.home)

      Route(Self.contactUs) {
        Path { From(.utf8) { "contact-us".utf8 } }
      }

      Route(.case(Self.episodes)) {
        Path { From(.utf8) { "episodes".utf8 } }

        Episodes.router()
      }
    }
  }
}
