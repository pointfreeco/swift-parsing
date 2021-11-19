import Foundation
import Parsing

struct URLRequestData: Equatable {
  var body: ArraySlice<UInt8>?
  var headers: [String: Substring]
  var method: String?
  var path: ArraySlice<Substring>
  var query: [String: ArraySlice<Substring?>]

  init(
    method: String? = nil,
    path: ArraySlice<Substring> = [],
    query: [String: ArraySlice<Substring?>] = [:],
    headers: [String: Substring] = [:],
    body: ArraySlice<UInt8>? = nil
  ) {
    self.method = method
    self.path = path
    self.query = query
    self.headers = headers
    self.body = body
  }
}

extension URLRequestData: Appendable {
  init() {
    self.init(method: nil, path: [], query: [:], headers: [:], body: nil)
  }

  mutating func append(contentsOf other: URLRequestData) {
    if let body = other.body {
      if self.body != nil {
        self.body?.append(contentsOf: other.body ?? [])
      } else {
        self.body = body
      }
    }
    self.headers.merge(other.headers, uniquingKeysWith: { lhs, rhs in lhs })
    self.method = self.method ?? other.method
    self.path.append(contentsOf: other.path)
    self.query.merge(other.query, uniquingKeysWith: +)
  }
}

struct Body<BodyParser>: Parser
where
  BodyParser: Parser,
  BodyParser.Input == ArraySlice<UInt8>
{
  let bodyParser: BodyParser

  @inlinable
  init(@ParserBuilder _ bodyParser: () -> BodyParser) {
    self.bodyParser = bodyParser()
  }

  @inlinable
  func parse(_ input: inout URLRequestData) -> BodyParser.Output? {
    guard
      var body = input.body,
      let output = self.bodyParser.parse(&body),
      body.isEmpty
    else { return nil }

    input.body = nil
    return output
  }
}

extension Body: Printer where BodyParser: Printer {
  func print(_ output: BodyParser.Output) -> URLRequestData? {
    self.bodyParser.print(output).map { .init(body: $0) }
  }
}

struct JSON<Value: Decodable>: Parser {
  let decoder: JSONDecoder
  let encoder: JSONEncoder

  @inlinable
  init(
    _ type: Value.Type,
    decoder: JSONDecoder = .init(),
    encoder: JSONEncoder = .init()
  ) {
    self.decoder = decoder
    self.encoder = encoder
  }

  @inlinable
  func parse(_ input: inout ArraySlice<UInt8>) -> Value? {
    guard
      let output = try? self.decoder.decode(Value.self, from: Data(input))
    else { return nil }
    input = []
    return output
  }
}

extension JSON: Printer where Value: Encodable {
  @inlinable
  func print(_ output: Value) -> ArraySlice<UInt8>? {
    guard
      let input = try? self.encoder.encode(output)
    else { return nil }
    return .init(input)
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
  func parse(_ input: inout URLRequestData) -> Void? {
    guard input.method?.uppercased() == self.name else { return nil }
    input.method = nil
    return ()
  }
}

extension Method: Printer {
  @inlinable
  func print(_ output: Void) -> URLRequestData? {
    .init(method: self.name)
  }
}

struct Path<ComponentParser>: Parser
where
  ComponentParser: Parser,
  ComponentParser.Input == Substring
{
  let componentParser: ComponentParser

  @inlinable
  init(_ component: ComponentParser) {
    self.componentParser = component
  }

  @inlinable
  func parse(_ input: inout URLRequestData) -> ComponentParser.Output? {
    guard
      var component = input.path.first,
      let output = self.componentParser.parse(&component),
      component.isEmpty
    else { return nil }

    input.path.removeFirst()
    return output
  }
}

extension Path: Printer where ComponentParser: Printer {
  func print(_ output: ComponentParser.Output) -> URLRequestData? {
    self.componentParser.print(output).map { .init(path: [$0]) }
  }
}

struct PathEnd: Parser {
  @inlinable
  init() {}

  @inlinable
  func parse(_ input: inout URLRequestData) -> Void? {
    guard input.path.isEmpty
    else { return nil }
    return ()
  }
}

extension PathEnd: Printer {
  func print(_ output: Void) -> URLRequestData? {
    .init()
  }
}

struct Query<ValueParser>: Parser
where
  ValueParser: Parser,
  ValueParser.Input == Substring
{
  let defaultValue: ValueParser.Output?
  let name: String
  let valueParser: ValueParser

  @inlinable
  init(
    _ name: String,
    _ value: ValueParser,
    default defaultValue: ValueParser.Output? = nil
  ) {
    self.defaultValue = defaultValue
    self.name = name
    self.valueParser = value
  }

  @inlinable
  init(
    _ name: String,
    default defaultValue: ValueParser.Output? = nil
  ) where ValueParser == Rest<Substring> {
    self.init(
      name,
      Rest(),
      default: defaultValue
    )
  }

  @inlinable
  func parse(_ input: inout URLRequestData) -> ValueParser.Output? {
    guard
      let wrapped = input.query[self.name]?.first,
      var value = wrapped,
      let output = self.valueParser.parse(&value),
      value.isEmpty
    else { return defaultValue }

    input.query[self.name]?.removeFirst()
    if input.query[self.name]?.isEmpty ?? true {
      input.query[self.name] = nil
    }
    return output
  }
}

// TODO: Use `AnyEquatable` box to avoid forcing conformance.
extension Query: Printer where ValueParser: Printer, ValueParser.Output: Equatable {
  @inlinable
  func print(_ output: ValueParser.Output) -> URLRequestData? {
    guard output != self.defaultValue else { return .init() }
    return self.valueParser.print(output).map { .init(query: [self.name: [$0]]) }
  }
}

struct Routing<RouteParser, Route>: Parser
where
  RouteParser: Parser,
  RouteParser.Input == URLRequestData
{
  let parser: Parse<Zip2_OV<Parsers.Pipe<RouteParser, CasePath<Route, RouteParser.Output>>, PathEnd>>

  @inlinable
  init(
    _ route: CasePath<Route, RouteParser.Output>,
    @ParserBuilder to parser: () -> RouteParser
  ) {
    self.parser = Parse {
      parser().pipe(route)
      PathEnd()
    }
  }

//  @inlinable
//  init(
//    _ route: CasePath<Route, RouteParser.Output>
//  ) where RouteParser == Always<URLRequestData, Void> {
//    self.init(route, to: { Always<URLRequestData, Void>(()) })
//  }

  @inlinable
  func parse(_ input: inout URLRequestData) -> Route? {
    self.parser.parse(&input)
  }
}

extension Routing: Printer where RouteParser: Printer {
  @inlinable
  func print(_ output: Route) -> URLRequestData? {
    self.parser.print(output)
  }
}
