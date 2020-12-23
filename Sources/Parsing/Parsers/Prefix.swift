/// A parser that consumes a subsequence from the beginning of its input.
///
/// This parser can be configured with minimum and maximum lengths, as well as a predicate.
///
/// For example, to parse as many numbers off the beginning of a substring:
///
///     var input = "123 hello world"[...]
///     Prefix { $0.isNumber }.parse(&input) // "123"
///     input // " Hello world"
///
/// If you wanted this parser to fail if _no_ numbers are consumed, you could introduce a minimum
/// length.
///
///     var input = "No numbers here"[...]
///     Prefix(minLength: 1) { $0.isNumber }).parse(&input) // nil
///     input // "No numbers here"
///
/// If a predicate is not provided, the parser will simply consume the prefix within the minimum and
/// maximum lengths provided:
///
///     var input = "Lorem ipsum dolor"[...]
///     Prefix(2).parse(&input) // "Lo"
///     input // "rem ipsum dolor"
public struct Prefix<Input>: Parser
where
  Input: Collection,
  Input.SubSequence == Input
{
  public let maxLength: Int?
  public let minLength: Int
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
    minLength: Int = 0,
    maxLength: Int? = nil,
    while predicate: ((Input.Element) -> Bool)? = nil
  ) {
    self.minLength = minLength
    self.maxLength = maxLength
    self.predicate = predicate
  }

  /// Initializes a parser that consumes a subsequence from the beginning of its input.
  ///
  /// - Parameter length: An exact number of elements to consume for parsing to be considered
  ///   successful.
  @inlinable
  public init(
    _ length: Int,
    while predicate: ((Input.Element) -> Bool)? = nil
  ) {
    self.minLength = length
    self.maxLength = length
    self.predicate = predicate
  }

  /// Initializes a parser that consumes a subsequence from the beginning of its input.
  ///
  /// - Parameter length: A closed range that provides a minimum number and maximum of elements to
  ///   consume for parsing to be considered successful.
  @inlinable
  public init(
    _ length: ClosedRange<Int>,
    while predicate: ((Input.Element) -> Bool)? = nil
  ) {
    self.minLength = length.lowerBound
    self.maxLength = length.upperBound
    self.predicate = nil
  }

  /// Initializes a parser that consumes a subsequence from the beginning of its input.
  ///
  /// - Parameter length: A partial range that provides a minimum number of elements to consume for
  ///   parsing to be considered successful.
  @inlinable
  public init(
    _ length: PartialRangeFrom<Int>,
    while predicate: ((Input.Element) -> Bool)? = nil
  ) {
    self.minLength = length.lowerBound
    self.maxLength = nil
    self.predicate = nil
  }

  /// Initializes a parser that consumes a subsequence from the beginning of its input.
  ///
  /// - Parameter length: A partial, inclusive range that provides a maximum number of elements to
  ///   consume for parsing to be considered successful.
  @inlinable
  public init(
    _ length: PartialRangeThrough<Int>,
    while predicate: ((Input.Element) -> Bool)? = nil
  ) {
    self.minLength = 0
    self.maxLength = length.upperBound
    self.predicate = nil
  }

  /// Initializes a parser that consumes a subsequence from the beginning of its input.
  ///
  /// - Parameter length: A partial, exclusive range that provides a minimum number of elements to
  ///   consume for parsing to be considered successful.
  @inlinable
  public init(
    _ length: PartialRangeUpTo<Int>,
    while predicate: ((Input.Element) -> Bool)? = nil
  ) {
    self.minLength = 0
    self.maxLength = length.upperBound - 1
    self.predicate = nil
  }

  /// Initializes a parser that consumes a subsequence from the beginning of its input.
  ///
  /// - Parameter length: A range that provides a minimum number and maximum of elements to consume
  ///   for parsing to be considered successful.
  @inlinable
  public init(
    _ length: Range<Int>,
    while predicate: ((Input.Element) -> Bool)? = nil
  ) {
    self.minLength = length.lowerBound
    self.maxLength = length.upperBound - 1
    self.predicate = nil
  }

  @inlinable
  public func parse(_ input: inout Input) -> Input? {
    if let predicate = self.predicate {
      let prefix = input.prefix(while: predicate)
      let count = prefix.count
      guard count >= self.minLength, self.maxLength.map({ count <= $0 }) ?? true else { return nil }
      input.removeFirst(count)
      return prefix
    } else {
      let prefix = self.maxLength.map(input.prefix) ?? input
      let count = prefix.count
      guard count >= self.minLength else { return nil }
      input.removeFirst(count)
      return prefix
    }
  }
}

extension Parsers {
  public typealias Prefix = Parsing.Prefix  // NB: Convenience type alias for discovery
}
