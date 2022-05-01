/// Parses a request's query using field parsers.
///
/// For example, a search endpoint may include a few query items, which can be specified as fields:
///
/// ```swift
/// Query {
///   Field("q", .string, default: "")
///   Field("page", default: 1) {
///     Digits()
///   }
///   Field("per_page", default: 20) {
///     Digits()
///   }
/// }
/// ```
public struct Query<FieldParsers: Parser>: Parser
where FieldParsers.Input == URLRequestData.Fields {
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
