import Benchmark
import Foundation
import Parsing

/*
 This benchmark demonstrates how you can build a URL request router that can transform an input
 request into a more well-structured data type, such as an enum. We build a router that can
 recognize one of 5 routes for a website.
 */

struct Routing<P: Parser, R>: Parser {
  let parser: Parsers.Map<P, R>

  init(
    _ transform: @escaping (P.Output) -> R,
    @ParserBuilder build: () -> P
  ) {
    self.parser = build().map(transform)
  }

  init(
    _ constant: R,
    @ParserBuilder build: () -> P
  ) where P.Output == Void {
    self.parser = build().map { _ in constant}
  }

  func parse(_ input: inout P.Input) -> R? {
    self.parser.parse(&input)
  }
}

let routingSuite = BenchmarkSuite(name: "Routing") { suite in
  enum Route: Equatable {
    case home
    case contactUs
    case episodes
    case episode(id: Int)
    case episodeComments(id: Int)
  }

  let router = OneOf {
    Routing(Route.home) {
      Method("GET")
      End()
    }

    Routing(Route.contactUs) {
      Method("GET")
      Path("contact-us".utf8)
      End()
    }

    Routing(Route.episodes) {
      Method("GET")
      Path("episodes".utf8)
      End()
    }

    Routing(Route.episode(id:)) {
      Method("GET")
      Path("episodes".utf8)
      Path(Int.parser())
      End()
    }

    Routing(Route.episodeComments(id:)) {
      Method("GET")
      Path("episodes".utf8)
      Path(Int.parser())
      Path("comments".utf8)
      End()
    }
  }

  let requests = [
    RequestData(
      method: "GET"
    ),
    RequestData(
      method: "GET",
      pathComponents: ["contact-us"[...].utf8]
    ),
    RequestData(
      method: "GET",
      pathComponents: ["episodes"[...].utf8]
    ),
    RequestData(
      method: "GET",
      pathComponents: ["episodes"[...].utf8, "1"[...].utf8]
    ),
    RequestData(
      method: "GET",
      pathComponents: ["episodes"[...].utf8, "1"[...].utf8, "comments"[...].utf8]
    ),
  ]

  var output: [Route]!
  var expectedOutput = [
    Route.home,
    .contactUs,
    .episodes,
    .episode(id: 1),
    .episodeComments(id: 1),
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

private struct RequestData {
  var body: Data?
  var headers: [(String, Substring.UTF8View)] = []
  var method: String?
  var pathComponents: ArraySlice<Substring.UTF8View> = []
  var queryItems: [(String, Substring.UTF8View)] = []
}

private struct Method: Parser {
  typealias Input = RequestData
  typealias Output = Void

  let method: String

  init(_ method: String) {
    self.method = method
  }

  func parse(_ input: inout RequestData) -> Void? {
    guard input.method?.lowercased() == self.method.lowercased()
    else { return nil }

    input.method = nil
    return ()
  }
}

private struct Path<Component>: Parser
where
  Component: Parser,
  Component.Input == Substring.UTF8View
{
  typealias Input = RequestData
  typealias Output = Component.Output

  let component: Component

  init(_ component: Component) {
    self.component = component
  }

  func parse(_ input: inout Input) -> Output? {
    guard !input.pathComponents.isEmpty
    else { return nil }

    let original = input
    let output = self.component.parse(&input.pathComponents[input.pathComponents.startIndex])
    guard input.pathComponents[input.pathComponents.startIndex].isEmpty
    else {
      input = original
      return nil
    }
    input.pathComponents.removeFirst()
    return output
  }
}

private struct End: Parser {
  typealias Input = RequestData
  typealias Output = Void

  func parse(_ input: inout Input) -> Output? {
    guard
      input.method == nil,
      input.pathComponents.isEmpty
    else { return nil }

    input = .init()

    return ()
  }
}
