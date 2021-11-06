public struct FromUTF8View<UTF8ViewParser>: Parser
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

extension Parsers {
  public typealias FromUTF8View = Parsing.FromUTF8View  // NB: Convenience type alias for discovery
}
