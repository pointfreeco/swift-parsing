extension Parser where Input == Substring {
  /// Transforms the receiving parser on `Substring` into a parser on `Substring.UnicodeScalarView`.
  @inlinable
  public var unicodeScalars: Parsers.SubstringToUnicodeScalars<Self> {
    .init(upstream: self)
  }
}

extension Parsers {
  /// A parser that transforms a parser on `Substring` into a parser on
  /// `Substring.UnicodeScalarView`.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/unicodeScalars`` operation, which constructs this type.
  public struct SubstringToUnicodeScalars<Upstream> {
    public let upstream: Upstream

    @inlinable
    public init(upstream: Upstream) {
      self.upstream = upstream
    }
  }

  public struct UTF8ViewToSubstring<UTF8ViewParser> {
    public let utf8ViewParser: UTF8ViewParser

    @inlinable
    public init(_ utf8ViewParser: UTF8ViewParser) {
      self.utf8ViewParser = utf8ViewParser
    }
  }
}

extension Parsers.SubstringToUnicodeScalars: Parser
where
  Upstream: Parser,
  Upstream.Input == Substring
{
  @inlinable
  public func parse(_ input: inout Substring.UnicodeScalarView) -> Upstream.Output? {
    var substring = Substring(input)
    defer { input = substring.unicodeScalars }
    return self.upstream.parse(&substring)
  }
}

extension Parsers.SubstringToUnicodeScalars: Printer
where
  Upstream: Printer,
  Upstream.Input == Substring
{
  public func print(_ output: Upstream.Output) -> Substring.UnicodeScalarView? {
    self.upstream.print(output).map(Substring.init)?.unicodeScalars
  }
}

extension Parsers.UTF8ViewToSubstring: Parser
where
  UTF8ViewParser: Parser,
  UTF8ViewParser.Input == Substring.UTF8View
{
  @inlinable
  public func parse(_ input: inout Substring) -> UTF8ViewParser.Output? {
    self.utf8ViewParser.parse(&input.utf8)
  }
}

extension Parsers.UTF8ViewToSubstring: Printer
where
  UTF8ViewParser: Printer,
  UTF8ViewParser.Input == Substring
{
  public func print(_ output: UTF8ViewParser.Output) -> Substring? {
    self.utf8ViewParser.print(output).map(Substring.init)
  }
}
