extension Parser {
  @inlinable
  public func orElse<P>(_ parser: P) -> Parsers.OneOf<Self, P> {
    .init(self, parser)
  }
}

public struct OneOfMany<Upstream>: Parser where Upstream: Parser {
  public let parsers: [Upstream]

  @inlinable
  public init(_ parsers: [Upstream]) {
    self.parsers = parsers
  }

  @inlinable
  public init(_ parsers: Upstream...) {
    self.init(parsers)
  }

  @inlinable
  @inline(__always)
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    for parser in self.parsers {
      if let output = parser.parse(&input) {
        return output
      }
    }
    return nil
  }
}

extension Parsers {
  public struct OneOf<A, B>: Parser
  where
    A: Parser,
    B: Parser,
    A.Input == B.Input,
    A.Output == B.Output
  {
    public let a: A
    public let b: B

    @inlinable
    public init(_ a: A, _ b: B) {
      self.a = a
      self.b = b
    }

    @inlinable
    @inline(__always)
    public func parse(_ input: inout A.Input) -> A.Output? {
      if let output = self.a.parse(&input) { return output }
      if let output = self.b.parse(&input) { return output }
      return nil
    }
  }

  public typealias OneOfMany = Parsing.OneOfMany // NB: Convenience type alias for discovery
}
