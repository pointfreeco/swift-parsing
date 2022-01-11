/// A parser that discards the output of another parser.
public struct Skip<Upstream>: Parser where Upstream: Parser {
  /// The parser from which this parser receives output.
  public let upstream: Upstream

  @inlinable
  public init(@ParserBuilder _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Void? {
    guard self.upstream.parse(&input) != nil else { return nil }
    return ()
  }
}

extension Parsers {
  public typealias Skip = Parsing.Skip  // NB: Convenience type alias for discovery
}
