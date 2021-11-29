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
  public func parse(_ input: inout URLRequestData) -> BodyParser.Output? {
    // TODO: Should this consume the body (check if it's empty after parsing) and `nil` out `body`?
    guard
      var body = input.body,
      let output = self.bodyParser.parse(&body)
    else { return nil }

    input.body = body
    return output
  }
}

extension Body: Printer where BodyParser: Printer {
  @inlinable
  public func print(_ output: BodyParser.Output) -> URLRequestData? {
    self.bodyParser.print(output).map { .init(body: $0) }
  }
}
