import Parsing
import XCTest

final class RestTests: XCTestCase {
  func testParseRest() {
    var input = "Hello, world!"[...]
    XCTAssertEqual("Hello, world!", try Rest().parse(&input))
    XCTAssertEqual("", input)
  }

  func testParseRestFailsOnEmpty() {
    var input = ""[...]
    XCTAssertThrowsError(try Rest().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 |
          | ^ expected a non-empty input
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("", input)
  }

  func testPrintRest() {
    XCTAssertEqual(try Rest().print("Hello"), "Hello")
  }

  func testPrintRestFailsOnUpcoming() throws {
    var input = ", World!"[...]
    XCTAssertThrowsError(try Rest().print("Hello", into: &input)) { error in
      XCTAssertEqual(
        """
        error: round-trip expectation failed

        A "Rest" parser-printer expected to have printed all remaining input, but more was printed.

        ", World!"

        During a round-trip, the "Rest" parser-printer would have parsed this remaining input.
        """,
        "\(error)"
      )
    }
  }

  func testPrintRestFailsOnEmpty() throws {
    XCTAssertThrowsError(try Rest().print("")) { error in
      XCTAssertEqual(
        """
        error: round-trip expectation failed

        A "Rest" parser-printer attempted to print an empty Substring.

        During a round-trip, the "Rest" parser-printer would have failed to parse an empty input.
        """,
        "\(error)"
      )
    }
  }
}
