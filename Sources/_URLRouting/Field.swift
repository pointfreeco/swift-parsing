/// Parses a named field's value with a string parser.
///
/// Useful for incrementally parsing values from various request fields, including ``Query``
/// parameters, ``Headers`` and ``Cookies``, and ``FormData``.
public struct Field<Value: Parser>: Parser where Value.Input == Substring {
  @usableFromInline
  let defaultValue: Value.Output?

  @usableFromInline
  let name: String

  @usableFromInline
  let valueParser: Value

  @inlinable
  public init(
    _ name: String,
    _ value: Value,
    default defaultValue: Value.Output
  ) {
    self.defaultValue = defaultValue
    self.name = name
    self.valueParser = value
  }

  @inlinable
  public init(
    _ name: String,
    _ value: Value
  ) {
    self.defaultValue = nil
    self.name = name
    self.valueParser = value
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
