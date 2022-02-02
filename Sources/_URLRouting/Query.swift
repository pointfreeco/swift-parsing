public struct Query<FieldParsers>: Parser
where
  FieldParsers: Parser,
  FieldParsers.Input == URLRequestData.Fields
{
  @usableFromInline
  let fieldParsers: FieldParsers

  @inlinable
  public init(@ParserBuilder build: () -> FieldParsers) {
    self.fieldParsers = build()
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) rethrows -> FieldParsers.Output {
    try self.fieldParsers.parse(&input.query)
  }
}

extension Query: Printer where FieldParsers: Printer {
  @inlinable
  public func print(_ output: FieldParsers.Output, to input: inout URLRequestData) rethrows {
    try self.fieldParsers.print(output, to: &input.query)
  }
}
