#if compiler(>=5.5)
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

  struct Body<Parsers>: Parser
  where
    Parsers: Parser,
    Parsers.Input == ArraySlice<UInt8>
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
        throw ParsingError()
      }

      let output = try self.bodyParser.parse(&body)

      guard body.isEmpty else {
        throw ParsingError()
      }

      input.body = nil
      return output
    }
  }

  extension Body: Printer where Parsers: Printer {
    @inlinable
    func print(_ output: Parsers.Output, to input: inout URLRequestData) rethrows {
      var body = input.body ?? []
      defer { input.body = body }
      try self.bodyParser.print(output, to: &body)
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
    func parse(_ input: inout ArraySlice<UInt8>) throws -> Value {
      let output = try decoder.decode(Value.self, from: Data(input))
      input = []
      return output
    }
  }

  extension JSON: Printer where Value: Encodable {
    @inlinable
    func print(_ output: Value, to input: inout ArraySlice<UInt8>) throws {
      input = .init(try encoder.encode(output))[...]
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
      else { throw ParsingError() }
      input.method = nil
    }
  }

  extension Method: Printer {
    @inlinable
    func print(_ output: (), to input: inout URLRequestData) throws {
      input.method = self.name
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
      guard var component = input.path.first
      else { throw ParsingError() }

      let output = try self.componentParser.parse(&component)

      guard component.isEmpty
      else { throw ParsingError() }

      input.path.removeFirst()
      return output
    }
  }

  extension Path: Printer where Component: Printer {
    @inlinable
    func print(_ output: Component.Output, to input: inout URLRequestData) rethrows {
      input.path.append(try self.componentParser.print(output))
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
        let wrapped = input.query[self.name]?.first,
        var value = wrapped
      else {
        return try defaultOrError(ParsingError())
      }

      let output: Value.Output
      do {
        output = try self.valueParser.parse(&value)
      } catch {
        return try defaultOrError(error)
      }

      guard value.isEmpty
      else {
        return try defaultOrError(ParsingError())
      }

      input.query[self.name]?.removeFirst()
      if input.query[self.name]?.isEmpty ?? true {
        input.query[self.name] = nil
      }

      return output
    }
  }

  extension Query: Printer where Value: Printer {
    @inlinable
    func print(_ output: Value.Output, to input: inout URLRequestData) rethrows {
      input.query[self.name, default: []].append(try self.valueParser.print(output))
    }
  }

  struct Route<Parsers>: Parser
  where
    Parsers: Parser,
    Parsers.Input == URLRequestData
  {
    let parsers: Parsers

    @inlinable
    init<Upstream, Route>(
      _ transform: @escaping (Upstream.Output) -> Route,
      @ParserBuilder with parsers: () -> Upstream
    ) where Parsers == Parsing.Parsers.Map<Upstream, Route> {
      self.parsers = parsers().map(transform)
    }

    @inlinable
    init<Upstream, Downstream>(
      _ conversion: Downstream,
      @ParserBuilder with parsers: () -> Upstream
    ) where Parsers == Parsing.Parsers.MapConversion<Upstream, Downstream> {
      self.parsers = parsers().map(conversion)
    }

    @inlinable
    init<Downstream>(
      _ conversion: Downstream
    ) where Parsers == Parsing.Parsers.MapConversion<Always<URLRequestData, Void>, Downstream> {
      self.parsers = Always(()).map(conversion)
    }

    @inlinable
    init<Upstream, Route>(
      _ route: Route,
      @ParserBuilder with parsers: () -> Upstream
    )
    where
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
        throw ParsingError()
      }

      return output
    }
  }

  extension Route: Printer where Parsers: Printer {
    @inlinable
    func print(_ output: Parsers.Output, to input: inout URLRequestData) rethrows {
      try self.parsers.print(output, to: &input)
      if input.method == nil {
        input.method = "GET"
      }
    }
  }
#endif
