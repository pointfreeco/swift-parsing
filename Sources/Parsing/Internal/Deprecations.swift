// NB: Deprecated after 0.3.1:

extension Parser where Input == Substring {
  @available(*, deprecated, message: "Use the 'FromSubstring' builder with this parser instead")
  @inlinable
  public var utf8: FromSubstring<Self> {
    .init(upstream: self)
  }
}

extension Parser where Input == Substring.UnicodeScalarView {
  @available(*, deprecated, message: "Use the 'FromUnicodeScalarView' builder with this parser instead")
  @inlinable
  public var utf8: FromUnicodeScalarView<Self> {
    .init(upstream: self)
  }
}

extension Parsers {
  @available(*, deprecated, renamed: "FromUnicodeScalarView")
  public typealias UnicodeScalarViewToUTF8View = FromUnicodeScalarView

  @available(*, deprecated, renamed: "FromUTF8View")
  public typealias SubstringToUTF8View = FromUTF8View
}

extension FromSubstring {
  @available(*, deprecated)
  @inlinable
  public init(upstream: SubstringParser) {
    self.substringParser = upstream
  }
}

extension FromUnicodeScalarView {
  @available(*, deprecated)
  @inlinable
  public init(upstream: UnicodeScalarParser) {
    self.unicodeScalarParser = upstream
  }
}

// NB: Deprecated after 0.1.2:

@available(*, deprecated, message: "Use 'First().filter(predicate) instead")
public struct FirstWhere<Input>: Parser
where
  Input: Collection,
  Input.SubSequence == Input
{
  public let predicate: (Input.Element) -> Bool

  @inlinable
  public init(_ predicate: @escaping (Input.Element) -> Bool) {
    self.predicate = predicate
  }

  @inlinable
  public func parse(_ input: inout Input) -> Input.Element? {
    guard let first = input.first, self.predicate(first) else { return nil }
    input.removeFirst()
    return first
  }
}

@available(*, deprecated, message: "Use 'First().filter(predicate) instead")
extension Parsers {
  public typealias FirstWhere = Parsing.FirstWhere  // NB: Convenience type alias for discovery
}
