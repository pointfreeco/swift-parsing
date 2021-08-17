/// A parser that consumes the first element from a collection.
///
/// This parser is named after `Sequence.first`, and attempts to parse the first element from a
/// collection of input by calling this property under the hood.
///
/// For example, it can parse the leading character off a substring:
///
/// ```swift
/// First().parse("Hello"[...]) // (output: "H", rest: "ello")
/// ```
///
/// If the collection is empty, or if it has been consumed in its entirety, parsing will fail:
///
/// ```swift
/// First().parse(""[...]) // (output: nil, rest: "")
/// ```
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
  public typealias First = Parsing.First  // NB: Convenience type alias for discovery
}

extension Parser {
  @inlinable
  public static func first<Input>() -> Self where Self == First<Input> {
    return .init()
  }
}
