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

    XCTAssertEqual(try uncommentedLine.parse(&input), "let foo = true")
    XCTAssertEqual(input, "let bar = false")
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

    XCTAssertThrowsError(try uncommentedLine.parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1-2
        1 | // a comment
          | ^^ expected not to be processed
        """,
        "\(error)"
      )
    }
    XCTAssertEqual(
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
    XCTAssertNoThrow(try parser.print((), into: &input))
    XCTAssertEqual(input, "not a comment"[...])
  }

  func testPrintUpstreamParses() {
    var input = "// a comment"[...]
    let parser = Not { "//" }
    XCTAssertThrowsError(try parser.print((), into: &input))
    XCTAssertEqual(input, " a comment"[...])
  }

  func testPrintComplexParserSucceeds() {
    var input = ""[...]

    let uncommentedLine = Parse {
      Not { "//" }
      Rest()
    }

    XCTAssertNoThrow(try uncommentedLine.print("uncommented line"[...], into: &input))
    XCTAssertEqual(
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

    XCTAssertThrowsError(try uncommentedLine.print("// commented line"[...], into: &input))
    XCTAssertEqual(
      input,
      " commented line"
    )
  }
}
