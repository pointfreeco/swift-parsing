extension Parser {
  /// Returns a parser that runs this parser, pipes its output into the given parser, and returns
  /// the output of the given parser.
  ///
  /// - Parameter downstream: A parser that parses the output of this parser.
  /// - Returns: A parser that pipes this parser's output into another parser.  @inlinable
  public func pipe<Downstream>(
    @ParserBuilder _ build: () -> Downstream
  ) -> Parsers.Pipe<Self, Downstream> {
    .init(upstream: self, downstream: build())
  }
}

extension Parsers {
  /// A parser that runs this parser, pipes its output into the given parser, and returns the output
  /// of the given parser.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/pipe(_:)`` operation, which constructs this type.
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
    public func parse(_ input: inout Upstream.Input) -> Downstream.Output? {
      guard var downstreamInput = self.upstream.parse(&input)
      else { return nil }

      return self.downstream.parse(&downstreamInput)
    }
  }
}
