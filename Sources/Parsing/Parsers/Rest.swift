/// A parser that consumes everything to the end of the collection and returns it as its output.
public struct Rest<Input>: Parser
where
  Input: Collection,
  Input.SubSequence == Input
{
  @inlinable
  public init() {}

  @inlinable
  public init() where Input == Substring {}

  @inlinable
  public init() where Input == Substring.UTF8View {}

  @inlinable
  public func parse(_ input: inout Input) -> Input? {
    let output = input
    input.removeFirst(input.count)
    return output
  }
}

extension Parsers {
  public typealias Rest = Parsing.Rest  // NB: Convenience type alias for discovery
}
