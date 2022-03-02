import CustomDump
import Parsing
import XCTest

class PeekTests: XCTestCase {
  func testPeekMatches() throws {
    var input = "_foo1 = nil"[...]

    let identifier = Parse {
      Peek { Prefix(1) { $0.isLetter || $0 == "_" } }
      Prefix { $0.isNumber || $0.isLetter || $0 == "_" }
    }

    XCTAssertNoDifference("_foo1"[...], try identifier.parse(&input))
    XCTAssertNoDifference(" = nil", input)
  }

  func testPeekFails() throws {
    var input = "1foo = nil"[...]

    let identifier = Parse {
      Peek { Prefix(1) { $0.isLetter || $0 == "_" } }
      Prefix { $0.isNumber || $0.isLetter || $0 == "_" }
    }

    XCTAssertThrowsError(try identifier.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | 1foo = nil
          | ^ expected 1 element satisfying predicate
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("1foo = nil", input)
  }

  func testBacktracking() throws {
    var input = "fooblah"[...]

    let parser = Peek {
      "foo"
      "bar"
    }

    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:4
        1 | fooblah
          |    ^ expected "bar"
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("blah"[...], input)
  }
}
