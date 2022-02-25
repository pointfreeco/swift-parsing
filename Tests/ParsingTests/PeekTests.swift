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

    let result = duplicator.parse(&input)

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
  
  func testPrintSucceeds() {
    var input = "alpha"[...]
    
    let parser = Peek { Prefix(1) { $0.isLetter } }
    
    XCTAssertNoThrow(try parser.print("a", to: &input))
    XCTAssertNoDifference(input, "alpha"[...])
  }
  
  func testPrintFailsWithIncorrectOutput() {
    var input = "alpha"[...]
    
    let parser = Peek { Prefix(1) { $0.isLetter } }
    
    XCTAssertThrowsError(try parser.print("b", to: &input))
    XCTAssertNoDifference(input, "alpha"[...])
  }
  
  func testPrintFailsWithIncorrectInput() {
    var input = "1alpha"[...]
    
    let parser = Peek { Prefix(1) { $0.isLetter } }
    
    XCTAssertThrowsError(try parser.print("1", to: &input))
    XCTAssertNoDifference(input, "1alpha"[...])
  }
  
  func testPrintCompositePeekSucceeds() {
    var input = "!"[...]

    let identifier = Parse {
      Peek {
        Prefix(1) { $0.isLetter || $0 == "_" }
      }
      Prefix { $0.isNumber || $0.isLetter || $0 == "_" }
    }

    XCTAssertNoThrow(try identifier.print(("f", "foo_1"[...]), to: &input))
    XCTAssertNoDifference(input, "foo_1!")
  }
  
  func testPrintCompositePeekFails() {
    var input = "!"[...]

    let identifier = Parse {
      Peek {
        Prefix(1) { $0.isLetter || $0 == "_" }
      }
      Prefix { $0.isNumber || $0.isLetter || $0 == "_" }
    }

    XCTAssertThrowsError(try identifier.print(("1", "1foo_1"[...]), to: &input))
    XCTAssertNoDifference(input, "1foo_1!")
  }
  
  func testPrintSkippedPeekSucceeds() {
    var input = "!"[...]

    let identifier = Parse {
      Skip {
        Peek {
          Prefix(1) { $0.isLetter || $0 == "_" }
        }
      }
      .printing("") // this will bypass actually printing the upstream parser in `Skip`
      Prefix { $0.isNumber || $0.isLetter || $0 == "_" }
    }

    XCTAssertNoThrow(try identifier.print("foo"[...], to: &input))
    XCTAssertNoDifference(input, "foo!")
  }
  
  func testPrintSkippedPeekSucceedsUnexpectedly() {
    var input = "!"[...]

    let identifier = Parse {
      Skip {
        Peek {
          Prefix(1) { $0.isLetter || $0 == "_" }
        }
      }
      .printing("") // this will bypass actually printing the upstream parser in `Skip`
      Prefix { $0.isNumber || $0.isLetter || $0 == "_" }
    }

    // Should fail because '1' is not allowed for the first character, checked by the `Peek`,
    // but parses because of `.printing("")` statement bypasses the `Peek`.
    XCTAssertNoThrow(try identifier.print("1foo"[...], to: &input))
    XCTAssertNoDifference(input, "1foo!")
  }
}
