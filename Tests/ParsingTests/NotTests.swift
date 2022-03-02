import CustomDump
import Parsing
import XCTest

class NotTests: XCTestCase {
  func testNotUpstreamFails() {
    var input = """
      let foo = true
      let bar = false
      """[...]

    let uncommentedLine = Parse {
      Not { "//" }
      Prefix { $0 != "\n" }
      OneOf {
        "\n"
        End()
      }
    }

    XCTAssertNoDifference(try uncommentedLine.parse(&input), "let foo = true")
    XCTAssertNoDifference(input, "let bar = false")
  }

  func testNotUpstreamParses() {
    var input = """
      // a comment
      let foo = true
      """[...]

    let uncommentedLine = Parse {
      Not { "//" }
      Prefix { $0 != "\n" }
    }

    XCTAssertThrowsError(try uncommentedLine.parse(&input))
    XCTAssertNoDifference(
      input,
      """
       a comment
      let foo = true
      """
    )
  }
  
  func testPrintUpstreamFails() {
    var input = "not a comment"[...]
    let parser = Not { "//" }
    XCTAssertNoThrow(try parser.print((), to: &input))
    XCTAssertNoDifference(input, "not a comment"[...])
  }
  
  func testPrintUpstreamParses() {
    var input = "// a comment"[...]
    let parser = Not { "//" }
    XCTAssertThrowsError(try parser.print((), to: &input))
    XCTAssertNoDifference(input, "// a comment"[...])
  }
  
  func testPrintComplexParserSucceeds() {
    var input = ""[...]

    let uncommentedLine = Parse {
      Not { "//" }
      Rest()
    }
    
    XCTAssertNoThrow(try uncommentedLine.print("uncommented line"[...], to: &input))
    XCTAssertNoDifference(
      input,
      "uncommented line"
    )
  }
  
  func testPrintComplexParserFails() {
    var input = ""[...]

    let uncommentedLine = Parse {
      Not { "//" }
      Rest()
    }

    XCTAssertThrowsError(try uncommentedLine.print("// commented line"[...], to: &input))
    XCTAssertNoDifference(
      input,
      "// commented line"
    )
  }
}
