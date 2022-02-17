import CustomDump
import Parsing
import XCTest

final class EndTests: XCTestCase {
  func testSuccess() {
    var input = ""[...]
    XCTAssertNoThrow(try End().parse(&input))
    XCTAssertNoDifference("", input)
  }

  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertThrowsError(try End().parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello, world!
          | ^ expected end of input
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("Hello, world!", input)
  }
}
