extension Parser {
  @inlinable
  public func flatMap<NewParser>(
    _ transform: @escaping (Output) -> NewParser
  ) -> Parsers.FlatMap<NewParser, Self> {
    .init(upstream: self, transform: transform)
  }
}

extension Parsers {
  public struct FlatMap<NewParser, Upstream>: Parser
  where
    NewParser: Parser,
    Upstream: Parser,
    NewParser.Input == Upstream.Input
  {
    public let upstream: Upstream
    public let transform: (Upstream.Output) -> NewParser

    @inlinable
    public init(upstream: Upstream, transform: @escaping (Upstream.Output) -> NewParser) {
      self.upstream = upstream
      self.transform = transform
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) async -> NewParser.Output? {
      let original = input
      guard let newParser = await self.upstream.parse(&input).map(self.transform)
      else { return nil }
      guard let output = await newParser.parse(&input)
      else {
        input = original
        return nil
      }
      return output
    }
  }
}
