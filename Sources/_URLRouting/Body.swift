import Foundation

/// Parses a request's body using a byte parser.
public struct Body<Bytes: Parser>: Parser where Bytes.Input == Data {
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
  where Bytes == Parsers.MapConversion<Parsers.ReplaceError<Rest<Bytes.Input>>, C> {
    self.bytesParser = Rest().replaceError(with: .init()).map(bytesConversion)
  }

  /// Initializes a body parser that parses the body as data in its entirety.
  @inlinable
  public init() where Bytes == Parsers.MapConversion<
    Parsers.ReplaceError<Rest<Bytes.Input>>, Conversions.Identity<Data>
  > {
    self.init(.init())
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
