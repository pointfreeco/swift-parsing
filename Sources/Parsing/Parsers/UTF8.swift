extension Parser where Input == Substring {
  /// Transforms the receiving parser on `Substring` into a parser on `Substring.UTF8View`.
  @inlinable
  public var utf8: Parsers.SubstringToUTF8View<Self> {
    .init(upstream: self)
  }
}

extension Parser where Input == Substring.UnicodeScalarView {
  /// Transforms the receiving parser on `Substring.UnicodeScalarView` into a parser on
  /// `Substring.UTF8View`.
  @inlinable
  public var utf8: Parsers.UnicodeScalarViewToUTF8View<Self> {
    .init(upstream: self)
  }
}

extension Parsers {
  /// A parser that transforms a parser on `Substring` into a parser on `Substring.UTF8View`.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/utf8-6e25a`` operation, which constructs this type.
  public struct SubstringToUTF8View<Upstream>: Parser
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
    public init(@ParserBuilder build: () -> Upstream) {
      self.upstream = build()
    }

    @inlinable
    public func parse(_ input: inout Substring.UTF8View) -> Upstream.Output? {
      var substring = Substring(input)
      defer { input = substring.utf8 }
      return self.upstream.parse(&substring)
    }
  }

  /// A parser that transforms a parser on `Substring.UnicodeScalarView` into a parser on
  /// `Substring.UTF8View`.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/utf8-1tosc`` operation, which constructs this type.
  public struct UnicodeScalarViewToUTF8View<Upstream>: Parser
  where
    Upstream: Parser,
    Upstream.Input == Substring.UnicodeScalarView
  {
    public let upstream: Upstream

    @inlinable
    public init(upstream: Upstream) {
      self.upstream = upstream
    }

    @inlinable
    public func parse(_ input: inout Substring.UTF8View) -> Upstream.Output? {
      var unicodeScalars = Substring(input).unicodeScalars
      defer { input = Substring(unicodeScalars).utf8 }
      return self.upstream.parse(&unicodeScalars)
    }
  }
}
