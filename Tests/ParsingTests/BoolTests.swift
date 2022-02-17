import CustomDump
import Parsing
import XCTest

final class BoolTests: XCTestCase {
  func testParsesTrue() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertNoDifference(true, try Bool.parser().parse(&input))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }

  func testParsesFalse() {
    var input = "false Hello, world!"[...].utf8
    XCTAssertNoDifference(false, try Bool.parser().parse(&input))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }

  func testParseFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertThrowsError(try Bool.parser().parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello, world!
          | ^ expected "true" or "false"
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }
}
