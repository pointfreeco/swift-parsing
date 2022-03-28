extension Conversion {
  /// A conversion from a string to a lossless string-convertible type.
  ///
  /// See ``lossless(_:)-swift.method`` for a fluent version of this interface that transforms an
  /// existing conversion.
  ///
  /// - Parameter type: A type that conforms to `LosslessStringConvertible`.
  /// - Returns: A conversion from a string to the given type.
  @inlinable
  public static func lossless<NewOutput>(
    _ type: NewOutput.Type
  ) -> Self where Self == Conversions.FromLosslessString<NewOutput> {
    .init()
  }

  /// Transforms this conversion to a string into a conversion to the given lossless
  /// string-convertible type.
  ///
  /// A fluent version of ``Conversion/lossless(_:)-swift.type.method``. Equivalent to calling
  /// `Conversion.map(.lossless(NewOutput.self))`.
  ///
  /// - Parameter type: A type that conforms to `LosslessStringConvertible`.
  /// - Returns: A conversion from a string to the given type.
  @inlinable
  public func lossless<NewOutput>(
    _ type: NewOutput.Type
  ) -> Conversions.Map<Self, Conversions.FromLosslessString<NewOutput>> {
    self.map(.lossless(NewOutput.self))
  }
}

extension Conversions {
  /// A conversion from a string to a lossless string-convertible type.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/lossless(_:)-swift.type.method`` and ``Conversion/lossless(_:)-swift.method``
  /// operations, which construct this type under the hood.
  public struct FromLosslessString<Output: LosslessStringConvertible>: Conversion {
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
