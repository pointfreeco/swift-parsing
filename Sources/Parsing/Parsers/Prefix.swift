/// A parser that consumes a subsequence from the beginning of its input.
///
/// This parser is named after `Sequence.prefix`, which it uses under the hood to consume a number
/// of elements and return them as output. It can be configured with minimum and maximum lengths,
/// as well as a predicate.
///
/// For example, to parse as many numbers off the beginning of a substring:
///
/// ```swift
/// var input = "123 hello world"[...]
/// Prefix { $0.isNumber }.parse(&input) // "123"
/// input // " Hello world"
/// ```
///
/// If you wanted this parser to fail if _no_ numbers are consumed, you could introduce a minimum
/// length.
///
/// ```swift
/// var input = "No numbers here"[...]
/// Prefix(1...) { $0.isNumber }).parse(&input) // nil
/// input // "No numbers here"
/// ```
///
/// If a predicate is not provided, the parser will simply consume the prefix within the minimum and
/// maximum lengths provided:
///
/// ```swift
/// var input = "Lorem ipsum dolor"[...]
/// Prefix(2).parse(&input) // "Lo"
/// input // "rem ipsum dolor"
/// ```
public struct Prefix<Input>: Parser
where
  Input: Collection,
  Input.SubSequence == Input
{
  @ParserEnvironment(\.maximum) public var maxLength
  @ParserEnvironment(\.minimum) public var minLength
  public let predicate: ((Input.Element) -> Bool)?

  /// Initializes a parser that consumes a subsequence from the beginning of its input.
  ///
  /// - Parameters:
  ///   - minLength: The minimum number of elements to consume for parsing to be considered
  ///     successful.
  ///   - maxLength: The maximum number of elements to consume before the parser will return its
  ///     output.
  ///   - predicate: A closure that takes an element of the input sequence as its argument and
  ///     returns `true` if the element should be included or `false` if it should be excluded. Once
  ///     the predicate returns `false` it will not be called again.
  @inlinable
  public init(
    while predicate: ((Input.Element) -> Bool)? = nil
  ) {
    self.predicate = predicate
  }

  @inlinable
  public func parse(_ input: inout Input) -> Input? {
    var prefix = self.maxLength.map { input.prefix($0) } ?? input
    prefix = predicate.map { prefix.prefix(while: $0) } ?? prefix
    let count = prefix.count
    guard count >= self.minLength else { return nil }
    input.removeFirst(count)
    return prefix
  }
}

extension Prefix where Input == Substring {
  @_disfavoredOverload
  @inlinable
  public init(
    while predicate: ((Input.Element) -> Bool)? = nil
  ) {
    self.init(while: predicate)
  }
}

extension Prefix where Input == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init(
    while predicate: ((Input.Element) -> Bool)? = nil
  ) {
    self.init(while: predicate)
  }
}

extension Parsers {
  public typealias Prefix = Parsing.Prefix  // NB: Convenience type alias for discovery
}

private enum MinimumKey: ParserEnvironmentKey {
  static var value = 0
}
extension ParserEnvironmentValues {
  public var minimum: Int {
    get { self[MinimumKey.self] }
    set { self[MinimumKey.self] = newValue }
  }
}

private enum MaximumKey: ParserEnvironmentKey {
  static var value = Int?.none
}
extension ParserEnvironmentValues {
  public var maximum: Int? {
    get { self[MaximumKey.self] }
    set { self[MaximumKey.self] = newValue }
  }
}

extension Parser {
  @inlinable
  public func minimum(_ minLength: Int) -> Parsers.EnvironmentKeyWritingParser<Self> {
    self.environment(\.minimum, minLength)
  }
  @inlinable
  public func maximum(_ maxLength: Int) -> Parsers.EnvironmentKeyWritingParser<Self> {
    self.environment(\.maximum, maxLength)
  }
  @inlinable
  public func count(_ length: Int) -> Parsers.EnvironmentKeyWritingParser<Self> {
    self
      .environment(\.minimum, length)
      .environment(\.maximum, length)
  }
  @inlinable
  public func count(_ length: ClosedRange<Int>) -> Parsers.EnvironmentKeyWritingParser<Self> {
    self
      .environment(\.minimum, length.lowerBound)
      .environment(\.maximum, length.upperBound)
  }
  @inlinable
  public func count(_ length: PartialRangeFrom<Int>) -> Parsers.EnvironmentKeyWritingParser<Self> {
    self
      .environment(\.minimum, length.lowerBound)
  }
  @inlinable
  public func count(_ length: PartialRangeUpTo<Int>) -> Parsers.EnvironmentKeyWritingParser<Self> {
    self
      .environment(\.maximum, length.upperBound)
  }
  @inlinable
  public func count(_ length: PartialRangeThrough<Int>) -> Parsers.EnvironmentKeyWritingParser<Self> {
    self
      .environment(\.maximum, length.upperBound)
  }
}
