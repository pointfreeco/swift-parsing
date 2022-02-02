extension Conversion {
  @inlinable
  public static func represented<Output>(as _: Output.Type) -> Self
  where Self == Conversions.RawRepresentableConversion<Output> {
    .init()
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
