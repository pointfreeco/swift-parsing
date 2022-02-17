import CustomDump
import Parsing
import XCTest

final class NewlineTests: XCTestCase {
  func testSuccess() {
    var input = "\n\r\n\n\rHello, world!"[...].utf8
    XCTAssertNoThrow(try Newline().parse(&input))
    XCTAssertNoDifference("\r\n\n\rHello, world!", Substring(input))
    XCTAssertNoThrow(try Newline().parse(&input))
    XCTAssertNoDifference("\n\rHello, world!", Substring(input))
    XCTAssertNoThrow(try Newline().parse(&input))
    XCTAssertNoDifference("\rHello, world!", Substring(input))
    XCTAssertThrowsError(try Newline().parse(&input)) { error in
      XCTAssertNoDifference(
        #"""
        error: unexpected input
         --> input:4:1
        4 |
          | ^ expected "\n" or "\r\n"
        """#,
        "\(error)"
      )
    }
    XCTAssertNoDifference("\rHello, world!", Substring(input))
  }
}
