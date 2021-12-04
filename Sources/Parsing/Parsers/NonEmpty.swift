extension Parser where Output: Collection {
  /// Transforms the receiver parser of a `Collection` into one that fails when the output is empty.
  @inlinable
  public var nonEmpty: Parsers.NonEmpty<Self> {
    .init(upstream: self)
  }
}

extension Parsers {
  /// A parser that fails when the output of another parser of a `Collection` type is empty.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/nonEmpty`` operation, which constructs this type.
  public struct NonEmpty<Upstream>: Parser where Upstream: Parser, Upstream.Output: Collection {
    public let upstream: Upstream

    @inlinable
    public init(upstream: Upstream) {
      self.upstream = upstream
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
      let original = input
      guard let parsed = upstream.parse(&input) else {
        return nil
      }
      if parsed.isEmpty {
        input = original
        return nil
      }
      return parsed
    }
  }
}
