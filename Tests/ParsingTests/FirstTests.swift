@testable import Parsing
import XCTest

final class FirstTests: XCTestCase {
  func testSuccess() {
    var input = "Hello, world!"[...]
    XCTAssertEqual("H", try First().parse(&input))
    XCTAssertEqual("ello, world!", input)
  }

  func testFailure() {
    var input = ""[...]
    XCTAssertThrowsError(try First().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 |
          | ^ expected element
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("", input)
  }
}
