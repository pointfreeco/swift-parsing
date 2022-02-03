extension Conversion {
  @inlinable
  public func converted<NewOutput>(
    to _: NewOutput.Type
  ) -> Conversions.Map<Self, Conversions.LosslessStringConvertibleConversion<NewOutput>> {
    self.map(.init())
  }
}

extension Conversions {
  public struct LosslessStringConvertibleConversion<Output>: Conversion
  where
    Output: LosslessStringConvertible
  {
    @usableFromInline
    init() {}

    @inlinable
    public func apply(_ input: String) throws -> Output {
      guard let output = Output(input)
      else { throw ConvertingError() }

      return output
    }

    @inlinable
    public func unapply(_ output: Output) -> String {
      output.description
    }
  }
}
