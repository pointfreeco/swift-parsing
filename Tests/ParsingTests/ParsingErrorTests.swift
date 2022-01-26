import Parsing
import XCTest

class ParsingErrorTests: XCTestCase {
  func testBasics() throws {
    var input = "World"[...]
    try "Hello".parse(&input)
  }

  func testIntParser() throws {
    var input = "World"[...]
    try Int.parser().parse(&input)
  }

  func testUserParser() throws {
    enum Role {
      case guest, member, admin
    }
    let role = OneOf {
      "guest".map { Role.guest }
      "member".map { Role.member }
      "admin".map { Role.admin }
    }
    struct User {
      var id: Int
      var name: String
      var role: Role
    }
    let user = Parse(User.init) {
      Int.parser()
      ","
      Prefix { $0 != "," }.map(String.init)
      ","
      role
      End()
    }

    var input = """
      1,Blob,true
      2,Blob Jr,false
      """[...]
    let _: User = try user.parse(&input)
  }

  func testUsersParser() throws {
    enum Role {
      case guest, member, admin
    }
    let role = OneOf {
      "guest".map { Role.guest }
      "member".map { Role.member }
      "admin".map { Role.admin }
    }
    struct User {
      var id: Int
      var name: String
      var role: Role
    }
    let user = Parse(User.init) {
      Int.parser()
      ","
      Prefix { $0 != "," }.map(String.init)
      ","
      role
    }

    let users = Many {
      user
    } separator: {
      "\n"
    } terminator: {
      End()
    }

    var input = """
      1,Blob,member-
      2,Blob Jr,guest
      """[...]
    let _: [User] = try users.parse(&input)
  }
}
