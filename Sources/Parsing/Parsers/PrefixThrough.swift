/// A parser that consumes a subsequence from the beginning of its input through a given sequence of
/// elements.
///
/// This parser is named after `Sequence.prefix(through:)`, and uses similar logic under the hood to
/// consume and return input through a particular subsequence.
///
/// ```swift
/// let lineParser = PrefixThrough<Substring>("\n")
///
/// var input = "Hello\nworld\n"[...]
/// line.parse(&input) // "Hello\n"
/// input // "world\n"
/// ```
public struct PrefixThrough<Input>: Parser
where
  Input: Collection,
  Input.SubSequence == Input
{
  public let possibleMatch: Input
  public let areEquivalent: (Input.Element, Input.Element) -> Bool

  @inlinable
  public init(
    _ possibleMatch: Input,
    by areEquivalent: @escaping (Input.Element, Input.Element) -> Bool
  ) {
    self.possibleMatch = possibleMatch
    self.areEquivalent = areEquivalent
  }

  @inlinable
  @inline(__always)
  public func parse(_ input: inout Input) -> Input? {
    guard let first = self.possibleMatch.first else { return self.possibleMatch }
    let count = self.possibleMatch.count
    let original = input
    while let index = input.firstIndex(where: { self.areEquivalent(first, $0) }) {
      input = input[index...]
      if input.count >= count,
        zip(input[index...], self.possibleMatch).allSatisfy(self.areEquivalent)
      {
        let index = input.index(index, offsetBy: count)
        input = input[index...]
        return original[..<index]
      }
      input.removeFirst()
    }
    input = original
    return nil
  }
}

extension PrefixThrough where Input.Element: Equatable {
  @inlinable
  public init(_ possibleMatch: Input) {
    self.init(possibleMatch, by: ==)
  }
}

extension Parsers {
  public typealias PrefixThrough = Parsing.PrefixThrough  // NB: Convenience type alias for discovery
}

extension PrefixThrough where Input == Substring {
  @inlinable
  public init(_ possibleMatch: String) {
    self.init(possibleMatch[...])
  }
}

extension PrefixThrough where Input == Substring.UTF8View {
  @inlinable
  public init(_ possibleMatch: String.UTF8View) {
    self.init(String(possibleMatch)[...].utf8)
  }
}

extension Parser {
  @inlinable
  public static func prefixThrough<Input>(
    _ possibleMatch: Input,
    by areEquivalent: @escaping (Input.Element, Input.Element) -> Bool
  ) -> Self where Self == PrefixThrough<Input>, Input: Collection, Input.SubSequence == Input {
    return .init(possibleMatch, by: areEquivalent)
  }
  
  @inlinable
  public static func prefixThrough<Input>(_ possibleMatch: Input)
  -> Self where Self == PrefixThrough<Input>, Input: Collection, Input.SubSequence == Input, Input.Element: Equatable {
    return .init(possibleMatch, by: ==)
  }
  
  @inlinable
  public static func prefixThrough(_ possibleMatch: String)
  -> Self where Self == PrefixThrough<Substring> {
    return .init(possibleMatch[...])
  }
  
  @inlinable
  public static func prefixThrough(_ possibleMatch: String.UTF8View)
  -> Self where Self == PrefixThrough<Substring.UTF8View> {
    return .init(String(possibleMatch)[...].utf8)
  }
}
