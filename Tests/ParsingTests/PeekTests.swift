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
