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

extension Headers: Printer where FieldParsers: Printer {
  @inlinable
  public func print(_ output: FieldParsers.Output, to input: inout URLRequestData) rethrows {
    try self.fieldParsers.print(output, to: &input.headers)
  }
}
