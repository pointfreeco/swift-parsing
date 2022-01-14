@resultBuilder
public enum OneOfBuilder {
  @inlinable
  public static func buildArray<P>(_ parsers: [P]) -> Parsers.OneOfMany<P> {
    .init(parsers)
  }

  @inlinable
  static public func buildBlock<P>(_ parser: P) -> P where P: Parser {
    parser
  }

  @inlinable
  public static func buildEither<TrueParser, FalseParser>(
    first parser: TrueParser
  ) -> Conditional<TrueParser, FalseParser> {
    .first(parser)
  }

  @inlinable
  public static func buildEither<TrueParser, FalseParser>(
    second parser: FalseParser
  ) -> Conditional<TrueParser, FalseParser> {
    .second(parser)
  }

  @inlinable
  public static func buildIf<P>(_ parser: P?) -> Conditional<P, Fail<P.Input, P.Output>> {
    parser.map(Conditional.first) ?? .second(.init())
  }

  @inlinable
  public static func buildLimitedAvailability<P>(
    _ parser: P?
  ) -> Conditional<P, Fail<P.Input, P.Output>> {
    parser.map(Conditional.first) ?? .second(.init())
  }
}
