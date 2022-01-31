public struct From<Upstream, Downstream>: ParserPrinter
where
  Upstream: Conversion,
  Downstream: ParserPrinter,
  Upstream.Output == Downstream.Input
{
  @usableFromInline
  let conversion: Upstream

  @usableFromInline
  let parser: Downstream

  @inlinable
  public init(_ conversion: Upstream, @ParserBuilder _ parser: () -> Downstream) {
    self.conversion = conversion
    self.parser = parser()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) rethrows -> Downstream.Output {
    var parserInput = try self.conversion.apply(input)
    let output = try self.parser.parse(&parserInput)
    input = try self.conversion.unapply(parserInput)
    return output
  }

  @inlinable
  public func print(_ output: Downstream.Output, to input: inout Upstream.Input) rethrows {
    var parserInput = try self.conversion.apply(input)
    try self.parser.print(output, to: &parserInput)
    input = try self.conversion.unapply(parserInput)
  }
}
