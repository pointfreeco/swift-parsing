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

  @inlinable
  public static func buildPartialBlock<P: Parser>(first: P) -> P {
    first
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1>(accumulated: P0, next: P1) -> SkipFirst<P0, P1> {
    .init(accumulated, next)
  }

  @inlinable
  public static func buildPartialBlock<P0, P1>(accumulated: P0, next: P1) -> SkipSecond<P0, P1> {
    .init(accumulated, next)
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1>(accumulated: P0, next: P1) -> Take2<P0, P1> {
    .init(accumulated, next)
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1>(
    accumulated: P0, next: P1
  ) -> Take3<P0, P1, O0, O1> {
    .init(accumulated, next)
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2>(
    accumulated: P0, next: P1
  ) -> Take4<P0, P1, O0, O1, O2> {
    .init(accumulated, next)
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3>(
    accumulated: P0, next: P1
  ) -> Take5<P0, P1, O0, O1, O2, O3> {
    .init(accumulated, next)
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3, O4>(
    accumulated: P0, next: P1
  ) -> Take6<P0, P1, O0, O1, O2, O3, O4> {
    .init(accumulated, next)
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3, O4, O5>(
    accumulated: P0, next: P1
  ) -> Take7<P0, P1, O0, O1, O2, O3, O4, O5> {
    .init(accumulated, next)
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3, O4, O5, O6>(
    accumulated: P0, next: P1
  ) -> Take8<P0, P1, O0, O1, O2, O3, O4, O5, O6> {
    .init(accumulated, next)
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3, O4, O5, O6, O7>(
    accumulated: P0, next: P1
  ) -> Take9<P0, P1, O0, O1, O2, O3, O4, O5, O6, O7> {
    .init(accumulated, next)
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3, O4, O5, O6, O7, O8>(
    accumulated: P0, next: P1
  ) -> Take10<P0, P1, O0, O1, O2, O3, O4, O5, O6, O7, O8> {
    .init(accumulated, next)
  }

  public struct SkipFirst<P0: Parser, P1: Parser>: Parser
  where P0.Input == P1.Input, P0.Output == Void {
    @usableFromInline let p0: P0, p1: P1

    @usableFromInline init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P1.Output {
      do {
        try self.p0.parse(&input)
        return try self.p1.parse(&input)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }

  public struct SkipSecond<P0: Parser, P1: Parser>: Parser
  where P0.Input == P1.Input, P1.Output == Void {
    @usableFromInline let p0: P0, p1: P1

    @usableFromInline init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      do {
        let o0 = try self.p0.parse(&input)
        try self.p1.parse(&input)
        return o0
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }

  public struct Take2<P0: Parser, P1: Parser>: Parser
  where
    P0.Input == P1.Input
  {
    @usableFromInline let p0: P0, p1: P1

    @usableFromInline init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (P0.Output, P1.Output) {
      do {
        return try (
          self.p0.parse(&input),
          self.p1.parse(&input)
        )
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }

  public struct Take3<P0: Parser, P1: Parser, O0, O1>: Parser
  where P0.Input == P1.Input, P0.Output == (O0, O1) {
    @usableFromInline let p0: P0, p1: P1

    @usableFromInline init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (O0, O1, P1.Output) {
      do {
        let (o0, o1) = try self.p0.parse(&input)
        return try (o0, o1, self.p1.parse(&input))
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }

  public struct Take4<P0: Parser, P1: Parser, O0, O1, O2>: Parser
  where P0.Input == P1.Input, P0.Output == (O0, O1, O2) {
    @usableFromInline let p0: P0, p1: P1

    @usableFromInline init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (O0, O1, O2, P1.Output) {
      do {
        let (o0, o1, o2) = try self.p0.parse(&input)
        return try (o0, o1, o2, self.p1.parse(&input))
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }

  public struct Take5<P0: Parser, P1: Parser, O0, O1, O2, O3>: Parser
  where P0.Input == P1.Input, P0.Output == (O0, O1, O2, O3) {
    @usableFromInline let p0: P0, p1: P1

    @usableFromInline init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (O0, O1, O2, O3, P1.Output) {
      do {
        let (o0, o1, o2, o3) = try self.p0.parse(&input)
        return try (o0, o1, o2, o3, self.p1.parse(&input))
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }

  public struct Take6<P0: Parser, P1: Parser, O0, O1, O2, O3, O4>: Parser
  where P0.Input == P1.Input, P0.Output == (O0, O1, O2, O3, O4) {
    @usableFromInline let p0: P0, p1: P1

    @usableFromInline init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      O0, O1, O2, O3, O4, P1.Output
    ) {
      do {
        let (o0, o1, o2, o3, o4) = try self.p0.parse(&input)
        return try (o0, o1, o2, o3, o4, self.p1.parse(&input))
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }

  public struct Take7<P0: Parser, P1: Parser, O0, O1, O2, O3, O4, O5>: Parser
  where P0.Input == P1.Input, P0.Output == (O0, O1, O2, O3, O4, O5) {
    @usableFromInline let p0: P0, p1: P1

    @usableFromInline init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      O0, O1, O2, O3, O4, O5, P1.Output
    ) {
      do {
        let (o0, o1, o2, o3, o4, o5) = try self.p0.parse(&input)
        return try (o0, o1, o2, o3, o4, o5, self.p1.parse(&input))
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }

  public struct Take8<P0: Parser, P1: Parser, O0, O1, O2, O3, O4, O5, O6>: Parser
  where P0.Input == P1.Input, P0.Output == (O0, O1, O2, O3, O4, O5, O6) {
    @usableFromInline let p0: P0, p1: P1

    @usableFromInline init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      O0, O1, O2, O3, O4, O5, O6, P1.Output
    ) {
      do {
        let (o0, o1, o2, o3, o4, o5, o6) = try self.p0.parse(&input)
        return try (o0, o1, o2, o3, o4, o5, o6, self.p1.parse(&input))
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }

  public struct Take9<P0: Parser, P1: Parser, O0, O1, O2, O3, O4, O5, O6, O7>: Parser
  where P0.Input == P1.Input, P0.Output == (O0, O1, O2, O3, O4, O5, O6, O7) {
    @usableFromInline let p0: P0, p1: P1

    @usableFromInline init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      O0, O1, O2, O3, O4, O5, O6, O7, P1.Output
    ) {
      do {
        let (o0, o1, o2, o3, o4, o5, o6, o7) = try self.p0.parse(&input)
        return try (o0, o1, o2, o3, o4, o5, o6, o7, self.p1.parse(&input))
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }

  public struct Take10<P0: Parser, P1: Parser, O0, O1, O2, O3, O4, O5, O6, O7, O8>: Parser
  where P0.Input == P1.Input, P0.Output == (O0, O1, O2, O3, O4, O5, O6, O7, O8) {
    @usableFromInline let p0: P0, p1: P1

    @usableFromInline init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      O0, O1, O2, O3, O4, O5, O6, O7, O8, P1.Output
    ) {
      do {
        let (o0, o1, o2, o3, o4, o5, o6, o7, o8) = try self.p0.parse(&input)
        return try (o0, o1, o2, o3, o4, o5, o6, o7, o8, self.p1.parse(&input))
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder.SkipFirst: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(_ output: P1.Output, into input: inout P0.Input) rethrows {
    try self.p1.print(output, into: &input)
    try self.p0.print(into: &input)
  }
}

extension ParserBuilder.SkipSecond: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(_ output: P0.Output, into input: inout P0.Input) rethrows {
    try self.p1.print(into: &input)
    try self.p0.print(output, into: &input)
  }
}

extension ParserBuilder.Take2: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(_ output: (P0.Output, P1.Output), into input: inout P0.Input) rethrows {
    try self.p1.print(output.1, into: &input)
    try self.p0.print(output.0, into: &input)
  }
}

extension ParserBuilder.Take3: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(_ output: (O0, O1, P1.Output), into input: inout P0.Input) rethrows {
    try self.p1.print(output.2, into: &input)
    try self.p0.print((output.0, output.1), into: &input)
  }
}

extension ParserBuilder.Take4: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(_ output: (O0, O1, O2, P1.Output), into input: inout P0.Input) rethrows {
    try self.p1.print(output.3, into: &input)
    try self.p0.print((output.0, output.1, output.2), into: &input)
  }
}

extension ParserBuilder.Take5: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(_ output: (O0, O1, O2, O3, P1.Output), into input: inout P0.Input) rethrows {
    try self.p1.print(output.4, into: &input)
    try self.p0.print((output.0, output.1, output.2, output.3), into: &input)
  }
}

extension ParserBuilder.Take6: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(
    _ output: (O0, O1, O2, O3, O4, P1.Output),
    into input: inout P0.Input
  ) rethrows {
    try self.p1.print(output.5, into: &input)
    try self.p0.print((output.0, output.1, output.2, output.3, output.4), into: &input)
  }
}

extension ParserBuilder.Take7: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(
    _ output: (O0, O1, O2, O3, O4, O5, P1.Output),
    into input: inout P0.Input
  ) rethrows {
    try self.p1.print(output.6, into: &input)
    try self.p0.print((output.0, output.1, output.2, output.3, output.4, output.5), into: &input)
  }
}

extension ParserBuilder.Take8: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(
    _ output: (O0, O1, O2, O3, O4, O5, O6, P1.Output),
    into input: inout P0.Input
  ) rethrows {
    try self.p1.print(output.7, into: &input)
    try self.p0.print(
      (output.0, output.1, output.2, output.3, output.4, output.5, output.6),
      into: &input
    )
  }
}

extension ParserBuilder.Take9: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(
    _ output: (O0, O1, O2, O3, O4, O5, O6, O7, P1.Output),
    into input: inout P0.Input
  ) rethrows {
    try self.p1.print(output.8, into: &input)
    try self.p0.print(
      (output.0, output.1, output.2, output.3, output.4, output.5, output.6, output.7),
      into: &input
    )
  }
}

extension ParserBuilder.Take10: ParserPrinter where P0: ParserPrinter, P1: ParserPrinter {
  @inlinable
  public func print(
    _ output: (O0, O1, O2, O3, O4, O5, O6, O7, O8, P1.Output),
    into input: inout P0.Input
  ) rethrows {
    try self.p1.print(output.9, into: &input)
    try self.p0.print(
      (output.0, output.1, output.2, output.3, output.4, output.5, output.6, output.7, output.8),
      into: &input
    )
  }
}
