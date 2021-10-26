import Benchmark
import Foundation
import Parsing

/*

 let home = Method.get
   .skip(PathEnd())
   .map(/Route.home)

 {
   Method.get()
   PathEnd()
 }
 .map(/Route.home)

 Routing(/Route.home) {
   Method.get()
   PathEnd()
 }

 Sequence {

 }
 Take {

 }
 Parse {

 }
 

 let episodes = Method.get
   .skip(PathComponent("episodes"))
   .skip(PathEnd())
   .take(Optional.parser(of: QueryItem("limit", Int.parser(isSigned: false))))
   .take(Optional.parser(of: QueryItem("offset", Int.parser(isSigned: false))))
   .map(/Route.episodes)

 let episode = Method.get
   .skip(PathComponent("episodes"))
   .take(PathComponent(Int.parser(isSigned: false)))
   .skip(PathEnd())
   .map(/Route.episode)

 let search = Method.get
   .skip(PathComponent("search"))
   .skip(PathEnd())
   .take(QueryItem("q"))
   .map(/Route.search)

 let signUp = Method.post
   .skip(PathComponent("sign-up"))
   .skip(PathEnd())
   .take(Body(User.fromJSON))
   .map(/Route.signUp)

 let router = OneOf {
   home
   episodes
   search
   signUp
 }

 let router = home
   .orElse(episodes)
   .orElse(episode)
   .orElse(search)
   .orElse(signUp)


 */


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
