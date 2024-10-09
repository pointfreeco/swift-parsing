/// A parser that consumes a subsequence from the beginning of its input through a given sequence of
/// elements.
///
/// This parser is named after `Sequence.prefix(through:)`, and uses similar logic under the hood to
/// consume and return input through a particular subsequence.
///
/// ```swift
/// let lineParser = PrefixThrough("\n")
///
/// var input = "Hello\nworld\n"[...]
/// try line.parse(&input)  // "Hello\n"
/// input                   // "world\n"
/// ```
public struct PrefixThrough<Input: Collection>: Parser where Input.SubSequence == Input {
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
  public func parse(_ input: inout Input) throws -> Input {
    guard let first = self.possibleMatch.first else { return self.possibleMatch }
    let count = self.possibleMatch.count
    let original = input
    while let index = input.firstIndex(where: { self.areEquivalent(first, $0) }) {
      input = input[index...]
      if let matchEndIndex = input.index(index, offsetBy: count, limitedBy: input.endIndex),
        zip(input[..<matchEndIndex], self.possibleMatch).allSatisfy(self.areEquivalent)
      {
        input = input[matchEndIndex...]
        return original[..<matchEndIndex]
      }
      input.removeFirst()
    }
    throw ParsingError.expectedInput("prefix through \(formatValue(self.possibleMatch))", at: input)
  }
}

extension PrefixThrough: ParserPrinter where Input: PrependableCollection {
  @inlinable
  public func print(_ output: Input, into input: inout Input) throws {
    do {
      var output = output
      let appended = try self.parse(&output)
      guard output.isEmpty else {
        throw PrintingError.failed(
          summary: """
            round-trip expectation failed

            A "PrefixThrough" parser-printer attempted to print a collection that could not have \
            been parsed.
            """,
          input: input
        )
      }
      input.prepend(contentsOf: appended)
    } catch {
      throw PrintingError.failed(
        summary: """
          round-trip expectation failed

          A "PrefixThrough" parser-printer attempted to print a collection that could not have \
          been parsed.
          """,
        input: input
      )
    }
  }
}

extension PrefixThrough where Input.Element: Equatable {
  @inlinable
  public init(_ possibleMatch: Input) {
    self.init(possibleMatch, by: ==)
  }
}

extension PrefixThrough where Input == Substring {
  @_disfavoredOverload
  @inlinable
  public init(
    _ possibleMatch: String,
    by areEquivalent: @escaping (Input.Element, Input.Element) -> Bool = (==)
  ) {
    self.init(possibleMatch[...], by: areEquivalent)
  }
}

extension PrefixThrough where Input == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init(
    _ possibleMatch: String.UTF8View,
    by areEquivalent: @escaping (Input.Element, Input.Element) -> Bool = (==)
  ) {
    self.init(String(possibleMatch)[...].utf8, by: areEquivalent)
  }
}

extension Parsers {
  public typealias PrefixThrough = Parsing.PrefixThrough  // NB: Convenience type alias for discovery
}
