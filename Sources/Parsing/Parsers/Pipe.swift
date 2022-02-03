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
    public func parse(_ input: inout Upstream.Input) rethrows -> Downstream.Output {
      let original = input
      var downstreamInput = try self.upstream.parse(&input)
      do {
        return try self.downstream.parse(&downstreamInput)
      } catch let ParsingError.failed(reason, context) {
        throw ParsingError.failed(
          "pipe: \(reason)",
          .init(
            originalInput: original,
            remainingInput: input,
            debugDescription: context.debugDescription,
            underlyingError: ParsingError.failed(reason, context)
          )
        )
      }
    }
  }
}

//extension Parsers.Pipe: Printer
//where
//Upstream: Printer,
//Downstream: Printer
//{
//  // Downstream<B, C>
//  // Upstream<A, B>
//  // Upstream.Output == Downstream.Input
//
//  public func print(_ output: Downstream.Output, to input: inout Upstream.Input) throws {
//    var x: Downstream.Input!
//    try self.downstream.print(output, to: &x)
//    try self.upstream.print(x, to: &input)
//  }
//}
