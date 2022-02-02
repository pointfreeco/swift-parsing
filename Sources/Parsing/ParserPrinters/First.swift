/// A parser that consumes the first element from a collection.
///
/// This parser is named after `Sequence.first`, and attempts to parse the first element from a
/// collection of input by calling this property under the hood.
///
/// For example, it can parse the leading character off a substring:
///
/// ```swift
/// var input = "Hello"[...]
/// try First().parse(&input)  // "H"
/// input                      // "ello"
/// ```
///
/// If the collection is empty, or if it has been consumed in its entirety, parsing will fail:
///
/// ```swift
/// input = ""
/// try First().parse(&input)
/// // error: unexpected input
/// //  ---> input:1:1
/// // 1 |
/// //   | ^ expected element
/// ```
public struct First<Input>: Parser
where
  Input: Collection,
  Input.SubSequence == Input
{
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout Input) throws -> Input.Element {
    guard let first = input.first else {
      throw ParsingError.expectedInput("element", at: input)
    }
    input.removeFirst()
    return first
  }
}

extension First: Printer where Input: AppendableCollection {
  @inlinable
  public func print(_ output: Input.Element, to input: inout Input) {
    input.append(contentsOf: CollectionOfOne(output))
  }
}

extension First where Input == Substring {
  @_disfavoredOverload
  @inlinable
  public init() {}
}

extension First where Input == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init() {}
}

extension Parsers {
  public typealias First = Parsing.First  // NB: Convenience type alias for discovery
}
