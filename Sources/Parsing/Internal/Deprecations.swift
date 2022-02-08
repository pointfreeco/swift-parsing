// NB: Deprecated after 0.6.0

@available(*, deprecated, message: "Use 'From(.substring)' instead.")
public struct FromSubstring<Input, SubstringParser>: Parser
where
  SubstringParser: Parser,
  SubstringParser.Input == Substring
{
  public let substringParser: SubstringParser
  public let toSubstring: (Input) -> Substring
  public let fromSubstring: (Substring) -> Input

  @inlinable
  public func parse(_ input: inout Input) rethrows -> SubstringParser.Output {
    var substring = self.toSubstring(input)
    defer { input = self.fromSubstring(substring) }
    return try self.substringParser.parse(&substring)
  }
}

@available(*, deprecated, message: "Use 'From(.substring)' instead.")
extension FromSubstring: Printer where SubstringParser: Printer {
  @inlinable
  public func print(_ output: SubstringParser.Output, to input: inout Input) rethrows {
    var substringInput = self.toSubstring(input)
    try self.substringParser.print(output, to: &substringInput)
    input = self.fromSubstring(substringInput)
  }
}

@available(*, deprecated, message: "Use 'From(.substring)' instead.")
extension FromSubstring where Input == ArraySlice<UInt8> {
  @inlinable
  public init(@ParserBuilder _ build: () -> SubstringParser) {
    self.substringParser = build()
    self.toSubstring = { Substring(decoding: $0, as: UTF8.self) }
    self.fromSubstring = { ArraySlice($0.utf8) }
  }
}

@available(*, deprecated, message: "Use 'From(.substring)' instead.")
extension FromSubstring where Input == Substring.UnicodeScalarView {
  @inlinable
  public init(@ParserBuilder _ build: () -> SubstringParser) {
    self.substringParser = build()
    self.toSubstring = Substring.init
    self.fromSubstring = \.unicodeScalars
  }
}

@available(*, deprecated, message: "Use 'From(.substring)' instead.")
extension FromSubstring where Input == Substring.UTF8View {
  @inlinable
  public init(@ParserBuilder _ build: () -> SubstringParser) {
    self.substringParser = build()
    self.toSubstring = Substring.init
    self.fromSubstring = \.utf8
  }
}

@available(*, deprecated, message: "Use 'From(.unicodeScalars)' instead.")
public struct FromUnicodeScalarView<Input, UnicodeScalarsParser>: Parser
where
  UnicodeScalarsParser: Parser,
  UnicodeScalarsParser.Input == Substring.UnicodeScalarView
{
  public let unicodeScalarsParser: UnicodeScalarsParser
  public let toUnicodeScalars: (Input) -> Substring.UnicodeScalarView
  public let fromUnicodeScalars: (Substring.UnicodeScalarView) -> Input

  @inlinable
  public func parse(_ input: inout Input) rethrows -> UnicodeScalarsParser.Output {
    var unicodeScalars = self.toUnicodeScalars(input)
    defer { input = self.fromUnicodeScalars(unicodeScalars) }
    return try self.unicodeScalarsParser.parse(&unicodeScalars)
  }
}

@available(*, deprecated, message: "Use 'From(.unicodeScalars)' instead.")
extension FromUnicodeScalarView: Printer where UnicodeScalarsParser: Printer {
  @inlinable
  public func print(_ output: UnicodeScalarsParser.Output, to input: inout Input) rethrows {
    var unicodeScalarsInput = self.toUnicodeScalars(input)
    try self.unicodeScalarsParser.print(output, to: &unicodeScalarsInput)
    input = self.fromUnicodeScalars(unicodeScalarsInput)
  }
}

@available(*, deprecated, message: "Use 'From(.unicodeScalars)' instead.")
extension FromUnicodeScalarView where Input == ArraySlice<UInt8> {
  @inlinable
  public init(@ParserBuilder _ build: () -> UnicodeScalarsParser) {
    self.unicodeScalarsParser = build()
    self.toUnicodeScalars = { Substring(decoding: $0, as: UTF8.self).unicodeScalars }
    self.fromUnicodeScalars = { ArraySlice(Substring($0).utf8) }
  }
}

@available(*, deprecated, message: "Use 'From(.unicodeScalars)' instead.")
extension FromUnicodeScalarView where Input == Substring {
  @inlinable
  public init(@ParserBuilder _ build: () -> UnicodeScalarsParser) {
    self.unicodeScalarsParser = build()
    self.toUnicodeScalars = \.unicodeScalars
    self.fromUnicodeScalars = Substring.init
  }
}

@available(*, deprecated, message: "Use 'From(.unicodeScalars)' instead.")
extension FromUnicodeScalarView where Input == Substring.UTF8View {
  @inlinable
  public init(@ParserBuilder _ build: () -> UnicodeScalarsParser) {
    self.unicodeScalarsParser = build()
    self.toUnicodeScalars = { Substring($0).unicodeScalars }
    self.fromUnicodeScalars = { Substring($0).utf8 }
  }
}

@available(*, deprecated, message: "Use 'From(.utf8)' instead.")
public struct FromUTF8View<Input, UTF8Parser>: Parser
where
  UTF8Parser: Parser,
  UTF8Parser.Input == Substring.UTF8View
{
  public let utf8Parser: UTF8Parser
  public let toUTF8: (Input) -> Substring.UTF8View
  public let fromUTF8: (Substring.UTF8View) -> Input

  @inlinable
  public func parse(_ input: inout Input) rethrows -> UTF8Parser.Output {
    var utf8 = self.toUTF8(input)
    defer { input = self.fromUTF8(utf8) }
    return try self.utf8Parser.parse(&utf8)
  }
}

@available(*, deprecated, message: "Use 'From(.utf8)' instead.")
extension FromUTF8View: Printer where UTF8Parser: Printer {
  @inlinable
  public func print(_ output: UTF8Parser.Output, to input: inout Input) rethrows {
    var utf8Input = self.toUTF8(input)
    try self.utf8Parser.print(output, to: &utf8Input)
    input = self.fromUTF8(utf8Input)
  }
}

@available(*, deprecated, message: "Use 'From(.utf8)' instead.")
extension FromUTF8View where Input == Substring {
  @inlinable
  public init(@ParserBuilder _ build: () -> UTF8Parser) {
    self.utf8Parser = build()
    self.toUTF8 = \.utf8
    self.fromUTF8 = Substring.init
  }
}

@available(*, deprecated, message: "Use 'From(.utf8)' instead.")
extension FromUTF8View where Input == Substring.UnicodeScalarView {
  @inlinable
  public init(@ParserBuilder _ build: () -> UTF8Parser) {
    self.utf8Parser = build()
    self.toUTF8 = { Substring($0).utf8 }
    self.fromUTF8 = { Substring($0).unicodeScalars }
  }
}

@available(*, deprecated, renamed: "Parsers.Conditional")
public typealias Conditional = Parsers.Conditional
