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
  if #available(macOS 10.13, *) {
    #if compiler(>=5.5)
      enum AppRoute: Equatable {
        case home
        case contactUs
        case episodes(EpisodesRoute)
      }
      enum EpisodesRoute: Equatable {
        case index
        case episode(id: Int, route: EpisodeRoute)
      }
      enum EpisodeRoute: Equatable {
        case show
        case comments(CommentsRoute)
      }
      enum CommentsRoute: Equatable {
        case post(Comment)
        case show(count: Int)
      }
      struct Comment: Codable, Equatable {
        let commenter: String
        let message: String
      }

      let encoder = JSONEncoder()
      encoder.outputFormatting = .sortedKeys

      let commentsRouter = OneOf {
        Route(.case(CommentsRoute.post)) {
          Method.post
          Body {
            Parse(.data.json(Comment.self, encoder: encoder))
          }
        }

        Route(.case(CommentsRoute.show)) {
          Query {
            Field("count", Int.parser(), default: 10)
          }
        }
      }

      let episodeRouter = OneOf {
        Route(EpisodeRoute.show)

        Route(.case(EpisodeRoute.comments)) {
          Path { From(.utf8) { "comments".utf8 } }

          commentsRouter
        }
      }

      let episodesRouter = OneOf {
        Route(EpisodesRoute.index)

        Route(.case(EpisodesRoute.episode)) {
          Path { Int.parser() }

          episodeRouter
        }
      }

      let router = OneOf {
        Route(AppRoute.home)

        Route(AppRoute.contactUs) {
          Path { From(.utf8) { "contact-us".utf8 } }
        }

        Route(.case(AppRoute.episodes)) {
          Path { From(.utf8) { "episodes".utf8 } }

          episodesRouter
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
