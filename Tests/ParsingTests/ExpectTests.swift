import CustomDump
import Parsing
import XCTest

class ExpectTests: XCTestCase {
  func testExpectUpstreamParses() {
    var input = """
      // let foo = true
      let bar = false
      """[...]

    let commentedLine = Parse {
      Expect { "//" }
      Prefix { $0 != "\n" }
      OneOf {
        "\n"
        End()
      }
    }

    XCTAssertNoDifference(try commentedLine.parse(&input), "// let foo = true")
    XCTAssertNoDifference(input, "let bar = false")
  }

  func testExpectUpstreamFails() {
    var input = """
      let foo = true
      let bar = false
      """[...]

    let commentedLine = Parse {
      Expect { "//" }
      Prefix { $0 != "\n" }
    }

    XCTAssertThrowsError(try commentedLine.parse(&input))
    XCTAssertNoDifference(
      input,
      """
      let foo = true
      let bar = false
      """
    )
  }
  
  func testPrintUpstreamParses() {
    var input = "// a comment"[...]
    let parser = Expect { "//" }
    XCTAssertNoThrow(try parser.print((), to: &input))
    XCTAssertNoDifference(input, "// a comment"[...])
  }
  
  func testPrintUpstreamFails() {
    var input = "not a comment"[...]
    let parser = Expect { "//" }
    XCTAssertThrowsError(try parser.print((), to: &input))
    XCTAssertNoDifference(input, "not a comment"[...])
  }
  
  func testPrintComplexParserSucceeds() {
    var input = ""[...]

    let commentedLine = Parse {
      Expect { "//" }
      Rest()
    }
    
    XCTAssertNoThrow(try commentedLine.print("// commented line"[...], to: &input))
    XCTAssertNoDifference(
      input,
      "// commented line"
    )
  }
  
  func testPrintComplexParserFails() {
    var input = ""[...]

    let commentedLine = Parse {
      Expect { "//" }
      Rest()
    }

    XCTAssertThrowsError(try commentedLine.print("uncommented line"[...], to: &input))
    XCTAssertNoDifference(
      input,
      "uncommented line"
    )
  }
}
