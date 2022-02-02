public struct Field<ValueParser>: Parser
where
  ValueParser: Parser,
  ValueParser.Input == Substring
{
  @usableFromInline
  let defaultValue: ValueParser.Output?

  @usableFromInline
  let name: String

  @usableFromInline
  let valueParser: ValueParser

  @inlinable
  public init(
    _ name: String,
    _ value: ValueParser,
    default defaultValue: ValueParser.Output? = nil
  ) {
    self.defaultValue = defaultValue
    self.name = name
    self.valueParser = value
  }

  @inlinable
  public init(
    _ name: String,
    default defaultValue: ValueParser.Output? = nil
  ) where ValueParser == Rest<Substring> {
    self.init(
      name,
      Rest(),
      default: defaultValue
    )
  }

  @inlinable
  public func parse(_ input: inout URLRequestData.Fields) throws -> ValueParser.Output {
    func defaultOrThrow() throws -> ValueParser.Output {
      guard let defaultValue = self.defaultValue
      else { throw RoutingError() }

      return defaultValue
    }

    guard
      let wrapped = input[self.name]?.first,
      var value = wrapped
    else { return try defaultOrThrow() }

    let output = try self.valueParser.parse(&value)

    guard value.isEmpty
    else { return try defaultOrThrow() }

    input[self.name]?.removeFirst()
    if input[self.name]?.isEmpty ?? true {
      input[self.name] = nil
    }
    return output
  }
}

extension Field: Printer where ValueParser: Printer {
  @inlinable
  public func print(_ output: ValueParser.Output, to input: inout URLRequestData.Fields) rethrows {
    if let defaultValue = self.defaultValue, isEqual(output, defaultValue) { return }
    input[self.name, default: []].append(try valueParser.print(output))
  }
}
