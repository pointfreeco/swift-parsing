/// Parses the provided `Upstream` ``Parser``, returning the result, but does not consume any of the input.
///
/// For example, identifiers (variables, functions, etc.) in Swift allow the first character to be
/// a letter or underscore, but not a digit, but subsequent characters can be digits.
/// Eg. `let a1 = "a1"` is valid, but `let 1a = "1a"` is not. This parser will check the input
/// starts with a letter or underscore, and if it does, it will return the remainder of the input
/// up to the first character that is not a letter, a digit, or an underscore.
///
/// ```swift
/// let identifier = Skip(Peek(Prefix(1) { $0.isLetter || $0 == "_" }))
///     .take(Prefix { $0.isNumber || $0.isLetter || $0 == "_" })
/// ```
///
/// Note that the `Peek` does not consume the first character, but will only pass if the `Prefix(1)...` parses.
/// The subsequent `.take(...)` will consume the first character, along with any subsequent characters
/// that match the criteria.
public struct Peek<Upstream>: Parser where Upstream: Parser {
  public typealias Input = Upstream.Input
  public typealias Output = Upstream.Output

  /// The parser from which this parser checks is successful.
  public let upstream: Upstream

  /// Construct a ``Peek`` with the provided `Upstream` ``Parser``.
  ///
  /// - Parameter upstream: The ``Parser`` to check.
  @inlinable
  public init(@ParserBuilder _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    let original = input
    if let result = self.upstream.parse(&input) {
      input = original
      return result
    }
    return nil
  }
}
