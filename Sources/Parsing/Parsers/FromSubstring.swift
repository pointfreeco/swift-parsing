/// A parser that transforms a parser on `Substring` into a parser on another view.
///
/// Useful for sequencing a substring parser into a lower-level, more performant parser. For
/// example:
///
/// ```swift
/// Parse {
///   "caf".utf8
///
///   // Parse any recognized "é" character, including:
///   //   - LATIN SMALL LETTER E WITH ACUTE ("\u{00E9}")
///   //   - E + COMBINING ACUTE ACCENT ("e\u{0301}")
///   FromSubstring { "é" }
/// }
/// ```
public struct FromSubstring<Input, SubstringParser>: Parser
where
  SubstringParser: Parser,
  SubstringParser.Input == Substring
{
  public let substringParser: SubstringParser
  public let toSubstring: (Input) -> Substring
  public let fromSubstring: (Substring) -> Input

  @inlinable
  public func parse(_ input: inout Input) -> SubstringParser.Output? {
    var substring = self.toSubstring(input)
    defer { input = self.fromSubstring(substring) }
    return self.substringParser.parse(&substring)
  }
}

extension FromSubstring where Input == ArraySlice<UInt8> {
  @inlinable
  public init(@ParserBuilder _ build: () -> SubstringParser) {
    self.substringParser = build()
    self.toSubstring = { Substring(decoding: $0, as: UTF8.self) }
    self.fromSubstring = { ArraySlice($0.utf8) }
  }
}

extension FromSubstring where Input == Substring.UnicodeScalarView {
  @inlinable
  public init(@ParserBuilder _ build: () -> SubstringParser) {
    self.substringParser = build()
    self.toSubstring = Substring.init
    self.fromSubstring = \.unicodeScalars
  }
}

extension FromSubstring where Input == Substring.UTF8View {
  @inlinable
  public init(@ParserBuilder _ build: () -> SubstringParser) {
    self.substringParser = build()
    self.toSubstring = Substring.init
    self.fromSubstring = \.utf8
  }
}
