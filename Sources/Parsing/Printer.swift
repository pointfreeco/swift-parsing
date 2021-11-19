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
