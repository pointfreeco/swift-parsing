extension Conversion {
  /// A conversion from a given raw representable type's raw value to itself.
  ///
  /// See ``Conversion/representing(_:)-swift.method`` for a fluent version of this interface that
  /// transforms an existing conversion.
  ///
  /// - Parameter type: A type that conforms to `RawRepresentable`.
  /// - Returns: A conversion from a raw value to the given type.
  @inlinable
  public static func representing<NewOutput>(
    _ type: NewOutput.Type
  ) -> Self where Self == Conversions.RawRepresentable<NewOutput> {
    .init()
  }

  /// Transforms this conversion to a raw value into a conversion to the given raw representable
  /// type.
  ///
  /// A fluent version of ``Conversion/representing(_:)-swift.type.method``. Equivalent to calling
  /// `Conversion.map(.representing(NewOutput.self)).
  ///
  /// - Parameter type: A type that conforms to `RawRepresentable`.
  /// - Returns: A conversion from a raw value to the given type.
  @inlinable
  public func representing<NewOutput>(
    _ type: NewOutput.Type
  ) -> Conversions.Map<Self, Conversions.RawRepresentable<NewOutput>> {
    self.map(.representing(NewOutput.self))
  }
}

extension Conversions {
  /// A conversion from a raw value to a raw representable type.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/representing(_:)-swift.type.method`` and
  /// ``Conversion/representing(_:)-swift.method`` operations, which construct this type under the
  /// hood.
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
