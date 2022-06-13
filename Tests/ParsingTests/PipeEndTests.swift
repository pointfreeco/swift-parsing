@testable import Parsing
import XCTest

final class PipeEndTests: XCTestCase {
  func testSuccess() {
    var input = ""[...]
      XCTAssertNoThrow(try Parsers.PipeEnd().parse(&input))
    XCTAssertEqual("", input)
  }

  func testFailure() {
    var input = "Hello, world!"[...]
      XCTAssertThrowsError(try Parsers.PipeEnd().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1-13
        1 | Hello, world!
          | ^^^^^^^^^^^^^ expected end of pipe
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("Hello, world!", input)
  }

  func testPrintSuccess() {
    var input = ""[...]
      XCTAssertNoThrow(try Parsers.PipeEnd().print(into: &input))
    XCTAssertEqual(input, ""[...])
  }

  func testPrintFailure() {
    var input = "Hello, world!"[...]
      XCTAssertThrowsError(try Parsers.PipeEnd().print(into: &input)) { error in
      XCTAssertEqual(
        """
        error: round-trip expectation failed

        A "PipeEnd" parser-printer expected no more input, but more was printed.

        "Hello, world!"

        During a round-trip, the "PipeEnd" parser-printer would have failed to parse at this \
        remaining input.
        """,
        "\(error)"
      )
    }
    XCTAssertEqual(input, "Hello, world!"[...])
  }
}
