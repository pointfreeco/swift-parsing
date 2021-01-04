extension Parsers {
  /// Parses out the first matching raw value in a list of possible values from the start of the current input.
  @inlinable
  public static func enumRawValue<EnumType: RawRepresentable>(
    in possibleValues: [EnumType]
  ) -> AnyParser<Substring, EnumType> where EnumType.RawValue == String {
    OneOfMany(
      possibleValues.map { value in
        StartsWith(value.rawValue[...]).map { value }
      }
    )
    .eraseToAnyParser()
  }
}

/// Provides an opt-in convenience high-level API for parsing enum values.
public protocol CaseParsable: RawRepresentable {}

extension CaseParsable where Self.RawValue == String {
  /// Parses out the first matching raw value from a list of possible values, or returns nil.
  ///
  /// Example:
  ///
  ///     enum SomeValues: String, CaseParseable {
  ///         case one
  ///         case two
  ///     }
  ///
  ///     SomeValues.firstMatchingCase(in: [.one]).parse("one").output // SomeValues.one
  ///     SomeValues.firstMatchingCase(in: [.two]).parse("one").output // nil
  ///
  public static func firstMatchingCase(
    in possibleValues: [Self]
  ) -> AnyParser<Substring, Self> {
    Parsers.enumRawValue(in: possibleValues)
  }
}

extension CaseParsable where Self: CaseIterable, Self.RawValue == String {
  /// Parses out the first matching raw value from all possible cases, or returns nil.
  ///
  /// Example:
  ///
  ///     enum SomeValues: String, CaseParseable, CaseIterable {
  ///         case one
  ///         case two
  ///     }
  ///
  ///     SomeValues.firstMatchingCase.parse("one").output // SomeValues.one
  ///     SomeValues.firstMatchingCase.parse("six").output // nil
  ///
  public static var firstMatchingCase: AnyParser<Substring, Self> {
    Parsers.enumRawValue(in: allCases as? [Self] ?? [])
  }
}
