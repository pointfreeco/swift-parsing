public struct URLRequestData {
  public var body: ArraySlice<UInt8>?
  public var headers: [String: Substring]
  public var method: String?
  public var path: ArraySlice<Substring>
  public var query: [String: ArraySlice<Substring?>]

  public init(
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

public struct Body<BodyParser>: Parser
where
  BodyParser: Parser,
  BodyParser.Input == ArraySlice<UInt8>
{
  public let bodyParser: BodyParser

  @inlinable
  public init(@ParserBuilder _ bodyParser: () -> BodyParser) {
    self.bodyParser = bodyParser()
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> BodyParser.Output? {
    guard
      var body = input.body,
      let output = self.bodyParser.parse(&body),
      body.isEmpty
    else { return nil }

    input.body = nil
    return output
  }
}

public struct Header<ValueParser>: Parser
where
  ValueParser: Parser,
  ValueParser.Input == Substring
{
  public let name: String
  public let valueParser: ValueParser

  public init(
    _ name: String,
    _ value: ValueParser
  ) {
    self.name = name
    self.valueParser = value
  }

  @inlinable
  public init(_ name: String) where ValueParser == Rest<Substring> {
    self.init(name, Rest())
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> ValueParser.Output? {
    guard
      var value = input.headers[self.name],
      let output = self.valueParser.parse(&value),
      value.isEmpty
    else { return nil }

    input.headers[self.name]?.removeFirst()
    return output
  }
}

public struct Method: Parser {
  public let name: String

  public static let get = Self("GET")
  public static let post = Self("POST")
  public static let put = Self("PUT")
  public static let patch = Self("PATCH")
  public static let delete = Self("DELETE")

  @inlinable
  public init(_ name: String) {
    self.name = name.uppercased()
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> Void? {
    guard input.method?.uppercased() == self.name else { return nil }
    input.method = nil
    return ()
  }
}

public struct Path<ComponentParser>: Parser
where
  ComponentParser: Parser,
  ComponentParser.Input == Substring
{
  public let componentParser: ComponentParser

  @inlinable
  public init(_ component: ComponentParser) {
    self.componentParser = component
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> ComponentParser.Output? {
    guard
      var component = input.path.first,
      let output = self.componentParser.parse(&component),
      component.isEmpty
    else { return nil }

    input.path.removeFirst()
    return output
  }
}

public struct PathEnd: Parser {
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout URLRequestData) -> Void? {
    guard input.path.isEmpty
    else { return nil }
    return ()
  }
}

public struct Query<ValueParser>: Parser
where
  ValueParser: Parser,
  ValueParser.Input == Substring
{
  public let name: String
  public let valueParser: ValueParser

  @inlinable
  public init(
    _ name: String,
    _ value: ValueParser
  ) {
    self.name = name
    self.valueParser = value
  }

  @inlinable
  public init(_ name: String) where ValueParser == Rest<Substring> {
    self.init(name, Rest())
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> ValueParser.Output? {
    guard
      let wrapped = input.query[self.name]?.first,
      var value = wrapped,
      let output = self.valueParser.parse(&value),
      value.isEmpty
    else { return nil }

    input.headers[self.name]?.removeFirst()
    return output
  }
}

public struct Routing<RouteParser, Route>: Parser
where
  RouteParser: Parser,
  RouteParser.Input == URLRequestData
{
  public let parser: Zip2_OV<Parsers.Map<RouteParser, Route>, PathEnd>

  @inlinable
  public init(
    _ route: @escaping (RouteParser.Output) -> Route,
    @ParserBuilder to parser: () -> RouteParser
  ) {
    self.parser = Zip2_OV(parser().map(route), PathEnd())
  }

  @inlinable
  public init(
    _ route: Route,
    @ParserBuilder to parser: () -> RouteParser
  ) where RouteParser.Output == Void {
    self.init({ route }, to: parser)
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> Route? {
    self.parser.parse(&input)
  }
}
