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
      return try AppRouter().parse(&input)
    }
  } tearDown: {
    precondition(output == expectedOutput)
    precondition(requests == output.map { try! AppRouter().print($0) })
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

struct CommentsRouter: ParserPrinter {
  var encoder: JSONEncoder {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .sortedKeys
    return encoder
  }

  var body: some ParserPrinter<URLRequestData, Comments> {
    OneOf {
      Route(.case(Comments.post)) {
        Method.post
        HTTPBody {
          Parse(.data.json(Comment.self, encoder: self.encoder))
        }
      }

      Route(.case(Comments.show)) {
        Query {
          Field("count", Int.parser(), default: 10)
        }
      }
    }
  }
}

struct EpisodeRouter: ParserPrinter {
  var body: some ParserPrinter<URLRequestData, Episode> {
    OneOf {
      Route(Episode.show)

      Route(.case(Episode.comments)) {
        Path { From(.utf8) { "comments".utf8 } }

        CommentsRouter()
      }
    }
  }
}

struct EpisodesRouter: ParserPrinter {
  var body: some ParserPrinter<URLRequestData, Episodes> {
    OneOf {
      Route(Episodes.index)

      Route(.case(Episodes.episode)) {
        Path { Int.parser() }

        EpisodeRouter()
      }
    }
  }
}

struct AppRouter: ParserPrinter {
  var body: some ParserPrinter<URLRequestData, AppRoute> {
    OneOf {
      Route(AppRoute.home)

      Route(AppRoute.contactUs) {
        Path { From(.utf8) { "contact-us".utf8 } }
      }

      Route(.case(AppRoute.episodes)) {
        Path { From(.utf8) { "episodes".utf8 } }

        EpisodesRouter()
      }
    }
  }
}
