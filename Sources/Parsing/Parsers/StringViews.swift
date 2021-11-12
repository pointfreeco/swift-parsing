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
  public struct SubstringToUnicodeScalars<Upstream>: Parser
  where
    Upstream: Parser,
    Upstream.Input == Substring
  {
    public let upstream: Upstream

    @inlinable
    public init(upstream: Upstream) {
      self.upstream = upstream
    }

    @inlinable
    public func parse(_ input: inout Substring.UnicodeScalarView) -> Upstream.Output? {
      var substring = Substring(input)
      defer { input = substring.unicodeScalars }
      return self.upstream.parse(&substring)
    }
  }

  public struct UTF8ViewToSubstring<UTF8ViewParser>: Parser
  where
    UTF8ViewParser: Parser,
    UTF8ViewParser.Input == Substring.UTF8View
  {
    public let utf8ViewParser: UTF8ViewParser

    @inlinable
    public init(_ utf8ViewParser: UTF8ViewParser) {
      self.utf8ViewParser = utf8ViewParser
    }

    @inlinable
    public func parse(_ input: inout Substring) -> UTF8ViewParser.Output? {
      self.utf8ViewParser.parse(&input.utf8)
    }
  }
}
