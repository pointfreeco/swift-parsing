public protocol Printer {
  associatedtype Input
  associatedtype Output
  func print(_ output: Output) -> Input?
}


public protocol Appendable {
  init()
  mutating func append(contentsOf other: Self)
}

import Foundation

extension Array: Appendable {}
extension ArraySlice: Appendable {}
extension ContiguousArray: Appendable {}
extension Data: Appendable {}
extension Slice: Appendable where Base: RangeReplaceableCollection {}
extension String: Appendable {}
extension String.UnicodeScalarView: Appendable {}
extension Substring: Appendable {}
extension Substring.UnicodeScalarView: Appendable {}

extension Substring.UTF8View: Appendable {
  @inlinable
  public init() {
    self = ""[...].utf8
  }

  @inlinable
  public mutating func append(contentsOf other: Substring.UTF8View) {
    var str = Substring(self)
    str.append(contentsOf: Substring(other))
    self = str.utf8
  }
}


struct User: Equatable {
  var id: Int
  var name: String
  var isAdmin: Bool
}

func foo() {

//  Int.parser().print(123) as Substring?

  Int.parser(of: Substring.self).parse("123")
//  Int.parser(of: Substring.self).print(123)


  let tmp = Bool.parser(of: Substring.self)
  
  Bool.parser(of: Substring.self).parse("true")
  Bool.parser(of: ArraySlice<UInt8>.self).print(true)


//  let tmp = Bool.parser(of: Substring.self)


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
  public func eraseToParserPrinter() -> AnyParserPrinter<Input, Output> {
    AnyParserPrinter(_parse: self.parse(_:), _print: self.print(_:))
  }
}

public struct AnyParserPrinter<Input, Output>: Parser, Printer {
  let _parse: (inout Input) -> Output?
  let _print: (Output) -> Input?

  public func parse(_ input: inout Input) -> Output? {
    self._parse(&input)
  }
  public func print(_ output: Output) -> Input? {
    self._print(output)
  }
}

extension Zip2_OV: Printer
where
  P0: Printer,
  P1: Printer,
  P0.Input: Appendable
{
  public func print(_ output: P0.Output) -> P0.Input? {
    guard
      var input0 = self.p0.print(output),
      let input1 = self.p1.print(())
    else { return nil }

    input0.append(contentsOf: input1)
    return input0
  }
}
extension Zip3_VOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Input: Appendable
{
  public func print(_ output: P1.Output) -> P0.Input? {
    guard
      var input0 = self.p0.print(()),
      let input1 = self.p1.print(output),
      let input2 = self.p2.print(())
    else { return nil }

    input0.append(contentsOf: input1)
    input0.append(contentsOf: input2)
    return input0
  }
}

extension Zip5_OVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input == Substring
{
  public func print(_ output: (P0.Output, P2.Output, P4.Output)) -> P0.Input? {
    guard
      let input0 = self.p0.print(output.0),
      let input1 = self.p1.print(()),
      let input2 = self.p2.print(output.1),
      let input3 = self.p3.print(()),
      let input4 = self.p4.print(output.2)
    else { return nil }

    return input0 + input1 + input2 + input3 + input4
  }
}


extension Parse: Printer where Upstream: Printer {
  public func print(_ output: Upstream.Output) -> Upstream.Input? {
    self.upstream.print(output)
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
  public func print(_ output: UTF8ViewParser.Output) -> Substring? {
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
  public func print(_ output: ()) -> Substring? {
    self[...]
  }
}


extension Whitespace: Printer {
  public func print(_ output: Input) -> Input? {
    output
  }
}

extension Prefix: Printer {
  public func print(_ output: Input) -> Input? {
    let count = output.count
    guard
      count >= self.minLength,
      count <= self.maxLength ?? .max,
      self.predicate.map({ output.allSatisfy($0) }) ?? true
    else { return nil }
    return output
  }
}

extension Parsers.SubstringBoolParser: Printer {
  public func print(_ output: Bool) -> Substring? {
    switch output {
    case true:
      return "true"
    case false:
      return "false"
    }
  }
}

extension Parsers.SubstringIntParser: Printer {
  public func print(_ output: Output) -> Substring? {
    "\(output)"
  }
}

extension OneOf: Printer where Upstream: Printer {
  public func print(_ output: Upstream.Output) -> Upstream.Input? {
    self.upstream.print(output)
  }
}

extension OneOf3: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer
{
  public func print(_ output: P0.Output) -> P0.Input? {
    self.p0.print(output)
      ?? self.p1.print(output)
      ?? self.p2.print(output)
  }
}

extension OneOf2: Printer
where
  P0: Printer,
  P1: Printer
{
  public func print(_ output: P0.Output) -> P0.Input? {
    self.p0.print(output)
      ?? self.p1.print(output)
  }
}

public struct PreferredPrinting<Upstream, Input> {
  public let upstream: Upstream
  public let preferredInput: Input
}

extension Printer {
  public func preferredPrinting(_ input: Input) -> PreferredPrinting<Self, Input> {
    .init(upstream: self, preferredInput: input)
  }
}

extension PreferredPrinting: Printer
where
  Upstream: Printer,
  Upstream.Input == Input
{
  public func print(_ output: ()) -> Input? {
    self.preferredInput
  }
}

extension PreferredPrinting: Parser where Upstream: Parser, Upstream.Input == Input {
  public func parse(_ input: inout Input) -> ()? {
    _ = self.upstream.parse(&input)
    return ()
  }
}

extension FromUTF8View: Printer where UTF8Parser: Printer {
  public func print(_ output: UTF8Parser.Output) -> Substring? {
    self.utf8Parser.print(output).map(Substring.init)
  }
}
