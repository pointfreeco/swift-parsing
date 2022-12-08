/// A custom parameter attribute that constructs parsers from closures. The constructed parser
/// runs each parser in the closure, one after another, till one succeeds with an output.
///
/// The ``OneOf`` parser acts as an entry point into `@OneOfBuilder` syntax where you can list
/// all of the parsers you want to try. For example, to parse a currency symbol into an enum
/// of supported currencies:
///
/// ```swift
/// enum Currency { case eur, gbp, usd }
/// let currency = OneOf {
///   "€".map { Currency.eur }
///   "£".map { Currency.gbp }
///   "$".map { Currency.usd }
/// }
/// let money = Parse { currency; Digits() }
///
/// try currency.parse("$100") // (.usd, 100)
/// ```
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
  /// let roleParser = OneOf {
  ///   for role in Role.allCases {
  ///     role.rawValue.map { role }
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

  #if swift(<5.7)
    @inlinable
    static public func buildBlock<P0: Parser, P1: Parser>(_ p0: P0, _ p1: P1) -> OneOf2<P0, P1> {
      OneOf2(p0, p1)
    }
  #endif

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

  @inlinable
  public static func buildPartialBlock<P0: Parser>(first: P0) -> P0 {
    first
  }

  @inlinable
  public static func buildPartialBlock<P0, P1>(accumulated: P0, next: P1) -> OneOf2<P0, P1> {
    .init(accumulated, next)
  }

  public struct OneOf2<P0: Parser, P1: Parser>: Parser
  where P0.Input == P1.Input, P0.Output == P1.Output {
    public let p0: P0, p1: P1

    @inlinable public init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      let original = input
      do { return try self.p0.parse(&input) } catch let e0 {
        do {
          input = original
          return try self.p1.parse(&input)
        } catch let e1 {
          throw ParsingError.manyFailed(
            [e0, e1], at: input
          )
        }
      }
    }
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

extension OneOfBuilder.OneOf2: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(_ output: P0.Output, into input: inout P0.Input) rethrows {
    let original = input
    do { try self.p1.print(output, into: &input) } catch let e1 {
      do {
        input = original
        try self.p0.print(output, into: &input)
      } catch let e0 {
        throw PrintingError.manyFailed(
          [e1, e0], at: input
        )
      }
    }
  }
}

extension OneOfBuilder.OptionalOneOf: ParserPrinter where Wrapped: ParserPrinter {
  @inlinable
  public func print(_ output: Wrapped.Output, into input: inout Wrapped.Input) throws {
    guard let wrapped = self.wrapped
    else { throw PrintingError.manyFailed([], at: input) }
    try wrapped.print(output, into: &input)
  }
}
