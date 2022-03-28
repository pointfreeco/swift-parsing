import Parsing
import XCTest

class PeekTests: XCTestCase {
  func testPeekMatches() throws {
    var input = "_foo1 = nil"[...]

    let identifier = Parse {
      Peek { Prefix(1) { $0.isLetter || $0 == "_" } }
      Prefix { $0.isNumber || $0.isLetter || $0 == "_" }
    }

    XCTAssertEqual("_foo1"[...], try identifier.parse(&input.utf8))
    XCTAssertEqual(" = nil", input)
  }

  func testPeekFails() throws {
    var input = "1foo = nil"[...]

    let identifier = Parse {
      Skip {
        Peek {
          Prefix(1) { $0.isLetter || $0 == "_" }
        }
      }
      Prefix { $0.isNumber || $0.isLetter || $0 == "_" }
    }

    XCTAssertThrowsError(try identifier.parse(&input.utf8))
    XCTAssertEqual("1foo = nil", input)
  }

  func testBacktracking() throws {
    var input = "fooblah"[...]

    let parser = Peek {
      "foo"
      "bar"
    }

    XCTAssertThrowsError(try parser.parse(&input.utf8))
    XCTAssertEqual("blah"[...], input)
  }
}
