import Parsing
import XCTest

final class NewlineTests: XCTestCase {
  func testSuccess() {
    var input = "\n\r\n\n\rHello, world!"[...].utf8
    XCTAssertNoThrow(try Newline().parse(&input))
    XCTAssertEqual("\r\n\n\rHello, world!", Substring(input))
    XCTAssertNoThrow(try Newline().parse(&input))
    XCTAssertEqual("\n\rHello, world!", Substring(input))
    XCTAssertNoThrow(try Newline().parse(&input))
    XCTAssertEqual("\rHello, world!", Substring(input))
    XCTAssertThrowsError(try Newline().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:4:1
        4 |
          | ^ expected newline
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("\rHello, world!", Substring(input))
  }
}
