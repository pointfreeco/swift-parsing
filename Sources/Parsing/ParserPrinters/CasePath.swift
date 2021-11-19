@_exported import CasePaths

extension CasePath: ParserPrinter {
  public func parse(_ input: inout Value) -> Root? {
    self.embed(input)
  }

  public func print(_ output: Root) -> Value? {
    self.extract(from: output)
  }
}
