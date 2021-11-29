public struct Query<FieldParsers>: Parser
where
  FieldParsers: Parser,
  FieldParsers.Input == [String: ArraySlice<Substring?>]
{
  @usableFromInline
  let fieldParsers: FieldParsers

  @inlinable
  public init(@ParserBuilder build: () -> FieldParsers) {
    self.fieldParsers = build()
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> FieldParsers.Output? {
    self.fieldParsers.parse(&input.query)
  }
}

extension Query: Printer where FieldParsers: Printer {
  @inlinable
  public func print(_ output: FieldParsers.Output) -> URLRequestData? {
    self.fieldParsers.print(output).map { .init(query: $0) }
  }
}
