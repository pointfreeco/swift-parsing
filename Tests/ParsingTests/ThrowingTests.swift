import Parsing
import XCTest

extension ParsingError: CustomDebugStringConvertible {
  public var debugDescription: String {
    switch self.remainingInput {
    case let input as Substring:
      let startIndex = input.base
        .index(input.startIndex, offsetBy: -10, limitedBy: input.base.startIndex)
      ?? input.base.startIndex
      let endIndex = input.base
        .index(input.startIndex, offsetBy: 20, limitedBy: input.base.endIndex)
      ?? input.base.endIndex

      let lengthBeforeInput = input.base.distance(from: startIndex, to: input.startIndex)

      let preview = input.base[startIndex ..< endIndex]

      // let distance = input.base.distance(from: input.base.startIndex, to: input.startIndex)
      let (line, col) = input.base[..<input.startIndex].reduce(into: (line: 1, col: 1)) { context, char in
        if char == "\n" {
          context.0 += 1
          context.1 = 1
        } else {
          context.1 += 1
        }
      }

      return """
        Error parsing @ (\(line):\(col)):

        \(preview)
        \(String(repeating: "~", count: lengthBeforeInput))^

        Expected \(self.expected)
        """
//    case let input as Substring.UTF8View:
//
    default:
      break
    }
    return """
      Expected \(self.expected) from \(self.remainingInput)
      """
  }
}

class ThrowingTests: XCTestCase {
  func testIntThrowing() throws {
    var input = "Hello, 42"[...]

//    XCTAssertNoThrow(
      try Parse {
        "Hello, "

        OneOf {
          "Blob"
          "Blob Jr"
        }
      }
      .parse(&input) as Void
//    )

//    XCTAssertEqual(
//      try Int.parser().parse(&input) as Int,
//      42
//    )
//
//    input = "Hello"
//    XCTAssertEqual(
//      try Int.parser().parse(&input) as Int,
//      42
//    )
//
//    input = "42,Hello"
//    try Parse {
//      Int.parser()
//      ","
//      Bool.parser()
//    }
//    .parse(&input) as (Int, Bool)
  }

  func testRouter() throws {
//    var input = URLRequestData(string: "hello/42/world")!
//    var input = URLRequestData(string: "/")!
//    var input = URLRequestData(string: "world-hello/42/world?name=world")!
//    try Path("world").parse(&input) as Void
//
//    try Query("name", Int.parser()).parse(&input) as Int
//
//    enum AppRoute: Equatable {
//      case home
//      case contactUs
//      case episodes(Episodes)
//    }
//    enum Episodes: Equatable {
//      case index
//      case episode(id: Int, route: Episode)
//    }
//    enum Episode: Equatable {
//      case show
//      case comments(Comments)
//    }
//    enum Comments: Equatable {
//      case post(Comment)
//      case show(count: Int)
//    }
//    struct Comment: Decodable, Equatable {
//      let commenter: String
//      let message: String
//    }
//
//    let router = OneOf {
//      Route(AppRoute.home)
//
//      Route(AppRoute.contactUs) {
//        Path(FromUTF8View { "contact-us".utf8 })
//      }
//
//      Route(AppRoute.episodes) {
//        Path(FromUTF8View { "episodes".utf8 })
//
//        OneOf {
//          Route(Episodes.index)
//
//          Route(Episodes.episode) {
//            Path(Int.parser())
//
//            OneOf {
//              Route(Episode.show)
//
//              Route(Episode.comments) {
//                Path(FromUTF8View { "comments".utf8 })
//
//                OneOf {
//                  Route(Comments.post) {
//                    Method.post
//                    Body {
//                      JSON(Comment.self)
//                    }
//                  }
//
//                  Route(Comments.show) {
//                    Query("count", Int.parser(), default: 10)
//                  }
//                }
//              }
//            }
//          }
//        }
//      }
//    }
//
//    var postRequest = URLRequest(url: URL(string: "/episodes/1/comments")!)
//    postRequest.httpMethod = "POST"
//    postRequest.httpBody = Data("""
//      {"commenter": "Blob", "message": "Hi!"}
//      """.utf8)
//    let requests = [
//      URLRequest(url: URL(string: "/")!),
//      URLRequest(url: URL(string: "/contact-us")!),
//      URLRequest(url: URL(string: "/episodes")!),
//      URLRequest(url: URL(string: "/episodes/1")!),
//      URLRequest(url: URL(string: "/episodes/1/comments")!),
//      URLRequest(url: URL(string: "/episodes/1/comments?count=20")!),
//      postRequest,
//    ]
//    .map { URLRequestData(request: $0)! }
//
//    var output: [AppRoute]!
//    var expectedOutput: [AppRoute] = [
//      .home,
//      .contactUs,
//      .episodes(.index),
//      .episodes(.episode(id: 1, route: .show)),
//      .episodes(.episode(id: 1, route: .comments(.show(count: 10)))),
//      .episodes(.episode(id: 1, route: .comments(.show(count: 20)))),
//      .episodes(.episode(id: 1, route: .comments(.post(.init(commenter: "Blob", message: "Hi!"))))),
//    ]
  }
}

