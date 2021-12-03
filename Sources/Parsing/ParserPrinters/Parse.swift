public struct Parse<Group>: Parser where Group: Parser {
  public let parser: Group

  @inlinable
  public init(@ParserBuilder _ build: () -> Group) {
    self.parser = build()
  }

  @inlinable
  public init<Upstream, Downstream>(
    _ downstream: Downstream,
    @ParserBuilder from build: () -> Upstream
  ) where Group == Parsers.Pipe<Upstream, Downstream> {
    self.parser = build().pipe(downstream)
  }

  @inlinable
  public init<Upstream, Output>(
    _ transform: @escaping (Upstream.Output) -> Output,
    @ParserBuilder from build: () -> Upstream
  ) where Group == Parsers.Map<Upstream, Output> {
    self.parser = build().map(transform)
  }

  @inlinable
  public init<Upstream, Output>(
    _ output: Output,
    @ParserBuilder from build: () -> Upstream
  ) where Group == Parsers.Map<Upstream, Output>, Upstream.Output == Void {
    self.parser = build().map { output }
  }

  @inlinable
  public func parse(_ input: inout Group.Input) -> Group.Output? {
    self.parser.parse(&input)
  }
}

extension Parse: Printer where Group: Printer {
  @inlinable
  public func print(_ output: Group.Output) -> Group.Input? {
    self.parser.print(output)
  }
}
