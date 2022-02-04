extension Conversion {
  @inlinable
  public static func losslessStringConvertible<NewOutput>(
    to _: NewOutput.Type
  ) -> Self where Self == Conversions.LosslessStringConvertible<NewOutput> {
    .init()
  }

  @inlinable
  public func losslessStringConvertible<NewOutput>(
    to _: NewOutput.Type
  ) -> Conversions.Map<Self, Conversions.LosslessStringConvertible<NewOutput>> {
    self.map(.losslessStringConvertible(to: NewOutput.self))
  }
}

extension Conversions {
  public struct LosslessStringConvertible<Output>: Conversion
  where
    Output: Swift.LosslessStringConvertible
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
