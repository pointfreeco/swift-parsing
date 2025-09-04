extension Conversion {
  /// A conversion from a given raw representable type's raw value to itself.
  ///
  /// This conversion is useful for mapping the output of a more primitive parser-printer into a
  /// raw representable value.
  ///
  /// For example, you may have a raw representable type that wraps a more primitive type for the
  /// purpose of strengthening type requirements in your APIs. One example is an identifier type
  /// that wraps an integer:
  ///
  /// ```swift
  /// struct UserID: RawRepresentable {
  ///   var rawValue: Int
  /// }
  /// ```
  ///
  /// You can transform an `Int` parser into a `UserID` parser by invoking ``Parser/map(_:)-18m9d``
  /// with this conversion:
  ///
  /// ```swift
  /// let userID = Int.parser().map(.representing(UserID.self))
  /// ```
  ///
  /// See ``representing(_:)-swift.method`` for a fluent version of this interface that transforms
  /// an existing conversion. This fluent API is particularly useful when mapping string raw values
  /// directly from parsers of substrings and UTF-8 views, which require first transforming the
  /// parsed substring or UTF-8 view into a string via the ``string-swift.type.property-9owth`` and
  /// ``string-swift.type.property-3u2b5`` conversions.
  ///
  /// ```swift
  /// struct EmailAddress: RawRepresentable {
  ///   var rawValue: String
  /// }
  ///
  /// let emailAddress = Parse(.string.representing(EmailAddress.self)) {
  ///   Consumed {
  ///     PrefixUpTo("@")
  ///     "@"
  ///     Rest()
  ///   }
  /// }
  /// ```
  ///
  /// - Parameter type: A type that conforms to `RawRepresentable`.
  /// - Returns: A conversion from a raw value to the given type.
  @inlinable
  public static func representing<NewOutput>(
    _ type: NewOutput.Type
  ) -> Self where Self == Conversions.FromRawValue<NewOutput> {
    .init()
  }

  /// Transforms this conversion to a raw value into a conversion to the given raw representable
  /// type.
  ///
  /// A fluent version of ``Conversion/representing(_:)-swift.type.method``. Equivalent to calling
  /// ``map(_:)`` with ``Conversion/representing(_:)-swift.type.method``:
  ///
  /// ```swift
  /// stringConversion.representing(EmailAddress.self)
  /// // =
  /// stringConversion.map(.representing(EmailAddress.self)
  /// ```
  ///
  /// - Parameter type: A type that conforms to `RawRepresentable`.
  /// - Returns: A conversion from a raw value to the given type.
  @inlinable
  public func representing<NewOutput>(
    _ type: NewOutput.Type
  ) -> Conversions.Map<Self, Conversions.FromRawValue<NewOutput>> {
    self.map(.representing(NewOutput.self))
  }
}

extension Conversions {
  /// A conversion from a raw value to a raw representable type.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/representing(_:)-swift.type.method`` operation, which constructs this type.
  public struct FromRawValue<Output: RawRepresentable>: Conversion, Sendable {
    @inlinable
    public init() {}

    @inlinable
    public func apply(_ input: Output.RawValue) throws -> Output {
      guard let output = Output(rawValue: input)
      else {
        var debugDescription = ""
        debugPrint(input, to: &debugDescription)
        throw ConvertingError(
          """
          representing: Failed to convert \(debugDescription) to \(Output.self).
          """
        )
      }
      return output
    }

    @inlinable
    public func unapply(_ output: Output) -> Output.RawValue {
      output.rawValue
    }
  }
}
