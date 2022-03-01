import CustomDump
import Parsing
import XCTest

final class RestTests: XCTestCase {
  func testRest() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference("Hello, world!", try Rest().parse(&input))
    XCTAssertNoDifference("", input)
  }

  func testRestAlwaysSucceeds() {
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
}
