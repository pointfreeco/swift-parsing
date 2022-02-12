/// A custom parameter attribute that constructs a parser that attempts to run a number of parsers,
/// one after the other, and accumulates their outputs.
///
/// See ``Parse`` for an entry point into this builder.
@resultBuilder
public class ParserBuilder {
  @inlinable
  public static func buildBlock<P>(_ parser: P) -> P where P: Parser {
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
  public static func buildIf<P>(_ parser: P?) -> P? where P: Parser {
    parser
  }

  @inlinable
  public static func buildIf<P>(_ parser: P?) -> Parsers.OptionalVoid<P> {
    .init(wrapped: parser)
  }

  @inlinable
  public static func buildLimitedAvailability<P>(_ parser: P?) -> P? where P: Parser {
    parser
  }

  @inlinable
  public static func buildLimitedAvailability<P>(_ parser: P?) -> Parsers.OptionalVoid<P> {
    .init(wrapped: parser)
  }
}

/// A specialization of ``ParserBuilder``, adapted to build parsers separated by a common separator.
///
/// See ``ParserBuilder`` for more information about this type, and the ``Parse`` parser `separated`
/// overloads for an entry point into this builder.
@resultBuilder
public final class SeparatedParserBuilder<Separator>: ParserBuilder where Separator: Parser {}

