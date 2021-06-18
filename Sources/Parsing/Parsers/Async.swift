@available(macOS 12, iOS 15, *)
extension Parser where Input: RangeReplaceableCollection {
  public var async: AsyncParser<Self> {
    .init(upstream: self)
  }
}

@available(macOS 12, iOS 15, *)
public struct AsyncParser<Upstream>
where
  Upstream: Parser,
  Upstream.Input: RangeReplaceableCollection
{
  public let upstream: Upstream

  public init(upstream: Upstream) {
    self.upstream = upstream
  }

  public func parse<S>(_ sequence: S) async throws -> [Upstream.Output]?
  where
    S: AsyncSequence,
    S.Element: RangeReplaceableCollection,
    S.Element.SubSequence == Upstream.Input
  {
    var buffer = Upstream.Input()
    var outputs: [Upstream.Output] = []
    for try await chunk in sequence {
      buffer.append(contentsOf: chunk)
      while let output = self.upstream.parse(&buffer) {
        outputs.append(output)
      }
    }
    return outputs
  }
}
