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
/// try Prefix { $0.isNumber }.parse(&input)  // "123"
/// input                                     // " Hello world"
/// ```
///
/// If you wanted this parser to fail if _no_ numbers are consumed, you could introduce a minimum
/// length.
///
/// ```swift
/// var input = "No numbers here"[...]
/// try Prefix(1...) { $0.isNumber }.parse(&input)
/// // error: unexpected input
/// //  --> input:1:1
/// // 1 | No numbers here
/// //   | ^ expected 1 element satisfying predicate
/// ```
///
/// If a predicate is not provided, the parser will simply consume the prefix within the minimum and
/// maximum lengths provided:
///
/// ```swift
/// var input = "Lorem ipsum dolor"[...]
/// try Prefix(2).parse(&input)  // "Lo"
/// input                        // "rem ipsum dolor"
/// ```
public struct Prefix<Input: Collection>: Parser where Input.SubSequence == Input {
  public let maximum: Int?
  public let minimum: Int
  public let predicate: ((Input.Element) -> Bool)?

  /// Initializes a parser that consumes a subsequence from the beginning of its input.
  ///
  /// ```swift
  /// try Prefix(1...) { $0.isNumber }.parse("123456")  // "123456"
  ///
  /// try Prefix(1...) { $0.isNumber }.parse("")
  /// // error: unexpected input
  /// //  --> input:1:1
  /// // 1 |
  /// //   | ^ expected 1 more element satisfying predicate
  /// ```
  ///
  /// - Parameters:
  ///   - length: A length that provides a minimum number and maximum of elements to consume for
  ///     parsing to be considered successful.
  ///   - predicate: An optional closure that takes an element of the input sequence as its argument
  ///     and returns `true` if the element should be included or `false` if it should be excluded.
  ///     Once the predicate returns `false` it will not be called again.
  @inlinable
  public init<L: Length>(_ length: L, while predicate: ((Input.Element) -> Bool)? = nil) {
    self.minimum = length.minimum
    self.maximum = length.maximum
    self.predicate = predicate
  }

  /// Initializes a parser that consumes a subsequence from the beginning of its input.
  ///
  /// ```swift
  /// try Prefix { $0.isNumber }.parse("123456")  // "123456"
  /// ```
  ///
  /// - Parameters:
  ///   - length: A length that provides a minimum number and maximum of elements to consume for
  ///     parsing to be considered successful.
  ///   - predicate: An closure that takes an element of the input sequence as its argument and
  ///     returns `true` if the element should be included or `false` if it should be excluded. Once
  ///     the predicate returns `false` it will not be called again.
  @inlinable
  public init(while predicate: @escaping (Input.Element) -> Bool) {
    self.minimum = 0
    self.maximum = nil
    self.predicate = predicate
  }

  @inlinable
  @inline(__always)
  public func parse(_ input: inout Input) throws -> Input {
    var prefix = self.maximum.map(input.prefix) ?? input
    prefix = self.predicate.map { prefix.prefix(while: $0) } ?? prefix
    let count = prefix.count
    input.removeFirst(count)
    guard count >= self.minimum else {
      let atLeast = self.minimum - count
      throw ParsingError.expectedInput(
        """
        \(self.minimum - count) \(count == 0 ? "" : "more ")element\(atLeast == 1 ? "" : "s")\
        \(self.predicate == nil ? "" : " satisfying predicate")
        """,
        at: input
      )
    }
    return prefix
  }
}

extension Prefix where Input == Substring {
  @_disfavoredOverload
  @inlinable
  public init<L: Length>(_ length: L, while predicate: ((Input.Element) -> Bool)? = nil) {
    self.init(length, while: predicate)
  }

  @_disfavoredOverload
  @inlinable
  public init(while predicate: @escaping (Input.Element) -> Bool) {
    self.init(while: predicate)
  }
}

extension Prefix where Input == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init<L: Length>(_ length: L, while predicate: ((Input.Element) -> Bool)? = nil) {
    self.init(length, while: predicate)
  }

  @_disfavoredOverload
  @inlinable
  public init(while predicate: @escaping (Input.Element) -> Bool) {
    self.init(while: predicate)
  }
}

extension Parsers {
  public typealias Prefix = Parsing.Prefix  // NB: Convenience type alias for discovery
}
