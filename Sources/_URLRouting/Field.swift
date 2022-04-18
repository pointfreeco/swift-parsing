/// Parses a named field's value with a string parser.
///
/// Useful for incrementally parsing values from various request fields, including ``Query``
/// parameters, ``Headers`` and ``Cookies``, and ``FormData``.
///
/// For example, a search endpoint may include a few query items, which can be specified as fields:
///
/// ```swift
/// Query {
///   Field("q", .string, default: "")
///   Field("page", default: 1) {
///     Digits()
///   }
///   Field("per_page", default: 20) {
///     Digits()
///   }
/// }
/// ```
public struct Field<Value: Parser>: Parser where Value.Input == Substring {
  @usableFromInline
  let defaultValue: Value.Output?

  @usableFromInline
  let name: String

  @usableFromInline
  let valueParser: Value

  /// Initializes a named field parser.
  ///
  /// - Parameters:
  ///   - name: The name of the field.
  ///   - defaultValue: A default value if the field is absent. Prefer specifying a default over
  ///     applying `Parser.replaceError(with:)` if parsing should fail for invalid values.
  ///   - value: A parser that parses the field's substring value into something more
  ///     well-structured.
  @inlinable
  public init(
    _ name: String,
    default defaultValue: Value.Output? = nil,
    @ParserBuilder _ value: () -> Value
  ) {
    self.defaultValue = defaultValue
    self.name = name
    self.valueParser = value()
  }

  /// Initializes a named field parser.
  ///
  /// - Parameters:
  ///   - name: The name of the field.
  ///   - value: A conversion that transforms the field's substring value into something more
  ///     well-structured.
  ///   - defaultValue: A default value if the field is absent. Prefer specifying a default over
  ///     applying `Parser.replaceError(with:)` if parsing should fail for invalid values.
  @inlinable
  public init<C>(
    _ name: String,
    _ value: C,
    default defaultValue: Value.Output? = nil
  ) where Value == Parsers.MapConversion<Rest<Substring>, C> {
    self.defaultValue = defaultValue
    self.name = name
    self.valueParser = Rest().map(value)
  }

  @inlinable
  public func parse(_ input: inout URLRequestData.Fields) throws -> Value.Output {
    guard
      let wrapped = input[self.name]?.first,
      var value = wrapped
    else {
      guard let defaultValue = self.defaultValue
      else { throw RoutingError() }
      return defaultValue
    }

    let output = try self.valueParser.parse(&value)
    input[self.name]?.removeFirst()
    if input[self.name]?.isEmpty ?? true {
      input[self.name] = nil
    }
    return output
  }
}

extension Field: ParserPrinter where Value: ParserPrinter {
  @inlinable
  public func print(_ output: Value.Output, into input: inout URLRequestData.Fields) rethrows {
    if let defaultValue = self.defaultValue, isEqual(output, defaultValue) { return }
    input[self.name, default: []].prepend(try valueParser.print(output))
  }
}
