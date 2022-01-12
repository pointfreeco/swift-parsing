/// A parser that discards the output of another parser.
public struct Skip<Parsers>: Parser where Parsers: Parser {
  /// The parser from which this parser receives output.
  public let parsers: Parsers

  @inlinable
  public init(@ParserBuilder _ build: () -> Parsers) {
    self.parsers = build()
  }

  @inlinable
  public func parse(_ input: inout Parsers.Input) -> Void? {
    guard self.parsers.parse(&input) != nil else { return nil }
    return ()
  }
}

extension Skip: Printer where Parsers: Printer, Parsers.Output == Void {
  public func print(_ output: ()) -> Parsers.Input? {
    self.parsers.print()
  }
}

extension Parsers {
  public typealias Skip = Parsing.Skip  // NB: Convenience type alias for discovery
}
