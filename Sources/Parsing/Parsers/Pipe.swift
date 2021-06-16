extension Parser {
  /// Returns a parser that runs this parser, pipes its output into the given parser, and returns
  /// the output of the given parser.
  ///
  /// - Parameter downstream: A parser that parses the output of this parser.
  /// - Returns: A parser that pipes this parser's output into another parser.
  @inlinable
  public func pipe<Downstream>(_ downstream: Downstream) -> Parsers.Pipe<Self, Downstream> {
    .init(upstream: self, downstream: downstream)
  }
}

extension Parsers {
  public struct Pipe<Upstream, Downstream>: Parser
  where
    Upstream: Parser,
    Downstream: Parser,
    Upstream.Output == Downstream.Input
  {
    public let upstream: Upstream
    public let downstream: Downstream

    @inlinable
    public init(upstream: Upstream, downstream: Downstream) {
      self.upstream = upstream
      self.downstream = downstream
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) async -> Downstream.Output? {
      let original = input

      guard var downstreamInput = await self.upstream.parse(&input)
      else { return nil }

      guard let output = await self.downstream.parse(&downstreamInput)
      else {
        input = original
        return nil
      }

      return output
    }
  }
}
