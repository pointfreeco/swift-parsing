import Parsing
import XCTest

final class EndTests: XCTestCase {
  func testSuccess() {
    var input = ""[...]
    XCTAssertNoThrow(try End().parse(&input))
    XCTAssertEqual("", input)
  }

  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertThrowsError(try End().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello, world!
          | ^ expected end of input
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("Hello, world!", input)
  }

  func testPrintSuccess() {
    var input = ""[...]
    XCTAssertNoThrow(try End().print(into: &input))
    XCTAssertEqual(input, ""[...])
  }

  func testPrintFailure() {
    var input = "Hello, world!"[...]
    XCTAssertThrowsError(try End().print(into: &input)) { error in
      XCTAssertEqual(
        """
        error: round-trip expectation failed

        An "End" parser-printer expected no more input, but more was printed.

        "Hello, world!"

        During a round-trip, the "End" parser-printer would have failed to parse at this \
        remaining input.
        """,
        "\(error)"
      )
    }
    XCTAssertEqual(input, "Hello, world!"[...])
  }

  func testTrailingWhitespace() {
    XCTAssertThrowsError(try Int.parser().parse("123   ")) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:4
        1 | 123␣␣␣
          |    ^ expected end of input
        """,
        "\(error)"
      )
    }
  }

  //  func testFoo() throws {
  //    let quotedField = Parse {
  //      "\""
  //      Prefix { $0 != "\"" }
  //      "\""
  //    }
  //    let field = OneOf {
  //      quotedField
  //      Prefix { $0 != "," }
  //    }
  //      .map(String.init)
  //
  //    try field.print("Blob, Esq.")
  //  }
}
