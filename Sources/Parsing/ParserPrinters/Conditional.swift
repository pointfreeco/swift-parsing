/// A parser that can parse output from two types of parsers.
///
/// This parser is useful for situations where you want to run one of two different parsers based on
/// a condition, which typically would force you to perform ``Parser/eraseToAnyParser()`` and incur
/// a performance penalty.
///
/// For example, you can use this parser in a ``Parser/flatMap(_:)`` operation to use the parsed
/// output to determine what parser to run next:
///
/// ```swift
/// versionParser.flatMap { version in
///   version == "2.0"
///     ? Conditional.first(V2Parser())
///     : Conditional.second(LegacyParser())
/// }
/// ```
///
/// You won't typically construct this parser directly, but instead will use standard
/// `if`/`else if`/`else` statements in a parser builder to automatically build conditional parsers:
///
/// ```swift
/// versionParser.flatMap { version in
///   if version == "2.0" {
///     V2Parser()
///   } else {
///     LegacyParser()
///   }
/// }
/// ```
public enum Conditional<First, Second> {
  case first(First)
  case second(Second)
}

extension Conditional: Parser
where
  First: Parser,
  Second: Parser,
  First.Input == Second.Input,
  First.Output == Second.Output
{
  @inlinable
  public func parse(_ input: inout First.Input) -> First.Output? {
    switch self {
    case let .first(first):
      return first.parse(&input)
    case let .second(second):
      return second.parse(&input)
    }
  }
}

extension Conditional: Printer
where
  First: Printer,
  Second: Printer,
  First.Input == Second.Input,
  First.Output == Second.Output
{
  public func print(_ output: First.Output) -> First.Input? {
    switch self {
    case let .first(first):
      return first.print(output)
    case let .second(second):
      return second.print(output)
    }
  }
}

extension Parsers {
  public typealias Conditional = Parsing.Conditional  // NB: Convenience type alias for discovery
}
