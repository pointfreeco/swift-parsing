@_exported import CasePaths

extension CasePath: Conversion {
  @inlinable
  public func apply(_ input: Value) -> Root {
    self.embed(input)
  }

  @inlinable
  public func unapply(_ output: Root) throws -> Value {
    guard let value = self.extract(from: output)
    else { throw ParsingError() }
    return value
  }
}
