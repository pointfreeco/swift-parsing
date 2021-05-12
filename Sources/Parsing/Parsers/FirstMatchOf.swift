/// A parser that consumes elements of a collection one by one until and if a given parser `parser` succeeds.
/// In case of success, the prefix is discarded and the the output of `parser` is returned.
public struct FirstMatchOf<Input, P>: Parser
  where
  Input: Collection,
  Input.SubSequence == Input,
  P: Parser,
  P.Input == Input
{
  public let parser: P

  @inlinable
  public init(_ parser: P) {
    self.parser = parser
  }

  @inlinable
  public func parse(_ input: inout Input) -> P.Output? {
    let original = input
    while !input.isEmpty {
      if let parsed = parser.parse(&input) {
        return parsed
      }
      input.removeFirst()
    }
    input = original
    return nil
  }
}

public extension Parsers {
  typealias FirstMatch = Parsing.FirstMatchOf // NB: Convenience type alias for discovery
}
