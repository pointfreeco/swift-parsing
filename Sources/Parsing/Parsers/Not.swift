/// Parses a `Void` result if the next input does not match the provided `Upstream` ``Parser``,
/// otherwise returns `nil`, in both cases leaving the input unchanged.
///
/// For example:
///
/// ```swift
/// let uncommentedLine = Not("//").take(PrefixUpTo<Substring>("\n"))
/// ```
///
/// This will check the input doesn't start with `"//"`, and if it doesn't, it will return the
/// the whole input up to the first newline.
public struct Not<Upstream>: Parser where Upstream: Parser {
  /// The parser from which this parser checks is successful.
  public let upstream: Upstream

  /// Construct a ``Not`` with the provided `Upstream` ``Parser``.
  ///
  /// - Parameter upstream: The ``Parser`` to check.
  @inlinable
  public init(_ upstream: Upstream) {
    self.upstream = upstream
  }

  /// A parser that parses a `Void` result if the next input does not match the provided
  /// `Upstream` ``Parser``, otherwise returns `nil`. In both cases leaving the `input`` unchanged.
  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Void? {
    let original = input
    if self.upstream.parse(&input) != nil {
      input = original
      return nil
    }
    return ()
  }
}
