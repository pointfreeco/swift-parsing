/// A parser that attempts to run a number of parsers till one succeeds.
///
/// ```swift
/// enum Currency { case eur, gbp, usd }
///
/// let currency = OneOf {
///   "€".map { Currency.eur }
///   "£".map { .gbp }
///   "$".map { .usd }
/// }
/// ```
///
/// Use this parser when you are parsing into an output data model that contains `nil`.
///
/// If you are optionally parsing input that should coalesce into some default, you can skip the
/// optionality and instead use ``OneOf`` with an ``Always`` parser, given a default.
public struct OneOf<Upstream>: Parser where Upstream: Parser {
  public let upstream: Upstream

  @inlinable
  public init(@OneOfBuilder _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    self.upstream.parse(&input)
  }
}
