/// Parses a request's body using a byte parser.
public struct Body<Bytes: Parser>: Parser where Bytes.Input == ArraySlice<UInt8> {
  @usableFromInline
  let bytesParser: Bytes

  @inlinable
  public init(@ParserBuilder _ bytesParser: () -> Bytes) {
    self.bytesParser = bytesParser()
  }

  /// Initializes a body parser from a byte conversion.
  ///
  /// Useful for parsing a request body in its entirety, for example as a JSON payload.
  ///
  /// ```swift
  /// struct Comment: Codable {
  ///   var author: String
  ///   var message: String
  /// }
  ///
  /// Body(.data.json(Comment.self))
  /// ```
  ///
  /// - Parameter bytesConversion: A conversion that transforms bytes into some other type.
  @inlinable
  public init<C>(_ bytesConversion: C)
  where Bytes == Parse<Parsers.MapConversion<Rest<Bytes.Input>, C>> {
    self.bytesParser = Parse(bytesConversion)
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) throws -> Bytes.Output {
    guard var body = input.body
    else { throw RoutingError() }

    let output = try self.bytesParser.parse(&body)
    input.body = body

    return output
  }
}

extension Body: ParserPrinter where Bytes: ParserPrinter {
  @inlinable
  public func print(_ output: Bytes.Output, into input: inout URLRequestData) rethrows {
    input.body = try self.bytesParser.print(output)
  }
}
