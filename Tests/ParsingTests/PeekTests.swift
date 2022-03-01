import CustomDump
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

    XCTAssertNoDifference(result.0, "foobar")
    XCTAssertNoDifference(result.1, "foobar")
    XCTAssertNoDifference(input, "")
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

    XCTAssertNoDifference(result, "_foo1")
    XCTAssertNoDifference(input, " = nil")
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
    XCTAssertNoDifference(input, "1foo = nil")
  }
}
