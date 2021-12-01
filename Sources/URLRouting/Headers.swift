public struct Headers<FieldParsers>: Parser
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
  public func parse(_ input: inout URLRequestData) -> FieldParsers.Output? {
    self.fieldParsers.parse(&input.headers)
  }
}

extension Headers: Printer where FieldParsers: Printer {
  @inlinable
  public func print(_ output: FieldParsers.Output) -> URLRequestData? {
    self.fieldParsers.print(output).map { .init(headers: $0) }
  }
}
