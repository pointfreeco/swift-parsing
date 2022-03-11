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

  func testPrintRestFailsOnEmpty() throws {
    XCTAssertThrowsError(try Rest().print(""))
  }
}
