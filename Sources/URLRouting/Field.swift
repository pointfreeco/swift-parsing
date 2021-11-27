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
  public func parse(_ input: inout [String: ArraySlice<Substring?>]) -> ValueParser.Output? {
    guard
      let wrapped = input[self.name]?.first,
      var value = wrapped,
      let output = self.valueParser.parse(&value),
      value.isEmpty
    else { return self.defaultValue }

    input[self.name]?.removeFirst()
    if input[self.name]?.isEmpty ?? true {
      input[self.name] = nil
    }
    return output
  }
}

extension Field: Printer where ValueParser: Printer {
  @inlinable
  public func print(_ output: ValueParser.Output) -> [String: ArraySlice<Substring?>]? {
    if let defaultValue = self.defaultValue, isEqual(output, defaultValue) { return .init() }
    return self.valueParser.print(output).map { [self.name: [$0]] }
  }
}
