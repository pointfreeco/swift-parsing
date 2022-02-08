@testable import Parsing
import XCTest

struct RoutingError: LocalizedError {
  var errorDescription: String?

  init(expect errorDescription: String) {
    self.errorDescription = errorDescription
  }
}

class URLRequestRoutingTests: XCTestCase {
  func testURLRequestRouting() throws {
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
    struct Comment: Decodable, Equatable {
      let commenter: String
      let message: String
    }

    let router = OneOf {
      Route(AppRoute.home)

      Route(AppRoute.contactUs) {
        Path(FromUTF8View { "contact-us".utf8 })
      }

      Route(AppRoute.episodes) {
        Path(FromUTF8View { "episodes".utf8 })

        OneOf {
          Route(Episodes.index)

          Route(Episodes.episode) {
            Path(Int.parser())

            OneOf {
              Route(Episode.show)

              Route(Episode.comments) {
                Path(FromUTF8View { "comments".utf8 })

                OneOf {
                  Route(Comments.post) {
                    Method.post
                    Body {
                      JSON(Comment.self)
                    }
                  }

                  Route(Comments.show) {
                    Query("count", Int.parser(), default: 10)
                  }
                }
              }
            }
          }
        }
      }
    }

    var request = URLRequestData(string: "episodes/hello")!
    XCTAssertThrowsError(try router.parse(&request)) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected path component
         --> input[1]
        1 | ["episodes", "hello"]
          |               ^ expected integer

        error: unexpected path component
         --> input[1]
        1 | ["episodes", "hello"]
          |              ^ expected end of path

        error: unexpected path component
         --> input[0]
        0 | ["episodes", "hello"]
          |   ^ expected "contact-us"

        error: unexpected path component
         --> input[0]
        0 | ["episodes", "hello"]
          |  ^ expected end of path
        """,
        "\(error)"
      )
    }
  }
}

struct URLRequestData {
  var body: Slice<[UInt8]>?
  var headers: [String: Substring]
  var method: String?
  var path: Slice<[Substring]>
  var query: [String: Slice<[Substring]>]

  init(
    method: String? = nil,
    path: Slice<[Substring]> = .init([]),
    query: [String: Slice<[Substring]>] = [:],
    headers: [String: Substring] = [:],
    body: Slice<[UInt8]>? = nil
  ) {
    self.method = method
    self.path = path
    self.query = query
    self.headers = headers
    self.body = body
  }
}

struct Body<Parsers>: Parser
where
  Parsers: Parser,
  Parsers.Input == Slice<[UInt8]>
{
  let bodyParser: Parsers

  @inlinable
  init(@ParserBuilder _ bodyParser: () -> Parsers) {
    self.bodyParser = bodyParser()
  }

  @inlinable
  func parse(_ input: inout URLRequestData) throws -> Parsers.Output {
    guard var body = input.body
    else {
      throw RoutingError(expect: "HTTP body to be present")
    }

    let output = try self.bodyParser.parse(&body)

    guard body.isEmpty else {
      throw RoutingError(
        expect: """
          HTTP body to have been fully parsed (\(body.count) bytes remaining)
          """
      )
    }

    input.body = nil
    return output
  }
}

struct JSON<Value: Decodable>: Parser {
  let decoder: JSONDecoder

  @inlinable
  init(
    _ type: Value.Type,
    decoder: JSONDecoder = .init()
  ) {
    self.decoder = decoder
  }

  @inlinable
  func parse(_ input: inout Slice<[UInt8]>) throws -> Value {
    let output = try decoder.decode(Value.self, from: Data(input))
    input = .init([])
    return output
  }
}

struct Method: Parser {
  let name: String

  static let get = Self("GET")
  static let post = Self("POST")
  static let put = Self("PUT")
  static let patch = Self("PATCH")
  static let delete = Self("DELETE")

  @inlinable
  init(_ name: String) {
    self.name = name.uppercased()
  }

  @inlinable
  func parse(_ input: inout URLRequestData) throws {
    guard input.method?.uppercased() == self.name
    else {
      throw RoutingError(expect: "Method \(self.name)")
    }
    input.method = nil
  }
}

struct Path<Component>: Parser
where
  Component: Parser,
  Component.Input == Substring
{
  let componentParser: Component

  @inlinable
  init(_ component: Component) {
    self.componentParser = component
  }

  @inlinable
  func parse(_ input: inout URLRequestData) throws -> Component.Output {
    var component = input.path.first ?? ""
    do {
      let output = try Parse {
        self.componentParser
        End()
      }
      .parse(&component)
      input.path.removeFirst()
      return output
    } catch let ParsingError.failed(reason, context) {
      var path = input.path
      if !path.isEmpty { path[path.startIndex] = component }
      throw ParsingError.failed(
        reason,
        .init(
          remainingInput: path,
          debugDescription: "unexpected path component",
          underlyingError: ParsingError.failed(reason, context)
        )
      )
    } catch {
      throw error
    }
  }
}

struct PathEnd: Parser {
  @inlinable
  init() {}

  @inlinable
  func parse(_ input: inout URLRequestData) throws {
    guard input.path.isEmpty
    else { throw RoutingError(expect: "path to be empty") }
  }
}

struct Query<Value>: Parser
where
  Value: Parser,
  Value.Input == Substring
{
  let defaultValue: Value.Output?
  let name: String
  let valueParser: Value

  @inlinable
  init(
    _ name: String,
    _ value: Value,
    default defaultValue: Value.Output? = nil
  ) {
    self.defaultValue = defaultValue
    self.name = name
    self.valueParser = value
  }

  @inlinable
  init(
    _ name: String,
    default defaultValue: Value.Output? = nil
  ) where Value == Rest<Substring> {
    self.init(
      name,
      Rest(),
      default: defaultValue
    )
  }

  @inlinable
  func parse(_ input: inout URLRequestData) throws -> Value.Output {
    func defaultOrError(_ error: Error) throws -> Value.Output {
      guard let defaultValue = self.defaultValue
      else {
        throw error
      }
      return defaultValue
    }

    guard
      var value = input.query[self.name]?.first
    else {
      return try defaultOrError(RoutingError(expect: "query item named \"\(self.name)\""))
    }

    let output: Value.Output
    do {
      output = try self.valueParser.parse(&value)
    } catch {
      return try defaultOrError(error)
    }

    guard value.isEmpty
    else {
      return try defaultOrError(
        RoutingError(
          expect: """
            to have fully consumed "\(input.query[self.name]!.first!)" from query item named \
            "\(self.name)"; remaining: "\(value)"
            """
        )
      )
    }

    input.query[self.name]?.removeFirst()
    if input.query[self.name]?.isEmpty ?? true {
      input.query[self.name] = nil
    }
    return output
  }
}

struct Route<Parsers: Parser>: Parser where Parsers.Input == URLRequestData {
  let parsers: Parsers

  @inlinable
  init<Upstream, Route>(
    _ transform: @escaping (Upstream.Output) -> Route,
    @ParserBuilder with parsers: () -> Upstream
  ) where Upstream.Input == URLRequestData, Parsers == Parsing.Parsers.Map<Upstream, Route> {
    self.parsers = parsers().map(transform)
  }

  @inlinable
  init<Upstream, Route>(
    _ route: Route,
    @ParserBuilder with parsers: () -> Upstream
  )
  where
    Upstream.Input == URLRequestData,
    Upstream.Output == Void,
    Parsers == Parsing.Parsers.Map<Upstream, Route>
  {
    self.parsers = parsers().map { route }
  }

  @inlinable
  init<Route>(_ route: Route) where Parsers == Always<URLRequestData, Route> {
    self.parsers = Always<URLRequestData, Route>(route)
  }

  @inlinable
  func parse(_ input: inout URLRequestData) throws -> Parsers.Output {
    let output = try self.parsers.parse(&input)
    guard
      input.method == nil || (try? Method.get.parse(&input)) != nil,
      input.path.isEmpty
    else {
      throw ParsingError.failed(
        "expected end of path",
        .init(
          remainingInput: input.path,
          debugDescription: "unexpected path component"
        )
      )
    }

    return output
  }
}

extension URLRequestData {
  init?(request: URLRequest) {
    guard
      let url = request.url,
      let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
    else { return nil }

    self.init(
      method: request.httpMethod,
      path: .init(url.path.split(separator: "/").map { String($0)[...] }),
      query: components.queryItems?.reduce(into: [:]) { query, item in
        query[item.name, default: .init()].append(item.value?[...] ?? "")
      } ?? [:],
      headers: request.allHTTPHeaderFields?.mapValues { $0[...] } ?? [:],
      body: request.httpBody.map { .init($0) }
    )
  }

  init?(url: URL) {
    self.init(request: URLRequest(url: url))
  }

  init?(string: String) {
    guard let url = URL(string: string)
    else { return nil }
    self.init(url: url)
  }
}
