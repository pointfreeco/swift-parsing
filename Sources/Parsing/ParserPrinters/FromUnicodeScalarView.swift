/// A parser that transforms a parser on `Substring.UnicodeScalarView` into a parser on
/// `Substring.UTF8View`.
public struct FromUnicodeScalarView<UnicodeScalarParser>: Parser
where
  UnicodeScalarParser: Parser,
  UnicodeScalarParser.Input == Substring.UnicodeScalarView
{
  public let unicodeScalarParser: UnicodeScalarParser

  @inlinable
  public init(@ParserBuilder _ unicodeScalarParser: () -> UnicodeScalarParser) {
    self.unicodeScalarParser = unicodeScalarParser()
  }

  @inlinable
  public func parse(_ input: inout Substring.UTF8View) -> UnicodeScalarParser.Output? {
    var unicodeScalars = Substring(input).unicodeScalars
    defer { input = Substring(unicodeScalars).utf8 }
    return self.unicodeScalarParser.parse(&unicodeScalars)
  }
}

extension FromUnicodeScalarView: Printer where UnicodeScalarParser: Printer {
  @inlinable
  public func print(_ output: UnicodeScalarParser.Output) -> Substring.UTF8View? {
    self.unicodeScalarParser.print(output).map(Substring.init)?.utf8
  }
}
