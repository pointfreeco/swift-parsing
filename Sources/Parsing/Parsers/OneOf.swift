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
/// # Backtracking
///
/// `OneOf` will automatically revert any changes made to input when one of its parsers fails. This
/// process is often called "backtracking", and simplifies the logic of other parsers by not forcing them
/// to be responsible for their own backtracking when they fail.
///
/// If used naively, backtracking can lead to less performant parsing code. For example, if we wanted to parse
/// two integers from a string that were separated by either a dash "-" or slash "/", then we could write this
/// as:
///
/// ```swift
/// OneOf {
///   Parser { Int.parser(); "-"; Int.parser() } // 1️⃣
///   Parser { Int.parser(); "/"; Int.parser() } // 2️⃣
/// }
/// ```
///
/// However, parsing slash-separated integers is not going to be performant because it will first run the
/// entire 1️⃣ parser until it fails, then backtrack to the beginning, and run the 2️⃣ parser. In particular,
/// the first integer will get parsed twice, unnecessarily repeating that work.
///
/// On the other hand, we can factor out the common work of the parser and localize the backtracking `OneOf`
/// work to make a much more performant parser:
///
/// ```swift
/// Parse {
///   Int.parser()
///   OneOf { "-"; "/" }
///   Int.parser()
/// }
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
