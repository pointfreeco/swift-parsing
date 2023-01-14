/// A parser that discards the output of another parser.
public struct Skip<Parsers: Parser>: Parser {
  /// The parser from which this parser receives output.
  public let parsers: Parsers

  @inlinable
  public init(@ParserBuilder<Parsers.Input> _ build: () -> Parsers) {
    self.parsers = build()
  }

  @inlinable
  public func parse(_ input: inout Parsers.Input) rethrows {
    _ = try self.parsers.parse(&input)
  }
}

extension Skip: ParserPrinter where Parsers: ParserPrinter, Parsers.Output == Void {
  @inlinable
  public func print(_ output: (), into input: inout Parsers.Input) rethrows {
    try self.parsers.print(into: &input)
  }
}

extension Parsers {
  public typealias Skip = Parsing.Skip  // NB: Convenience type alias for discovery
}
