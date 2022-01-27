import Parsing
import XCTest

class ParsingErrorTests: XCTestCase {
  func testBasics() throws {
    var input = "World"[...]
    try "Hello".parse(&input)
  }

  func testIntParser() throws {
    var input = "World"[...]
    _ = try Int.parser().parse(&input) as Int
  }

  func testIntParserOverflow() throws {
    var input = "256"[...]
    _ = try UInt8.parser().parse(&input) as UInt8
  }

  func testUserParser() throws {
    struct User {
      var id: Int
      var name: String
      var isAdmin: Bool
    }
    let user = Parse(User.init) {
      Int.parser()
      ","
      Prefix { $0 != "," }.map(String.init)
      ","
      Bool.parser()
      End()
    }

    var input = """
      1,Blob,true
      2,Blob Jr,false
      3,Blob Sr,true
      """[...]
    _ = try user.parse(&input) as User
  }
}
