/// A custom parameter attribute that constructs a parser that attempts to run a number of parsers,
/// one after the other, till one succeeds with an output.
///
/// See ``OneOf`` for an entry point into this builder.
@resultBuilder
public enum OneOfBuilder {
  /// Provides support for `for`-`in` loops in ``OneOfBuilder`` blocks.
  ///
  /// Useful for building up a parser from a dynamic source, like for a case-iterable enum:
  ///
  /// ```swift
  /// enum Role: String, CaseIterable {
  ///   case admin
  ///   case guest
  ///   case member
  /// }
  ///
  /// let roleParser = Parse {
  ///   for role in Role.allCases {
  ///     status.rawValue.map { role }
  ///   }
  /// }
  /// ```
  @inlinable
  public static func buildArray<P>(_ parsers: [P]) -> Parsers.OneOfMany<P> {
    .init(parsers)
  }

  /// Provides support for specifying a parser in ``OneOfBuilder`` blocks.
  @inlinable
  static public func buildBlock<P: Parser>(_ parser: P) -> P {
    parser
  }

  /// Provides support for `if`-`else` statements in ``OneOfBuilder`` blocks, producing a
  /// conditional parser for the `if` branch.
  ///
  /// ```swift
  /// OneOf {
  ///   if useLegacyParser {
  ///     LegacyParser()
  ///   } else {
  ///     NewParser()
  ///   }
  /// }
  /// ```
  @inlinable
  public static func buildEither<TrueParser, FalseParser>(
    first parser: TrueParser
  ) -> Parsers.Conditional<TrueParser, FalseParser> {
    .first(parser)
  }

  /// Provides support for `if`-`else` statements in ``OneOfBuilder`` blocks, producing a
  /// conditional parser for the `if` branch.
  ///
  /// ```swift
  /// OneOf {
  ///   if useLegacyParser {
  ///     LegacyParser()
  ///   } else {
  ///     NewParser()
  ///   }
  /// }
  /// ```
  @inlinable
  public static func buildEither<TrueParser, FalseParser>(
    second parser: FalseParser
  ) -> Parsers.Conditional<TrueParser, FalseParser> {
    .second(parser)
  }

  /// Provides support for `if` statements in ``OneOfBuilder`` blocks, producing an optional parser.
  ///
  /// ```swift
  /// let whitespace = OneOf {
  ///   if shouldParseNewlines {
  ///     "\r\n"
  ///     "\r"
  ///     "\n"
  ///   }
  ///
  ///   " "
  ///   "\t"
  /// }
  /// ```
  @inlinable
  public static func buildIf<P>(_ parser: P?) -> OptionalOneOf<P> {
    .init(wrapped: parser)
  }

  /// Provides support for `if #available` statements in ``OneOfBuilder`` blocks, producing an
  /// optional parser.
  @inlinable
  public static func buildLimitedAvailability<P>(_ parser: P?) -> OptionalOneOf<P> {
    .init(wrapped: parser)
  }

  /// A parser that parses output from an optional parser.
  ///
  /// You won't typically construct this parser directly, but instead will use standard `if`
  /// statements in a ``OneOfBuilder`` block to automatically build optional parsers:
  ///
  /// ```swift
  /// let whitespace = OneOf {
  ///   if shouldParseNewlines {
  ///     "\r\n"
  ///     "\r"
  ///     "\n"
  ///   }
  ///
  ///   " "
  ///   "\t"
  /// }
  /// ```
  public struct OptionalOneOf<Wrapped: Parser>: Parser {
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
