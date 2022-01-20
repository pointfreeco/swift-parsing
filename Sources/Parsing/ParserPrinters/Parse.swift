/// A parser that attempts to run a number of parsers to accumulate their outputs.
public struct Parse<Parsers>: Parser where Parsers: Parser {
  public let parsers: Parsers

  @inlinable
  public init(@ParserBuilder with build: () -> Parsers) {
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
  public init<Upstream, Downstream>(
    _ conversion: Downstream,
    @ParserBuilder with build: () -> Upstream
  ) where Parsers == Parsing.Parsers.MapConversion<Upstream, Downstream> {
    self.parsers = build().map(conversion)
  }

  @inlinable
  public init<Upstream, NewOutput>(
    _ output: NewOutput,
    @ParserBuilder with build: () -> Upstream
  ) where Upstream.Output == Void, Parsers == Parsing.Parsers.Map<Upstream, NewOutput> {
    self.parsers = build().map { output }
  }

  @inlinable
  public func parse(_ input: inout Parsers.Input) rethrows -> Parsers.Output {
    try self.parsers.parse(&input)
  }
}

extension Parse: Printer where Parsers: Printer {
  @inlinable
  public func print(_ output: Parsers.Output, to input: inout Parsers.Input) rethrows {
    try self.parsers.print(output, to: &input)
  }
}
