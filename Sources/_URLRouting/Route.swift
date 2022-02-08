public struct Route<Parsers: Parser>: Parser where Parsers.Input == URLRequestData {
  @usableFromInline
  let parser: Parsers

  // TODO: Parser initializers

  @inlinable
  public func parse(_ input: inout URLRequestData) throws -> Parsers.Output {
    let output = try self.parser.parse(&input)
    if input.method != nil {
      try Method.get.parse(&input)
    }
    try End().parse(input.path)
    return output
  }
}

extension Route: Printer where Parsers: Printer {
  @inlinable
  public init<C: Conversion, P: Parser>(
    _ conversion: C,
    @ParserBuilder to parser: () -> P
  ) where Parsers == Parsing.Parsers.MapConversion<P, C> {
    self.parser = parser().map(conversion)
  }

  @inlinable
  public init<C: Conversion>(
    _ conversion: C
  ) where Parsers == Parsing.Parsers.MapConversion<Always<URLRequestData, Void>, C> {
    self.init(conversion) {
      Always<URLRequestData, Void>(())
    }
  }

  @inlinable
  public func print(_ output: Parsers.Output, to input: inout URLRequestData) rethrows {
    try self.parser.print(output, to: &input)
  }
}
