protocol Printer {
  associatedtype Input
  associatedtype Output
  func print(_ output: Output) -> Input?
}



struct User: Equatable {
  var id: Int
  var name: String
  var isAdmin: Bool
}

func foo() {

//  Int.parser().print(123) as Substring?

  Int.parser(of: Substring.self).parse("123")
  Int.parser(of: Substring.self).print(123)


  let tmp = Bool.parser(of: Substring.self)
  
  Bool.parser(of: Substring.self).parse("true")
  Bool.parser(of: Substring.self).print(true)


  let tmp = Bool.parser(of: Substring.self)


  ",".print(())
  Prefix { $0 != "," }.print(" ")

  let user = Parse {
    Int.parser()
    ","
    Prefix { $0 != "," }
    ","
    Bool.parser()
  }

//  user.pars

//    .print((1, "", true))
//    .print((10, "", true))
}

extension Parser where Self: Printer {
  func eraseToParserPrinter() -> AnyParserPrinter<Input, Output> {
    AnyParserPrinter(_parse: self.parse(_:), _print: self.print(_:))
  }
}

struct AnyParserPrinter<Input, Output>: Parser, Printer {
  let _parse: (inout Input) -> Output?
  let _print: (Output) -> Input?

  func parse(_ input: inout Input) -> Output? {
    self._parse(&input)
  }
  func print(_ output: Output) -> Input? {
    self._print(output)
  }
}

extension Zip5_OVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer
{
  func print(_ output: (P0.Output, P2.Output, P4.Output)) -> P0.Input? {
    guard
      let input0 = self.p0.print(output.0),
      let input1 = self.p1.print(()),
      let input2 = self.p2.print(output.1),
      let input3 = self.p3.print(()),
      let input4 = self.p4.print(output.2)
    else { return nil }

    fatalError("todo")
  }
}


extension Parse: Printer where Upstream: Printer {
  func print(_ output: Upstream.Output) -> Upstream.Input? {
    self.upstream.print(output)
  }
}

extension Prefix: Printer {
  public func print(_ output: Input) -> Input? {
    output
  }
}

extension Parsers.BoolParser: Printer
where
  Input: RangeReplaceableCollection
{
  public func print(_ output: Bool) -> Input? {
    switch output {
    case true:
      return Input([116, 114, 117, 101])
    case false:
      return Input([102, 97, 108, 115, 101])
    }
  }
}

extension Parsers.UTF8ViewToSubstring: Printer
where
  UTF8ViewParser: Printer
{
  func print(_ output: UTF8ViewParser.Output) -> Substring? {
    self.utf8ViewParser.print(output).map(Substring.init)
  }
}

extension Parsers.IntParser: Printer
where
  Input: RangeReplaceableCollection
{
  public func print(_ output: Output) -> Input? {
    Input(String(output, radix: self.radix).utf8)
  }
}

extension String: Printer {
  func print(_ output: ()) -> Substring? {
    self[...]
  }
}
