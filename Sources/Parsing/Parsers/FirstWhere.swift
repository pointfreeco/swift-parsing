public struct FirstWhere<Input>: Parser
where
  Input: Collection,
  Input.SubSequence == Input
{
  public let predicate: (Input.Element) -> Bool

  @inlinable
  public init(_ predicate: @escaping (Input.Element) -> Bool) {
    self.predicate = predicate
  }

  @inlinable
  public func parse(_ input: inout Input) -> Input.Element? {
    guard let first = input.first, self.predicate(first) else { return nil }
    input.removeFirst()
    return first
  }
}

extension Parsers {
  public typealias FirstWhere = Parsing.FirstWhere  // NB: Convenience type alias for discovery
}

extension Parser {
  @inlinable
  public static func firstWhere<Input>(_ predicate: @escaping (Input.Element) -> Bool)
  -> Self where Self == FirstWhere<Input>, Input: Collection, Input.SubSequence == Input {
    return .init(predicate)
  }
}
