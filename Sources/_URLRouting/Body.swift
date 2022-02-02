public struct Body<BodyParser>: Parser
where
  BodyParser: Parser,
  BodyParser.Input == ArraySlice<UInt8>
{
  @usableFromInline
  let bodyParser: BodyParser

  @inlinable
  public init(@ParserBuilder _ bodyParser: () -> BodyParser) {
    self.bodyParser = bodyParser()
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) throws -> BodyParser.Output {
    guard var body = input.body
    else { throw RoutingError() }

    let output = try self.bodyParser.parse(&body)
    input.body = body

    return output
  }
}

extension Body: Printer where BodyParser: Printer {
  @inlinable
  public func print(_ output: BodyParser.Output, to input: inout URLRequestData) rethrows {
    input.body = try self.bodyParser.print(output)
  }
}
