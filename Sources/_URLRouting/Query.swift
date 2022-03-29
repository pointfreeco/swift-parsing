public struct Query<FieldParsers: Parser<URLRequestData.Fields>>: Parser {
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

extension Query: ParserPrinter where FieldParsers: ParserPrinter {
  @inlinable
  public func print(_ output: FieldParsers.Output, into input: inout URLRequestData) rethrows {
    try self.fieldParsers.print(output, into: &input.query)
  }
}
