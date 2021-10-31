/// A parser that transforms a parser on `Substring` into a parser on `Substring.UTF8View`.
public struct FromSubstring<Upstream>: Parser
where
  Upstream: Parser,
  Upstream.Input == Substring
{
  public let upstream: Upstream

  @available(*, deprecated)
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
public struct FromUnicodeScalarView<Upstream>: Parser
where
  Upstream: Parser,
  Upstream.Input == Substring.UnicodeScalarView
{
  public let upstream: Upstream

  @available(*, deprecated)
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
    var unicodeScalars = Substring(input).unicodeScalars
    defer { input = Substring(unicodeScalars).utf8 }
    return self.upstream.parse(&unicodeScalars)
  }
}


extension Parser where Input == Substring {
  @available(*, deprecated)
  @inlinable
  public var utf8: FromSubstring<Self> {
    .init(upstream: self)
  }
}

extension Parser where Input == Substring.UnicodeScalarView {
  @available(*, deprecated)
  @inlinable
  public var utf8: FromUnicodeScalarView<Self> {
    .init(upstream: self)
  }
}

extension Parsers {
  @available(*, deprecated)
  public typealias SubstringToUTF8View = FromUTF8View

  @available(*, deprecated)
  public typealias UnicodeScalarViewToUTF8View = FromUnicodeScalarView
}
