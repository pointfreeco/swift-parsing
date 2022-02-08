/// A parser that attempts to run a number of parsers till one succeeds.
///
/// ```swift
/// enum Currency { case eur, gbp, usd }
///
/// let currency = OneOf {
///   "€".map { Currency.eur }
///   "£".map { Currency.gbp }
///   "$".map { Currency.usd }
/// }
/// ```
///
/// If you are optionally parsing input that should coalesce into some default, you can skip the
/// optionality and instead use `OneOf` with an ``Always`` parser, given a default:
///
/// ```swift
/// enum Currency { case eur, gbp, usd, unknown }
///
/// let currency = OneOf {
///   "€".map { Currency.eur }
///   "£".map { Currency.gbp }
///   "$".map { Currency.usd }
///   Always(Currency.unknown)
/// }
/// ```
///
/// `OneOf` will automatically revert any changes made to input when one of its parsers fails. This
/// process is often called "backtracking", and simplifies the responsibility of many parsers.
/// Because of this, the performance of a parser directly corresponds to avoiding duplicate work in
/// a `OneOf`.
/// ```
public struct OneOf<Parsers>: Parser where Parsers: Parser {
  public let parsers: Parsers

  @inlinable
  public init(@OneOfBuilder _ build: () -> Parsers) {
    self.parsers = build()
  }

  @inlinable
  public func parse(_ input: inout Parsers.Input) -> Parsers.Output? {
    self.parsers.parse(&input)
  }
}
