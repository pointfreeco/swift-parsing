extension Parser {
  @inlinable
  public func backtracking() -> Parsers.Backtracking<Self> {
    .init(upstream: self)
  }
}

extension Parsers {
  public struct Backtracking<Upstream: Parser>: Parser {
    public let upstream: Upstream

    @inlinable
    public init(upstream: Upstream) {
      self.upstream = upstream
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) rethrows -> Upstream.Output {
      let original = input
      do {
        return try self.upstream.parse(&input)
      } catch {
        input = original
        throw error
      }
    }
  }
}
