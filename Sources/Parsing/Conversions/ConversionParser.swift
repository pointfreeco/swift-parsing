extension Conversion {
  @inlinable
  public static func parse<P>(
    @ParserBuilder _ parser: () -> P
  ) -> Self where Self == Conversions.Parser<P> {
    .init(parser: parser())
  }

  @inlinable
  public func parse<P>(
    @ParserBuilder _ parser: () -> P
  ) -> Conversions.Map<Self, Conversions.Parser<P>> {
    self.map(.parse(parser))
  }
}

extension Conversions {
  public struct Parser<Upstream: ParserPrinter>: Conversion
  where Upstream.Input: PrependableCollection {
    public let parser: Upstream

    @inlinable
    public init(parser: Upstream) {
      self.parser = parser
    }

    @inlinable
    public func apply(_ input: Upstream.Input) rethrows -> Upstream.Output {
      // TODO: Should `End` *not* be baked in?
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
