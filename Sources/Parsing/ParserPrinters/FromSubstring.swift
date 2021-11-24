/// A parser that transforms a parser on `Substring` into a parser on `Substring.UTF8View`.
public struct FromSubstring<SubstringParser> {
  public let substringParser: SubstringParser

  @inlinable
  public init(@ParserBuilder _ substringParser: () -> SubstringParser) {
    self.substringParser = substringParser()
  }
}

extension FromSubstring: Parser
where
  SubstringParser: Parser,
  SubstringParser.Input == Substring
{
  @inlinable
  public func parse(_ input: inout Substring.UTF8View) -> SubstringParser.Output? {
    var substring = Substring(input)
    defer { input = substring.utf8 }
    return self.substringParser.parse(&substring)
  }
}

extension FromSubstring: Printer
where
  SubstringParser: Printer,
  SubstringParser.Input == Substring
{
  @inlinable
  public func print(_ output: SubstringParser.Output) -> Substring.UTF8View? {
    self.substringParser.print(output)?.utf8
  }
}
