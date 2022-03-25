extension Conversion {
  /// Returns a conversion that transforms the output of this conversion with a given downstream
  /// conversion.
  ///
  /// This method is the ``Conversion``-equivalent version of ``Parser/map(_:)-18m9d``.
  ///
  /// This method is similar to `Sequence.map`, `Optional.map`, and `Result.map` in the Swift
  /// standard library, as well as `Publisher.map` in the Combine framework. This method is also
  /// similar to the `map` functions on ``Parser`` and ``ParserPrinter``, espec
  ///
  /// - Parameter downstream: A conversion that transforms the output of this conversion into some
  ///   new output.
  /// - Returns: A conversion that transforms the input of this conversion into the output of the
  ///   given conversion.
  @inlinable
  public func map<C>(_ downstream: C) -> Conversions.Map<Self, C> {
    .init(upstream: self, downstream: downstream)
  }
}

extension Conversions {
  /// A conversion that composes two conversions together by composing their `apply` functions and
  /// `unapply` functions together.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/map(_:)`` operation, which constructs this type.
  public struct Map<Upstream: Conversion, Downstream: Conversion>: Conversion
  where Upstream.Output == Downstream.Input {
    public let upstream: Upstream
    public let downstream: Downstream

    @usableFromInline
    init(upstream: Upstream, downstream: Downstream) {
      self.upstream = upstream
      self.downstream = downstream
    }

    @inlinable
    @inline(__always)
    public func apply(_ input: Upstream.Input) rethrows -> Downstream.Output {
      try self.downstream.apply(self.upstream.apply(input))
    }

    @inlinable
    @inline(__always)
    public func unapply(_ output: Downstream.Output) rethrows -> Upstream.Input {
      try self.upstream.unapply(self.downstream.unapply(output))
    }
  }
}
