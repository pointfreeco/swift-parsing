import CustomDump
import Parsing
import XCTest

final class RestTests: XCTestCase {
  func testParseRest() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference("Hello, world!", try Rest().parse(&input))
    XCTAssertNoDifference("", input)
  }

  func testParseRestFailsOnEmpty() {
    var input = ""[...]
    XCTAssertThrowsError(try Rest().parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 |
          | ^ expected a non-empty input
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("", input)
  }

  func testPrintRest() {
    XCTAssertNoDifference(try Rest().print("Hello"), "Hello")
  }

  func testPrintRestFailsOnEmpty() throws {
    XCTAssertThrowsError(try Rest().print(""))
  }
}
