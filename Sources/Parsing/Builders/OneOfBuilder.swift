/// A custom parameter attribute that constructs a parser that attempts to run a number of parsers,
/// one after the other, till one succeeds with an output.
///
/// See ``OneOf`` for an entry point into this builder.
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
  public static func buildIf<P>(_ parser: P?) -> OptionalOneOf<P> {
    .init(wrapped: parser)
  }

  @inlinable
  public static func buildLimitedAvailability<P>(_ parser: P?) -> OptionalOneOf<P> {
    .init(wrapped: parser)
  }

  public struct OptionalOneOf<Wrapped>: Parser where Wrapped: Parser {
    @usableFromInline
    let wrapped: Wrapped?

    @usableFromInline
    init(wrapped: Wrapped?) {
      self.wrapped = wrapped
    }

    @inlinable
    public func parse(_ input: inout Wrapped.Input) throws -> Wrapped.Output {
      guard let wrapped = self.wrapped
      else { throw ParsingError.manyFailed([], at: input) }
      return try wrapped.parse(&input)
    }
  }
}
