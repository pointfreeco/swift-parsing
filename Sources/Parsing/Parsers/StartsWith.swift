/// A parser that parses a sequence of elements from its input.
public struct StartsWith<Input>: Parser
where
  Input: Collection,
  Input.SubSequence == Input
{
  public let count: Int
  public let possiblePrefix: AnyCollection<Input.Element>
  public let startsWith: (Input) -> Bool

  @inlinable
  public init<PossiblePrefix>(
    _ possiblePrefix: PossiblePrefix,
    by areEquivalent: @escaping (Input.Element, Input.Element) -> Bool
  )
  where
    PossiblePrefix: Collection,
    PossiblePrefix.Element == Input.Element
  {
    self.count = possiblePrefix.count
    self.possiblePrefix = AnyCollection(possiblePrefix)
    self.startsWith = { input in input.starts(with: possiblePrefix, by: areEquivalent) }
  }

  @inlinable
  public func parse(_ input: inout Input) -> Void? {
    guard self.startsWith(input)
    else { return nil }

    input.removeFirst(self.count)
    return ()
  }
}

extension Parsers.StartsWith where Input.Element: Equatable {
  @inlinable
  public init<PossiblePrefix>(_ possiblePrefix: PossiblePrefix)
  where
    PossiblePrefix: Collection,
    PossiblePrefix.Element == Input.Element
  {
    self.init(possiblePrefix, by: ==)
  }
}

extension Parsers {
  public typealias StartsWith = Parsing.StartsWith  // NB: Convenience type alias for discovery
}
