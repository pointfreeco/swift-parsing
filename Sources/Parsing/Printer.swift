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
    Prefix { $0 != "," }.pipe { UnsafeBitCast(String.init) }
    ","
    Bool.parser()
  }
  .pipe { UnsafeBitCast(User.init) }

  _ = user.parse("1,Blob,true")
  _ = user.print(User(id: 1, name: "Blob", isAdmin: true))
}

public struct UnsafeBitCast<Values, Root>: ParserPrinter {
  let initializer: (Values) -> Root

  init(_ initializer: @escaping (Values) -> Root) {
    self.initializer = initializer
  }

  public func parse(_ input: inout Values) -> Root? {
    self.initializer(input)
  }

  public func print(_ output: Root) -> Values? {
    Swift.unsafeBitCast(output, to: Values.self)
  }
}
