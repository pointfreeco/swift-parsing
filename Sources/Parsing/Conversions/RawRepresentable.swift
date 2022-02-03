extension Conversion {
  @inlinable
  public func represented<NewOutput>(
    as _: NewOutput.Type
  ) -> Conversions.Map<Self, Conversions.RawRepresentableConversion<NewOutput>> {
    self.map(.init())
  }
}

extension Conversions {
  public struct RawRepresentableConversion<Output>: Conversion where Output: RawRepresentable {
    @inlinable
    public init() {}

    @inlinable
    public func apply(_ input: Output.RawValue) throws -> Output {
      guard let output = Output(rawValue: input)
      else { throw ConvertingError() }
      return output
    }

    @inlinable
    public func unapply(_ output: Output) -> Output.RawValue {
      output.rawValue
    }
  }
}
