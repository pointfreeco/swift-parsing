import CustomDump
import Parsing
import XCTest

final class FirstTests: XCTestCase {
  func testSuccess() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference("H", try First().parse(&input))
    XCTAssertNoDifference("ello, world!", input)
  }

  func testFailure() {
    var input = ""[...]
    XCTAssertThrowsError(try First().parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 |
          | ^ expected element
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("", input)
  }
}
