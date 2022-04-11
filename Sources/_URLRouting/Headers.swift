/// Parses a request's headers using field parsers.
public struct Headers<FieldParsers: Parser>: Parser
where FieldParsers.Input == URLRequestData.Fields {
  @usableFromInline
  let fieldParsers: FieldParsers

  @inlinable
  public init(@ParserBuilder build: () -> FieldParsers) {
    self.fieldParsers = build()
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) rethrows -> FieldParsers.Output {
    try self.fieldParsers.parse(&input.headers)
  }
}

extension Headers: ParserPrinter where FieldParsers: ParserPrinter {
  @inlinable
  public func print(_ output: FieldParsers.Output, into input: inout URLRequestData) rethrows {
    try self.fieldParsers.print(output, into: &input.headers)
  }
}
