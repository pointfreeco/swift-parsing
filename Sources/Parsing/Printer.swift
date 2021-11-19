import Foundation

public protocol Printer {
  associatedtype Input
  associatedtype Output
  func print(_ output: Output) -> Input?
}

public typealias ParserPrinter = Parser & Printer

extension Printer where Output == Void {
  @inlinable
  public func print() -> Input? {
    self.print(())
  }
}

// MARK: -

extension Parsers.UTF8ViewToSubstring: Printer
where
  UTF8ViewParser: Printer
{
  public func print(_ output: UTF8ViewParser.Output) -> Substring? {
    self.utf8ViewParser.print(output).map(Substring.init)
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

extension Parsers.IntParser: Printer
where
  Input: RangeReplaceableCollection
{
  public func print(_ output: Output) -> Input? {
    Input(String(output, radix: self.radix).utf8)
  }
}

extension Parsers.SubstringIntParser: Printer {
  public func print(_ output: Output) -> Substring? {
    "\(output)"
  }
}

extension Whitespace: Printer {
  public func print(_ output: Input) -> Input? {
    output
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

//extension Many: Printer
//where
//  Upstream: Printer,
//  Upstream.Input: Appendable,
//  Separator: Printer,
//  Separator.Output == Void,
//  Result: Collection,
//  Result.Element == Upstream.Output
//{
//  public func print(_ output: Result) -> Upstream.Input? {
//    let range = self.minimum...self.maximum
//    var input = Upstream.Input()
//
//    var count = 0
//    guard let firstInput = output.first.flatMap(self.upstream.print)
//    else { return range.contains(count) ? input : nil }
//
//    input.append(contentsOf: firstInput)
//    count += 1
//
//    for element in output.dropFirst() {
//      guard let elementInput = self.upstream.print(element)
//      else { return input }
//
//      if count > self.maximum {
//        return nil
//      }
//
//      if let separatorInput = self.separator?.print(()) {
//        input.append(contentsOf: separatorInput)
//      }
//      input.append(contentsOf: elementInput)
//      count += 1
//    }
//
//    return range.contains(count) ? input : nil
//  }
//}

// MARK: -

struct User: Equatable {
  var id: Int
  var name: String
  var isAdmin: Bool
}

func foo() {

//
////  Int.parser().print(123) as Substring?
//
//  Int.parser(of: Substring.self).parse("123")
////  Int.parser(of: Substring.self).print(123)
//
//
//  let tmp = Bool.parser(of: Substring.self)
//
//  Bool.parser(of: Substring.self).parse("true")
//  Bool.parser(of: ArraySlice<UInt8>.self).print(true)
//
//
////  let tmp = Bool.parser(of: Substring.self)
//
//
//  ",".print(())
//  Prefix { $0 != "," }.print(" ")
//
//  let user = Parse {
//    Int.parser()
//    ","
//    Prefix { $0 != "," }
//    ","
//    Bool.parser()
//  }
//
//
//
//
////  user.pars
//
////    .print((1, "", true))
////    .print((10, "", true))
}
