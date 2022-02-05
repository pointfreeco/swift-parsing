// TODO: Should this actually be `ValueParser`?
// TODO: Should `ValueConversion.Input` already be `String`?
// TODO: Can we use `.parsed(by: Parser)` to create a parser conversion?

/*
 TODO: What about `Path`? `Conversion` vs. `Parser`???

 Currently:

     Route(/Account.Invoices.show) {
       Path {
         "invoices"
         Int.parser()
         "show"
       }
     }

 With conversions:

     Route(/Account.Invoices.show) {
       Path(.parsed(by: "invoices"))
       Path(.converted(to: Int.self))
       Path(.parsed(by: "show"))
     }

 Or could `Path` be created with either a conversion or a parser:

     Route(/Account.Invoices.show) {
       Path("invoices")
       Path(.converted(to: Int.self))
       Path("show")
     }

 Is builder syntax possible via `buildExpression` and/or additional APIs?

     Route(/Account.Invoices.show) {
       Path {
         "invoices"
         Int.conversion()
         "show"
       }
     }
 */

public struct Field<ValueParser>: Parser
where
  ValueParser: Parser,
  ValueParser.Input == Substring
{
  // FIXME: We should probably just use `.replaceError(with:)` here? See `_URLRoutingTests`...
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