//import Foundation
//
//struct URLRequestData {
//  var body: ArraySlice<UInt8>?
//  var headers: [String: Substring]
//  var method: String?
//  var path: ArraySlice<Substring>
//  var query: [String: ArraySlice<Substring?>]
//
//  init(
//    method: String? = nil,
//    path: ArraySlice<Substring> = [],
//    query: [String: ArraySlice<Substring?>] = [:],
//    headers: [String: Substring] = [:],
//    body: ArraySlice<UInt8>? = nil
//  ) {
//    self.method = method
//    self.path = path
//    self.query = query
//    self.headers = headers
//    self.body = body
//  }
//}
//
//struct Body<Parsers>: Parser
//where
//  Parsers: Parser,
//  Parsers.Input == ArraySlice<UInt8>
//{
//  typealias Input = URLRequestData
//  typealias Output = Parsers.Output
//
//  let bodyParser: Parsers
//
//  @inlinable
//  init(@ParserBuilder _ bodyParser: () -> Parsers) {
//    self.bodyParser = bodyParser()
//  }
//
//  @inlinable
//  func parse(_ input: inout URLRequestData) -> Parsers.Output? {
//    guard
//      var body = input.body,
//      let output = self.bodyParser.parse(&body),
//      body.isEmpty
//    else { return nil }
//
//    input.body = nil
//    return output
//  }
//}
//
//struct JSON<Value: Decodable>: Parser {
//  typealias Input = ArraySlice<UInt8>
//  typealias Output = Value
//
//  let decoder: JSONDecoder
//
//  @inlinable
//  init(
//    _ type: Value.Type,
//    decoder: JSONDecoder = .init()
//  ) {
//    self.decoder = decoder
//  }
//
//  @inlinable
//  func parse(_ input: inout ArraySlice<UInt8>) -> Value? {
//    guard
//      let output = try? decoder.decode(Value.self, from: Data(input))
//    else { return nil }
//    input = []
//    return output
//  }
//}
//
//struct Method: Parser {
//  typealias Input = URLRequestData
//  typealias Output = Void
//
//  let name: String
//
//  static let get = Self("GET")
//  static let post = Self("POST")
//  static let put = Self("PUT")
//  static let patch = Self("PATCH")
//  static let delete = Self("DELETE")
//
//  @inlinable
//  init(_ name: String) {
//    self.name = name.uppercased()
//  }
//
//  @inlinable
//  func parse(_ input: inout URLRequestData) -> Void? {
//    guard input.method?.uppercased() == self.name else { return nil }
//    input.method = nil
//    return ()
//  }
//}
//
//struct Path<Component>: Parser
//where
//  Component: Parser,
//  Component.Input == Substring
//{
//  typealias Input = URLRequestData
//  typealias Output = Component.Output
//
//  let componentParser: Component
//
//  @inlinable
//  init(_ component: Component) {
//    self.componentParser = component
//  }
//
//  @inlinable
//  func parse(_ input: inout URLRequestData) throws -> Component.Output {
//    guard var component = input.path.first else {
//      throw ParsingError("Expected a path component, but found none")
//    }
//    let output: Component.Output
//    do {
//      output = try self.componentParser.parse(&component) as Component.Output
//    } catch let error as ParsingError {
//      throw ParsingError(
//        "Expected a component: \(error.message)",
//        rest: input.path.joined(separator: "/")
//      )
//    } catch {
//      throw error
//    }
//    guard component.isEmpty else {
//      var rest = input.path
//      rest[0] = component
//      throw ParsingError(
//        "Expected to fully consume path, but characters remain",
//        rest: rest.joined(separator: "/")
//      )
//    }
//    input.path.removeFirst()
//    return output
//  }
//}
//
//struct PathEnd: Parser {
//  typealias Input = URLRequestData
//  typealias Output = Void
//
//  @inlinable
//  init() {}
//
//  @inlinable
//  func parse(_ input: inout URLRequestData) -> Void? {
//    guard input.path.isEmpty
//    else { return nil }
//    return ()
//  }
//}
//
//struct Query<Value>: Parser
//where
//  Value: Parser,
//  Value.Input == Substring
//{
//  typealias Input = URLRequestData
//  typealias Output = Value.Output
//
//  let defaultValue: Value.Output?
//  let name: String
//  let valueParser: Value
//
//  @inlinable
//  init(
//    _ name: String,
//    _ value: Value,
//    default defaultValue: Value.Output? = nil
//  ) {
//    self.defaultValue = defaultValue
//    self.name = name
//    self.valueParser = value
//  }
//
//  @inlinable
//  init(
//    _ name: String,
//    default defaultValue: Value.Output? = nil
//  ) where Value == Rest<Substring> {
//    self.init(
//      name,
//      Rest(),
//      default: defaultValue
//    )
//  }
//
//  @inlinable
//  func parse(_ input: inout URLRequestData) throws -> Value.Output {
//    guard
//      let wrapped = input.query[self.name]?.first,
//      var value = wrapped
//    else {
//      guard let defaultValue = self.defaultValue else {
//        throw ParsingError("expected query to contain parameter \(self.name)", rest: "\(input.query)")
//      }
//      return defaultValue
//    }
//
//    let output: Value.Output
//    do {
//      output = try self.valueParser.parse(&value) as Value.Output
//    } catch let error as ParsingError {
//      throw ParsingError("query \"name\": \(error.message)", rest: "\(input.query["name"]?.first)")
//    } catch {
//      throw error
//    }
//
//    guard value.isEmpty else {
//      guard let defaultValue = self.defaultValue else {
//        throw ParsingError("expected to fully consume query \(self.name)", rest: "\(value)")
//      }
//      return defaultValue
//    }
//
//    input.query[self.name]?.removeFirst()
//    if input.query[self.name]?.isEmpty ?? true {
//      input.query[self.name] = nil
//    }
//    return output
//  }
//}
//
//struct Route<Parsers>: Parser
//where
//  Parsers: Parser,
//  Parsers.Input == URLRequestData
//{
//  typealias Input = Parsers.Input
//  typealias Output = Parsers.Output
//
//  let parsers: Parsers
//
//  @inlinable
//  init<Upstream, Route>(
//    _ transform: @escaping (Upstream.Output) -> Route,
//    @ParserBuilder with parsers: () -> Upstream
//  ) where Upstream.Input == URLRequestData, Parsers == Parsing.Parsers.Map<Upstream, Route> {
//    self.parsers = parsers().map(transform)
//  }
//
//  @inlinable
//  init<Upstream, Route>(
//    _ route: Route,
//    @ParserBuilder with parsers: () -> Upstream
//  )
//  where
//    Upstream.Input == URLRequestData,
//    Upstream.Output == Void,
//    Parsers == Parsing.Parsers.Map<Upstream, Route>
//  {
//    self.parsers = parsers().map { route }
//  }
//
//  @inlinable
//  init<Route>(_ route: Route) where Parsers == Always<URLRequestData, Route> {
//    self.parsers = Always<URLRequestData, Route>(route)
//  }
//
//  @inlinable
//  func parse(_ input: inout URLRequestData) -> Parsers.Output? {
//    let original = input
//    guard
//      let output = self.parsers.parse(&input),
//      input.path.isEmpty,
//      input.method == nil || Method.get.parse(&input) != nil
//    else {
//      input = original
//      return nil
//    }
//    return output
//  }
//}
//
//extension URLRequestData {
//  init?(request: URLRequest) {
//    guard
//      let url = request.url,
//      let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
//    else { return nil }
//
//    self.init(
//      method: request.httpMethod,
//      path: url.path.split(separator: "/")[...],
//      query: components.queryItems?.reduce(into: [:]) { query, item in
//        query[item.name, default: []].append(item.value?[...])
//      } ?? [:],
//      headers: request.allHTTPHeaderFields?.mapValues { $0[...] } ?? [:],
//      body: request.httpBody.map { ArraySlice($0) }
//    )
//  }
//
//  init?(url: URL) {
//    self.init(request: URLRequest(url: url))
//  }
//
//  init?(string: String) {
//    guard let url = URL(string: string)
//    else { return nil }
//    self.init(url: url)
//  }
//}
