extension Parsers {
  public struct OneOfMany<Parsers>: Parser where Parsers: Parser {
    public let parsers: [Parsers]

    @inlinable
    public init(_ parsers: [Parsers]) {
      self.parsers = parsers
    }

    @inlinable
    @inline(__always)
    public func parse(_ input: inout Parsers.Input) -> Parsers.Output? {
      for parser in self.parsers {
        if let output = parser.parse(&input) {
          return output
        }
      }
      return nil
    }
  }
}

extension Parsers.OneOfMany: Printer where Parsers: Printer {
  @inlinable
  public func print(_ output: Parsers.Output) -> Parsers.Input? {
    for parser in self.parsers.reversed() {
      if let input = parser.print(output) {
        return input
      }
    }
    return nil
  }
}
