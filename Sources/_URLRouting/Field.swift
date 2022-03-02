// FIXME: Should there be a `NameParser`?

public struct Field<Value>: Parser
where
  Value: Parser,
  Value.Input == Substring
{
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

    let output = try Parse {
      self.valueParser
      End()
    }.parse(&value)

    input[self.name]?.removeFirst()
    if input[self.name]?.isEmpty ?? true {
      input[self.name] = nil
    }
    return output
  }
}

extension Field: Printer where Value: Printer {
  @inlinable
  public func print(_ output: Value.Output, into input: inout URLRequestData.Fields) rethrows {
    if let defaultValue = self.defaultValue, isEqual(output, defaultValue) { return }
    input[self.name, default: []].prepend(try valueParser.print(output))
  }
}
