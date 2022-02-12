/// A parser that attempts to run a number of parsers to accumulate their outputs.
public struct Parse<Parsers>: Parser where Parsers: Parser {
  public let parsers: Parsers

  @inlinable
  public init(@ParserBuilder _ build: () -> Parsers) {
    self.parsers = build()
  }

  @inlinable
  public init<Upstream, NewOutput>(
    _ transform: @escaping (Upstream.Output) -> NewOutput,
    @ParserBuilder with build: () -> Upstream
  ) where Parsers == Parsing.Parsers.Map<Upstream, NewOutput> {
    self.parsers = build().map(transform)
  }

  @inlinable
  public init<Upstream, NewOutput>(
    _ output: NewOutput,
    @ParserBuilder with build: () -> Upstream
  ) where Upstream.Output == Void, Parsers == Parsing.Parsers.Map<Upstream, NewOutput> {
    self.parsers = build().map { output }
  }

  @inlinable
  public func parse(_ input: inout Parsers.Input) -> Parsers.Output? {
    self.parsers.parse(&input)
  }
}

extension Parse {
  /// Equivalent to ``Parse/init(_:)`` with each component separated from the next one by a
  /// `separator` parser.
  @inlinable
  public init<Separator>(
    @SeparatedParserBuilder<Separator> build: () -> (Separator) -> Parsers,
    @ParserBuilder separator: () -> Separator
  ) where Separator: Parser {
    self.parsers = build()(separator())
  }

  /// Equivalent to ``Parse/init(_:with:)`` with each component separated from the next one by a
  /// `separator` parser.
  @inlinable
  public init<Upstream, NewOutput, Separator>(
    _ transform: @escaping (Upstream.Output) -> NewOutput,
    @SeparatedParserBuilder<Separator> build: () -> (Separator) -> Upstream,
    @ParserBuilder separator: () -> Separator
  ) where Parsers == Parsing.Parsers.Map<Upstream, NewOutput>, Separator: Parser {
    self.parsers = build()(separator()).map(transform)
  }

  /// Equivalent to ``Parse/init(_:with:)`` with each component separated from the next one by a
  /// `separator` parser.
  @inlinable
  public init<Upstream, NewOutput, Separator>(
    _ output: NewOutput,
    @SeparatedParserBuilder<Separator> build: () -> (Separator) -> Upstream,
    @ParserBuilder separator: () -> Separator
  )
  where
    Upstream.Output == Void, Parsers == Parsing.Parsers.Map<Upstream, NewOutput>,
    Separator: Parser
  {
    self.parsers = build()(separator()).map { output }
  }
}
