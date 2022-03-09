import Benchmark
import Foundation
import Parsing
import _URLRouting

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

protocol ParserBody: Parser {
  associatedtype Body: Parser where Body.Input == Input, Body.Output == Output
  @ParserBuilder var body: Body { get }
}
extension ParserBody {
  func parse(_ input: inout Input) throws -> Output {
    try self.body.parse(&input)
  }
}
protocol ParserPrinterBody: ParserBody, Printer {
}
extension ParserPrinterBody where Body: Printer {
  func print(_ output: Output, into input: inout Input) throws {
    try self.body.print(output, into: &input)
  }
}

/// This benchmark demonstrates how you can build a URL request router that can transform an input
/// request into a more well-structured data type, such as an enum. We build a router that can
/// recognize one of 5 routes for a website.
let routingSuite = BenchmarkSuite(name: "Routing") { suite in
  if #available(macOS 10.13, *) {
#if compiler(>=5.5)
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

//    let encoder = JSONEncoder()
//    encoder.outputFormatting = .sortedKeys

    struct CommentsRouter: ParserPrinterBody {
      typealias Input = URLRequestData
      typealias Output = Comments

      let body = OneOf {
        Route(.case(Comments.post)) {
          Method.post
          _URLRouting.Body {
            Parse(.data.json(Comment.self, encoder: JSONEncoder()))
          }
        }

        Route(.case(Comments.show)) {
          Query {
            Field("count", Int.parser(), default: 10)
          }
        }
      }
    }

    struct EpisodeRouter: ParserPrinterBody {
      typealias Input = URLRequestData
      typealias Output = Episode

      let body = OneOf {
        Route(Episode.show)

        Route(.case(Episode.comments)) {
          Path { From(.utf8) { "comments".utf8 } }

          CommentsRouter()
        }
      }
    }

    struct EpisodesRouter: ParserPrinterBody {
      typealias Input = URLRequestData
      typealias Output = Episodes

      let body = OneOf {
        Route(Episodes.index)

        Route(.case(Episodes.episode)) {
          Path { Int.parser() }

          EpisodeRouter()
        }
      }
    }

    struct Router: ParserPrinterBody {
      typealias Input = URLRequestData
      typealias Output = AppRoute

      let body = OneOf {
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
    let router = Router()
    suite.benchmark("Parser") {
      output = try requests.map {
        var input = $0
        return try router.parse(&input)
      }
    } tearDown: {
      precondition(output == expectedOutput)
      precondition(requests == output.map { try! router.print($0) })
    }
#endif
  }
}
