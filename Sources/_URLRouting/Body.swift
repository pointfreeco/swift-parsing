public struct Body<Bytes: Parser>: Parser where Bytes.Input == ArraySlice<UInt8> {
  @usableFromInline
  let bytesParser: Bytes

  @inlinable
  public init(@ParserBuilder _ bytesParser: () -> Bytes) {
    self.bytesParser = bytesParser()
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

extension Body: Printer where Bytes: Printer {
  @inlinable
  public func print(_ output: Bytes.Output, to input: inout URLRequestData) rethrows {
    input.body = try self.bytesParser.print(output)
  }
}
