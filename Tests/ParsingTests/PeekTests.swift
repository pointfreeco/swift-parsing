import Parsing
import XCTest

class PeekTests: XCTestCase {
  func testPeekDuplicate() throws {
    var input = "foobar"[...]

    let duplicator = Parse {
      Peek { Rest<Substring>() }
      Rest()
    }

    let result = try duplicator.parse(&input)

    XCTAssertEqual(result.0, "foobar")
    XCTAssertEqual(result.1, "foobar")
    XCTAssertEqual(input, "")
  }

  func testPeekMatches() throws {
    var input = "_foo1 = nil"[...]

    let identifier = Parse {
      Skip {
        Peek { Prefix(1) { $0.isLetter || $0 == "_" } }
      }
      Prefix { $0.isNumber || $0.isLetter || $0 == "_" }
    }

    let result = try identifier.parse(&input)

    XCTAssertEqual(result, "_foo1")
    XCTAssertEqual(input, " = nil")
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

    XCTAssertThrowsError(try identifier.parse(&input))
    XCTAssertEqual(input, "1foo = nil")
  }
}
