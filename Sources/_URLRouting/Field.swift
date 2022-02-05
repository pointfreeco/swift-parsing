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
