/// A custom parameter attribute that constructs parsers from closures. The constructed parser
/// runs a number of parsers, one after the other, and accumulates their outputs.
///
/// The ``Parse`` parser acts as an entry point into `@ParserBuilder` syntax, where you can list
/// all of the parsers you want to run. For example, to parse two comma-separated integers:
///
/// ```swift
/// try Parse {
///   Int.parser()
///   ","
///   Int.parser()
/// }
/// .parse("123,456") // (123, 456)
/// ```
@resultBuilder
public enum ParserBuilder {
  @inlinable
  public static func buildExpression<P: Parser>(_ parser: P) -> P {
    parser
  }

  @inlinable
  public static func buildExpression<P: Parser>(_ parser: P) -> P where P.Input == Substring {
    parser
  }

  @inlinable
  public static func buildExpression<P: Parser>(_ parser: P) -> FromUTF8View<P> {
    .init(upstream: parser)
  }

  @inlinable
  public static func buildBlock() -> Always<Substring, Void> {
    .init(())
  }

  /// Provides support for specifying a parser in ``ParserBuilder`` blocks.
  @inlinable
  public static func buildBlock<P: Parser>(_ parser: P) -> P {
    parser
  }

  /// Provides support for `if`-`else` statements in ``ParserBuilder`` blocks, producing a
  /// conditional parser for the `if` branch.
  ///
  /// ```swift
  /// Parse {
  ///   "Hello"
  ///   if shouldParseComma {
  ///     ", "
  ///   } else {
  ///     " "
  ///   }
  ///   Rest()
  /// }
  /// ```
  @inlinable
  public static func buildEither<TrueParser, FalseParser>(
    first parser: TrueParser
  ) -> Parsers.Conditional<TrueParser, FalseParser> {
    .first(parser)
  }

  /// Provides support for `if`-`else` statements in ``ParserBuilder`` blocks, producing a
  /// conditional parser for the `else` branch.
  ///
  /// ```swift
  /// Parse {
  ///   "Hello"
  ///   if shouldParseComma {
  ///     ", "
  ///   } else {
  ///     " "
  ///   }
  ///   Rest()
  /// }
  /// ```
  @inlinable
  public static func buildEither<TrueParser, FalseParser>(
    second parser: FalseParser
  ) -> Parsers.Conditional<TrueParser, FalseParser> {
    .second(parser)
  }

  /// Provides support for `if` statements in ``ParserBuilder`` blocks, producing an optional
  /// parser.
  @inlinable
  public static func buildIf<P: Parser>(_ parser: P?) -> P? {
    parser
  }

  /// Provides support for `if` statements in ``ParserBuilder`` blocks, producing a void parser for
  /// a given void parser.
  ///
  /// ```swift
  /// Parse {
  ///   "Hello"
  ///   if shouldParseComma {
  ///     ","
  ///   }
  ///   " "
  ///   Rest()
  /// }
  /// ```
  @inlinable
  public static func buildIf<P>(_ parser: P?) -> Parsers.OptionalVoid<P> {
    .init(wrapped: parser)
  }

  /// Provides support for `if #available` statements in ``ParserBuilder`` blocks, producing an
  /// optional parser.
  @inlinable
  public static func buildLimitedAvailability<P: Parser>(_ parser: P?) -> P? {
    parser
  }

  /// Provides support for `if #available` statements in ``ParserBuilder`` blocks, producing a void
  /// parser for a given void parser.
  @inlinable
  public static func buildLimitedAvailability<P>(_ parser: P?) -> Parsers.OptionalVoid<P> {
    .init(wrapped: parser)
  }
}

public struct FromUTF8View<Upstream: Parser>: Parser
where Upstream.Input == Substring.UTF8View {
  public let upstream: Upstream

  @usableFromInline
  init(upstream: Upstream) {
    self.upstream = upstream
  }

  @inlinable
  @inline(__always)
  public func parse(_ input: inout Substring) rethrows -> Upstream.Output {
    try self.upstream.parse(&input.utf8)
  }
}

extension FromUTF8View: ParserPrinter where Upstream: ParserPrinter {
  public func print(_ output: Upstream.Output, into input: inout Substring) rethrows {
    try self.upstream.print(output, into: &input.utf8)
  }
}
