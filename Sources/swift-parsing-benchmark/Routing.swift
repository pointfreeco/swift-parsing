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
    case episodes
    case episode(id: Int)
    case episodeComments(id: Int)
  }

//  let tmp = Method("GET")
//    .skip(End())
//    .map(Exactly(Route.home))
//    .orElse(
//      Method("GET")
//        .skip(Path(StartsWith("contact-us".utf8)))
//        .skip(End())
//        .map(Exactly(Route.home))
//    )
//  tmp
//    .print(Route.home)

  let router = Method("GET")
    .skip(End())
    .map { Route.home }
    .orElse(
      Method("GET")
        .skip(Path(StartsWith("contact-us".utf8)))
        .skip(End())
        .map { Route.contactUs }
    )
    .orElse(
      Method("GET")
        .skip(Path(StartsWith("episodes".utf8)))
        .skip(End())
        .map { Route.episodes }
    )
    .orElse(
      Method("GET")
        .skip(Path(StartsWith("episodes".utf8)))
        .take(Path(Int.parser()))
        .skip(End())
        .map(Route.episode(id:))
    )
    .orElse(
      Method("GET")
        .skip(Path(StartsWith("episodes".utf8)))
        .take(Path(Int.parser()))
        .skip(Path(StartsWith("comments".utf8)))
        .skip(End())
        .map(Route.episodeComments(id:))
    )

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

extension RequestData: Appendable {
  mutating func append(contentsOf other: RequestData) {
    self.body?.append(contentsOf: other.body ?? Data())
    self.headers.append(contentsOf: other.headers)
    self.method = self.method ?? other.method
    self.pathComponents.append(contentsOf: other.pathComponents)
    self.queryItems.append(contentsOf: other.queryItems)
  }
}

private struct Method: ParserPrinter {
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

  func print(_ output: Void) -> RequestData? {
    .init(method: self.method)
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

extension Path: Printer where Component: Printer {
  func print(_ output: Component.Output) -> RequestData? {
    .init(pathComponents: self.component.print(output).map { [$0] } ?? [])
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

extension End: Printer {
  func print(_ output: Void) -> RequestData? {
    .init()
  }
}
