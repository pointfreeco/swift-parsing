@_exported import CasePaths

extension CasePath: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Value) -> Root {
    self.embed(input)
  }

  @inlinable
  public func print(_ output: Root) -> Value? {
    self.extract(from: output)
  }
}
