public struct FromUTF8View<UTF8Parser> {
  public let utf8Parser: UTF8Parser

  @inlinable
  public init(@ParserBuilder _ utf8Parser: () -> UTF8Parser) {
    self.utf8Parser = utf8Parser()
  }
}

extension FromUTF8View: Parser
where
  UTF8Parser: Parser,
  UTF8Parser.Input == Substring.UTF8View
{
  @inlinable
  public func parse(_ input: inout Substring) -> UTF8Parser.Output? {
    self.utf8Parser.parse(&input.utf8)
  }
}

extension FromUTF8View: Printer
where
  UTF8Parser: Printer,
  UTF8Parser.Input == Substring.UTF8View
{
  @inlinable
  public func print(_ output: UTF8Parser.Output) -> Substring? {
    self.utf8Parser.print(output).map(Substring.init)
  }
}
