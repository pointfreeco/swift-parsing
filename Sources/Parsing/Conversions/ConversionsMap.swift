extension Conversion {
  @inlinable
  public func map<C>(_ downstream: C) -> Conversions.Map<Self, C> {
    .init(upstream: self, downstream: downstream)
  }
}

extension Conversions {
  public struct Map<Upstream, Downstream>: Conversion
  where
    Upstream: Conversion,
    Downstream: Conversion,
    Upstream.Output == Downstream.Input
  {
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
