extension Conversions {
  public struct FromParser<Upstream>: Conversion where Upstream: ParserPrinter {
    public let parser: Upstream

    public func apply(_ input: Upstream.Input) -> Upstream.Output? {
      var input = input
      return self.parser.parse(&input)
    }

    public func unapply(_ output: Upstream.Output) -> Upstream.Input? {
      self.parser.print(output)
    }
  }
}
