import Foundation
import Parsing

struct URLRequestData {
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
  func parse(_ input: inout ArraySlice<UInt8>) -> Value? {
    guard
      let output = try? decoder.decode(Value.self, from: Data(input))
    else { return nil }
    input = []
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
  func parse(_ input: inout URLRequestData) -> Void? {
    guard input.method?.uppercased() == self.name else { return nil }
    input.method = nil
    return ()
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

struct Route<RouteParser, Route>: Parser
where
  RouteParser: Parser,
  RouteParser.Input == URLRequestData
{
  let parser: Parse<Zip2_OV<Parsers.Map<RouteParser, Route>, PathEnd>>

  @inlinable
  init(
    _ route: @escaping (RouteParser.Output) -> Route,
    @ParserBuilder to parser: () -> RouteParser
  ) {
    self.parser = Parse {
      parser().map(route)
      PathEnd()
    }
  }

  @inlinable
  init(
    _ route: Route,
    @ParserBuilder to parser: () -> RouteParser
  ) where RouteParser.Output == Void {
    self.init({ route }, to: parser)
  }

  @inlinable
  init(
    _ route: Route
  ) where RouteParser == Always<URLRequestData, Void> {
    self.init({ route }, to: { Always<URLRequestData, Void>(()) })
  }

  @inlinable
  func parse(_ input: inout URLRequestData) -> Route? {
    self.parser.parse(&input)
  }
}
