@testable import Parsing
import XCTest

final class OneOfBuilderTests: XCTestCase {
  func testBuildArray() {
    enum Role: String, CaseIterable, Equatable {
      case admin
      case guest
      case member
    }

    let parser = OneOf {
      for role in Role.allCases {
        role.rawValue.map { role }
      }
    }

    for role in Role.allCases {
      XCTAssertEqual(role, try parser.parse(role.rawValue))
    }
    XCTAssertThrowsError(try parser.parse("president")) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:1
        1 | president
          | ^ expected "admin"

        error: unexpected input
         --> input:1:1
        1 | president
          | ^ expected "guest"

        error: unexpected input
         --> input:1:1
        1 | president
          | ^ expected "member"
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
  }

  func testBuildIf() {
    enum Role {
      case admin
      case guest
      case member
    }

    var parseAdmins = false
    var parser = OneOf {
      if parseAdmins {
        "admin".map { Role.admin }
      }

      "guest".map { Role.guest }
      "member".map { Role.member }
    }

    XCTAssertEqual(.guest, try parser.parse("guest"))
    XCTAssertThrowsError(try parser.parse("admin")) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:1
        1 | admin
          | ^ expected "guest"

        error: unexpected input
         --> input:1:1
        1 | admin
          | ^ expected "member"
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }

    parseAdmins = true
    parser = OneOf {
      if parseAdmins {
        "admin".map { Role.admin }
      }

      "guest".map { Role.guest }
      "member".map { Role.member }
    }
    XCTAssertEqual(.guest, try parser.parse("guest"))
    XCTAssertEqual(.admin, try parser.parse("admin"))
    XCTAssertThrowsError(try parser.parse("president")) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:1
        1 | president
          | ^ expected "admin"

        error: unexpected input
         --> input:1:1
        1 | president
          | ^ expected "guest"

        error: unexpected input
         --> input:1:1
        1 | president
          | ^ expected "member"
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
  }
}
