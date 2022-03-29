extension Conversion {
  #warning("TODO: Should this be named differently to distinguish itself from 'Parser.parse'?")
  /// A conversion from a ``ParserPrinter``'s input to its output.
  ///
  /// This conversion forwards its ``apply(_:)`` and ``unapply(_:)`` methods to the underlying
  /// ``ParserPrinter``'s ``Parser/parse(_:)-6h1d0`` and ``ParserPrinter/print(_:)`` methods. It
  /// also requires the input to be fully parsed for the conversion to be successful.
  @inlinable
  public static func parse<P>(
    @ParserBuilder _ parser: () -> P
  ) -> Self where Self == Conversions.Parser<P> {
    .init(parser: parser())
  }

  #warning("TODO: Should this be named differently to distinguish itself from 'Parser.parse'?")
  /// Transforms this conversion's output to a new output by using the given ``ParserPrinter``.
  ///
  /// A fluent version of ``parse(_:)-swift.type.method``. Equivalent to calling ``map(_:)`` with
  /// ``parse(_:)-swift.type.method``:
  ///
  /// ```swift
  /// substringConversion.parse { Int.parser() }
  /// // =
  /// substringConversion.map(.parse { Int.parser() })
  /// ```
  @inlinable
  public func parse<P>(
    @ParserBuilder _ parser: () -> P
  ) -> Conversions.Map<Self, Conversions.Parser<P>> {
    self.map(.parse(parser))
  }
}

extension Conversions {
  /// A conversion from a ``ParserPrinter``'s input to its output.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/parse(_:)-swift.type.method`` operation, which constructs this type.
  public struct Parser<Upstream: ParserPrinter>: Conversion
  where Upstream.Input: PrependableCollection {
    public let parser: Upstream

    @inlinable
    public init(parser: Upstream) {
      self.parser = parser
    }

    @inlinable
    public func apply(_ input: Upstream.Input) rethrows -> Upstream.Output {
      try Parse {
        self.parser
        End<Upstream.Input>()
      }
      .parse(input)
    }

    @inlinable
    public func unapply(_ output: Upstream.Output) rethrows -> Upstream.Input {
      try self.parser.print(output)
    }
  }
}
