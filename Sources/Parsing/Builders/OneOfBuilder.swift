@resultBuilder
public enum OneOfBuilder {
  @inlinable
  public static func buildArray<P>(_ parsers: [P]) -> Parsers.OneOfMany<P> where P: Parser {
    .init(parsers)
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

  @inlinable
  public static func buildIf<P>(_ parser: P?) -> P? where P: Parser {
    parser
  }

  @inlinable
  public static func buildLimitedAvailability<P>(_ component: P) -> Optionally<P>
  where P: Parser {
    .init { component }
  }
}
