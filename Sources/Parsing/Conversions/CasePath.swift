@_exported import CasePaths

extension CasePath: Conversion {
  @inlinable
  public func apply(_ input: Value) -> Root? {
    self.embed(input)
  }

  @inlinable
  public func unapply(_ output: Root) -> Value? {
    self.extract(from: output)
  }
}
