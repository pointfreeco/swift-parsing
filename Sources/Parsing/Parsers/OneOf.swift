/// A parser that attempts to run a number of parsers till one succeeds.
///
/// Use this parser to list out a number of parsers in a ``OneOfBuilder`` result builder block.
///
/// The following example uses `OneOf` to parse an enum value. To do so, it spells out a list of
/// parsers to `OneOf`, one for each case:
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
/// If you are parsing input that should coalesce into some default, avoid using a final ``Always``
/// parser, and instead opt for a trailing ``replaceError(with:)``, which returns a parser that
/// cannot fail:
///
/// ```swift
/// enum Currency { case eur, gbp, usd, unknown }
///
/// let currency = OneOf {
///   "€".map { Currency.eur }
///   "£".map { Currency.gbp }
///   "$".map { Currency.usd }
/// }
/// .replaceError(with: Currency.unknown)
///
/// currency.parse("$")  // Currency.usd
/// currency.parse("฿")  // Currency.unknown
/// ```
public struct OneOf<Parsers: Parser>: Parser {
  public let parsers: Parsers

  @inlinable
  public init(@OneOfBuilder _ build: () -> Parsers) {
    self.parsers = build()
  }

  @inlinable
  public func parse(_ input: inout Parsers.Input) rethrows -> Parsers.Output {
    try self.parsers.parse(&input)
  }
}
