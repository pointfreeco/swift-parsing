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

struct User: Equatable {
  var id: Int
  var name: String
  var isAdmin: Bool
}

func foo() {
  let user = Parse {
    Int.parser()
    ","
    Prefix { $0 != "," }
    ","
    Bool.parser()
  }
  _ = user.parse("1,Blob,true")
  _ = user.print((1, "Blob", true))
}
