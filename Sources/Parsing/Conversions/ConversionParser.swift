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
