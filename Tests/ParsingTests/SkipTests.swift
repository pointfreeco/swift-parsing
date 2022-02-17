import CustomDump
import Parsing
import XCTest

final class SkipTests: XCTestCase {
  func testSkipSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssert(try () == XCTUnwrap(Skip { Int.parser() }.parse(&input)))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }

  func testSkipFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertThrowsError(try Skip { Int.parser() }.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello, world!
          | ^ expected integer
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }
}
