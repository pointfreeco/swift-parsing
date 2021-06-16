extension Optional {
  @inlinable
  public static func parser<P>(of parser: P) -> Parsers.OptionalParser<P>
  where P: Parser, P.Output == Wrapped {
    .init(parser)
  }
}

extension Parsers {
  public struct OptionalParser<Upstream>: Parser where Upstream: Parser {
    public let upstream: Upstream

    @inlinable
    public init(_ upstream: Upstream) {
      self.upstream = upstream
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) async -> Upstream.Output?? {
      await .some(self.upstream.parse(&input))
    }
  }
}
