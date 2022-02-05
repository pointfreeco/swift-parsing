extension Conversion {
  @inlinable
  public static func representing<NewOutput>(
    _: NewOutput.Type
  ) -> Self where Self == Conversions.RawRepresentable<NewOutput> {
    .init()
  }

  @inlinable
  public func representing<NewOutput>(
    _: NewOutput.Type
  ) -> Conversions.Map<Self, Conversions.RawRepresentable<NewOutput>> {
    self.map(.representing(NewOutput.self))
  }
}

extension Conversions {
  public struct RawRepresentable<Output>: Conversion where Output: Swift.RawRepresentable {
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
