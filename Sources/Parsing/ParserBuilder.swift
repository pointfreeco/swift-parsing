@resultBuilder
public enum ParserBuilder {
  public static func buildBlock<P0: Parser>(_ r0: P0) -> P0 {
    r0
  }

  public static func buildEither<P0, P1>(
    first component: P0
  )
  -> Conditional<P0, P1>
  where
    P0.Input == P1.Input,
    P0.Output == P1.Output
  {
    Conditional.first(component)
  }

  public static func buildEither<P0, P1>(
    second component: P1
  )
  -> Conditional<P0, P1>
  where
    P0.Input == P1.Input,
    P0.Output == P1.Output
  {
    Conditional.second(component)
  }

  public static func buildLimitedAvailability<P: Parser>(_ component: P) -> Parsers.OptionalParser<P> {
    .init(component)
  }
}

public struct Parse<Parsers: Parser, NewOutput>: Parser {
  public let parsers: Parsers
  public let transform: (Parsers.Output) -> NewOutput

  public init(@ParserBuilder build: () -> Parsers) where Parsers.Output == NewOutput {
    self.parsers = build()
    self.transform = { $0 }
  }

  public init(
    _ transform: @escaping (Parsers.Output) -> NewOutput,
    @ParserBuilder build: () -> Parsers
  ) {
    self.parsers = build()
    self.transform = transform
  }

  public func parse(_ input: inout Parsers.Input) -> NewOutput? {
    self.parsers.parse(&input).map(self.transform)
  }
}
