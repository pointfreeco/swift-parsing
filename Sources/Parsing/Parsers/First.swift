/// A parser that consumes the first element from a collection. Fails on an empty collection.
///
///     First<Substring>().parse("Hello"[...]) // (output: "H", rest: "ello")
public struct First<Input>: Parser
where
  Input: Collection,
  Input.SubSequence == Input
{
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout Input) -> Input.Element? {
    guard let first = input.first else { return nil }
    input.removeFirst()
    return first
  }
}

extension Parsers {
  public typealias First = Parsing.First // NB: Convenience type alias for discovery
}
