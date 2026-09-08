/// A parser that parses a sequence of elements from its input.
///
/// This parser is named after `Sequence.starts(with:)`, and tests that the input it is parsing
/// starts with a given subsequence by calling this method under the hood.
///
/// If `true`, it consumes this prefix and returns `Void`:
///
/// ```swift
/// var input = "Hello, Blob!"[...]
///
/// StartsWith("Hello, ").parse(&input)  // ()
/// input                                // "Blob!"
/// ```
///
/// If `false`, it fails and leaves input intact:
///
/// ```swift
/// var input = "Goodnight, Blob!"[...]
/// try StartsWith("Hello, ").parse(&input)
/// // error: unexpected input
/// //  --> input:1:1
/// // 1 | Goodnight, Blob!
/// //   | ^ expected "Hello, "
/// ```
///
/// This parser returns `Void` and _not_ the sequence of elements it consumes because the sequence
/// is already known at the time the parser is created (it is the value quite literally passed to
/// ``StartsWith/init(_:)``).
///
/// In many circumstances you can omit the `StartsWith` parser entirely and just use the collection
/// as the parser. For example:
///
/// ```swift
/// var input = "Hello, Blob!"[...]
///
/// try "Hello, ".parse(&input)  // ()
/// input                        // "Blob!"
/// ```
public struct StartsWith<Input: Collection>: Parser where Input.SubSequence == Input {
  public let count: Int
  public let possiblePrefix: AnyCollection<Input.Element>
  public let originalPossiblePrefix: Any
  public let startsWith: (Input) -> Bool

  /// Initializes a parser that successfully returns `Void` when the initial elements of its input
  /// are equivalent to the elements in another sequence, using the given predicate as the
  /// equivalence test.
  ///
  /// - Parameters:
  ///   - possiblePrefix: A sequence to compare to the start of an input sequence.
  ///   - areEquivalent: A predicate that returns `true` if its two arguments are equivalent;
  ///     otherwise, `false`.
  @inlinable
  public init<PossiblePrefix: Collection>(
    _ possiblePrefix: PossiblePrefix,
    by areEquivalent: @escaping (Input.Element, Input.Element) -> Bool
  )
  where PossiblePrefix.Element == Input.Element {
    self.count = possiblePrefix.count
    self.possiblePrefix = AnyCollection(possiblePrefix)
    self.originalPossiblePrefix = possiblePrefix
    self.startsWith = { input in input.starts(with: possiblePrefix, by: areEquivalent) }
  }

  @inlinable
  public func parse(_ input: inout Input) throws {
    guard self.startsWith(input) else {
      throw ParsingError.expectedInput(formatValue(self.originalPossiblePrefix), at: input)
    }
    input.removeFirst(self.count)
  }
}

extension StartsWith: ParserPrinter where Input: PrependableCollection {
  @inlinable
  public func print(_ output: (), into input: inout Input) {
    input.prepend(contentsOf: self.possiblePrefix)
  }
}

extension StartsWith where Input.Element: Equatable {
  /// Initializes a parser that successfully returns `Void` when the initial elements of its input
  /// are equivalent to the elements in another sequence.
  ///
  /// - Parameter possiblePrefix: A sequence to compare to the start of an input sequence.
  @inlinable
  public init<PossiblePrefix: Collection>(_ possiblePrefix: PossiblePrefix)
  where PossiblePrefix.Element == Input.Element {
    self.init(possiblePrefix, by: ==)
  }
}

extension StartsWith where Input == Substring {
  @_disfavoredOverload
  @inlinable
  public init(
    _ possiblePrefix: String,
    by areEquivalent: @escaping (Input.Element, Input.Element) -> Bool = (==)
  ) {
    self.init(possiblePrefix[...], by: areEquivalent)
  }
}

extension StartsWith where Input == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init(
    _ possiblePrefix: String.UTF8View,
    by areEquivalent: @escaping (Input.Element, Input.Element) -> Bool = (==)
  ) {
    self.init(String(possiblePrefix)[...].utf8, by: areEquivalent)
  }
}

extension Parsers {
  public typealias StartsWith = Parsing.StartsWith  // NB: Convenience type alias for discovery
}
