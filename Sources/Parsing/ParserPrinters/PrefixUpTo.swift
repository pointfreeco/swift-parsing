/// A parser that consumes a subsequence from the beginning of its input up to a given sequence of
/// elements.
///
/// This parser is named after `Sequence.prefix(upTo:)`, and uses similar logic under the hood to
/// consume and return input up to a particular subsequence.
///
/// ```swift
/// let lineParser = PrefixUpTo("\n")
///
/// var input = "Hello\nworld\n"[...]
/// try line.parse(&input)  // "Hello"
/// input                   // "\nworld\n"
/// ```
public struct PrefixUpTo<Input: Collection>: Parser where Input.SubSequence == Input {
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
        return original[..<index]
      }
      input.removeFirst()
    }
    throw ParsingError.expectedInput("prefix up to \(formatValue(self.possibleMatch))", at: input)
  }
}

extension PrefixUpTo: ParserPrinter where Input: PrependableCollection {
  @inlinable
  public func print(_ output: Input, into input: inout Input) throws {
    guard input.starts(with: self.possibleMatch, by: self.areEquivalent)
    else {
      throw PrintingError.failed(
        summary: """
          round-trip expectation failed

          A "PrefixUpTo" parser-printer expected its match to be printed next, but no such match \
          was printed.

          During a round-trip, the parser would have continued parsing up to the match or the end \
          of input.
          """,
        input: input
      )
    }
    do {
      var output = output
      _ = try self.parse(&output)
    } catch {
      input.prepend(contentsOf: output)
      return
    }
    throw PrintingError.failed(
      summary: """
        round-trip expectation failed

        A "PrefixUpTo" parser-printer was given a value to print that contained the match it \
        parses up to.

        During a round-trip, the parser would have only parsed up to this match.
        """,
      input: input
    )
  }
}

extension PrefixUpTo where Input.Element: Equatable {
  @inlinable
  public init(_ possibleMatch: Input) {
    self.init(possibleMatch, by: ==)
  }
}

extension PrefixUpTo where Input == Substring {
  @_disfavoredOverload
  @inlinable
  public init(
    _ possibleMatch: String,
    by areEquivalent: @escaping (Input.Element, Input.Element) -> Bool = (==)
  ) {
    self.init(possibleMatch[...], by: areEquivalent)
  }
}

extension PrefixUpTo where Input == Substring.UTF8View {
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
  public typealias PrefixUpTo = Parsing.PrefixUpTo  // NB: Convenience type alias for discovery
}
