// FIXME: Should there be a `NameParser`?

public struct Field<ValueParser>: Parser
where
  ValueParser: Parser,
  ValueParser.Input == Substring
{
  @usableFromInline
  let name: String

  @usableFromInline
  let valueParser: ValueParser

  @inlinable
  public init(
    _ name: String,
    _ value: ValueParser
  ) {
    self.name = name
    self.valueParser = value
  }

  @inlinable
  public func parse(_ input: inout URLRequestData.Fields) throws -> ValueParser.Output {
    guard
      let wrapped = input[self.name]?.first,
      var value = wrapped
    else { throw RoutingError() }

    let output = try Parse { self.valueParser; End() }.parse(&value)

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
    input[self.name, default: []].append(try valueParser.print(output))
  }
}
