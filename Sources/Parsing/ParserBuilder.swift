@resultBuilder
public enum ParserBuilder {
  @inlinable
  public static func buildBlock<P>(_ parser: P) -> P where P: Parser {
    parser
  }

  @inlinable
  public static func buildEither<TrueParser, FalseParser>(
    first parser: TrueParser
  ) -> Conditional<TrueParser, FalseParser>
  where
    TrueParser: Parser,
    FalseParser: Parser
  {
    .first(parser)
  }

  @inlinable
  public static func buildEither<TrueParser, FalseParser>(
    second parser: FalseParser
  ) -> Conditional<TrueParser, FalseParser>
  where
    TrueParser: Parser,
    FalseParser: Parser
  {
    .second(parser)
  }

  public static func buildIf<P>(
    _ parser: P?
  ) -> Conditional<P, Parsers.Fail<P.Input, P.Output>>
  where P: Parser
  {
    if let parser = parser {
      return .first(parser)
    } else {
      return .second(.init())
    }
  }

  @inlinable
  public static func buildLimitedAvailability<P>(_ component: P) -> Parsers.OptionalParser<P>
  where P: Parser {
    .init(component)
  }
}

public struct Parse<Body, Output>: Parser where Body: Parser {
  public let body: Body
  public let transform: (Body.Output) -> Output

  @inlinable
  public init(
    _ transform: @escaping (Body.Output) -> Output,
    @ParserBuilder with build: () -> Body
  ) {
    self.transform = transform
    self.body = build()
  }

  @inlinable
  public func parse(_ input: inout Body.Input) -> Output? {
    self.body.parse(&input).map(self.transform)
  }
}

extension Parse where Body.Output == Void {
  @inlinable
  public init(
    _ output: Output,
    @ParserBuilder with build: () -> Body
  ) {
    self.init({ output }, with: build)
  }
}

extension Parse where Body.Output == Output {
  @inlinable
  public init(@ParserBuilder with build: () -> Body) {
    self.init({ $0 }, with: build)
  }
}

@resultBuilder
public enum OneOfBuilder {
  @inlinable
  public static func buildArray<P>(_ parsers: [P]) -> OneOfMany<P> where P: Parser {
    OneOfMany(parsers)
  }

  @inlinable
  static public func buildBlock<P>(_ parser: P) -> P where P: Parser {
    parser
  }

  @inlinable
  public static func buildEither<TrueParser, FalseParser>(
    first parser: TrueParser
  ) -> Conditional<TrueParser, FalseParser>
  where
    TrueParser: Parser,
    FalseParser: Parser
  {
    .first(parser)
  }

  @inlinable
  public static func buildEither<TrueParser, FalseParser>(
    second parser: FalseParser
  ) -> Conditional<TrueParser, FalseParser>
  where
    TrueParser: Parser,
    FalseParser: Parser
  {
    .second(parser)
  }

  public static func buildIf<P>(
    _ parser: P?
  ) -> Conditional<P, Parsers.Fail<P.Input, P.Output>>
  where P: Parser
  {
    if let parser = parser {
      return .first(parser)
    } else {
      return .second(.init())
    }
  }

  @inlinable
  public static func buildLimitedAvailability<P>(_ component: P) -> Parsers.OptionalParser<P>
  where P: Parser {
    .init(component)
  }
}

public struct OneOf<Upstream>: Parser where Upstream: Parser {
  public let upstream: Upstream

  @inlinable
  public init(@OneOfBuilder _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    self.upstream.parse(&input)
  }
}
