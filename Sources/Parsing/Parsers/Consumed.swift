/// A parser that returns the subsequence of input consumed by another parser.
public struct Consumed<Upstream: Parser>: Parser
where
  Upstream.Input: Collection,
  Upstream.Input.SubSequence == Upstream.Input
{
  public let upstream: Upstream

  @inlinable
  public init(@ParserBuilder<Input> _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) rethrows -> Upstream.Input {
    let original = input
    _ = try self.upstream.parse(&input)
    return original[..<input.startIndex]
  }
}
