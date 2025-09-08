extension Parser {
  /// Returns a parser that runs this parser, pipes its output into the given parser, and returns
  /// the output of the given parser.
  ///
  /// For example, we can try to parse an integer of exactly 4 digits by piping the output of
  /// ``Prefix`` into an `Int.parser()`:
  ///
  /// ```swift
  /// let year = Prefix(4).pipe { Int.parser() }
  ///
  /// try year.parse("2022")  // 2022
  /// try year.parse("0123")  // 123
  /// ```
  ///
  /// This parser fails if either the upstream or downstream parser fails. For example:
  ///
  /// ```swift
  /// try year.parse("123")
  /// // error: unexpected input
  /// //  --> input:1:4
  /// // 1 | 123
  /// //   |    ^ expected 1 more element
  ///
  /// try year.parse("fail!")
  /// // error: unexpected input
  /// //  --> input:1:1-4
  /// // 1 | fail!
  /// //   | ^^^^ pipe: expected integer
  /// ```
  ///
  /// - Parameter downstream: A parser that parses the output of this parser.
  /// - Returns: A parser that pipes this parser's output into another parser.  @inlinable
  public func pipe<Downstream>(
    @ParserBuilder<Output> _ build: () -> Downstream
  ) -> Parsers.Pipe<Self, Downstream> {
    .init(upstream: self, downstream: build())
  }
}

extension Parser where Input: Collection {
  public func pipe<Downstream>(
    @ParserBuilder<Output> _ build: () -> Downstream
  ) -> Parsers.Pipe<Self, ParserBuilder<Input>.SkipSecond<Downstream, Parsers.PipeEnd<Self.Input>>>
  {
    .init(
      upstream: self,
      downstream: .init(build(), Parsers.PipeEnd<Input>())
    )
  }
}

extension Parsers {
  /// A parser that runs this parser, pipes its output into the given parser, and returns the output
  /// of the given parser.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/pipe(_:)-2zck4`` operation, which constructs this type.
  public struct Pipe<Upstream: Parser, Downstream: Parser>: Parser
  where Upstream.Output == Downstream.Input {
    public let upstream: Upstream
    public let downstream: Downstream

    @inlinable
    public init(upstream: Upstream, downstream: Downstream) {
      self.upstream = upstream
      self.downstream = downstream
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) rethrows -> Downstream.Output {
      try self.downstream.parse(self.upstream.parse(&input))
    }
  }

  public struct PipeEnd<Input: Collection>: Parser {
    @usableFromInline
    init() {}

    @inlinable
    public func parse(_ input: inout Input) throws {
      guard input.isEmpty else {
        throw ParsingError.expectedInput("end of pipe", from: input, to: input[input.endIndex...])
      }
    }
  }
}

extension Parsers.Pipe: ParserPrinter
where
  Upstream: ParserPrinter,
  Downstream: ParserPrinter,
  Upstream.Output: _EmptyInitializable
{
  @inlinable
  public func print(_ output: Downstream.Output, into input: inout Upstream.Input) rethrows {
    try self.upstream.print(self.downstream.print(output), into: &input)
  }
}

extension Parsers.PipeEnd: ParserPrinter {
  @inlinable
  public func print(_ output: (), into input: inout Input) throws {
    guard input.isEmpty else {
      let description = describe(input).map { "\n\n\($0.debugDescription)" } ?? ""
      throw PrintingError.failed(
        summary: """
          round-trip expectation failed

          A piped parser-printer expected no more input, but more was printed.\(description)

          During a round-trip, the piped parser-printer would have failed to parse at this \
          remaining input.
          """,
        input: input
      )
    }
  }
}

extension Parsers.Pipe: Sendable where Upstream: Sendable, Downstream: Sendable { }
