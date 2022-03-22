import Parsing
import XCTest

final class DigitsTests: XCTestCase {
  func testDigits() throws {
    var input = "201801"[...].utf8
    XCTAssertEqual(2018, try Digits(4).parse(&input))
    XCTAssertEqual("01", String(input))

    XCTAssertThrowsError(try Digits(4).parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:5
        1 | 201801
          |     ^ expected 4 digits
        """,
        "\(error)"
      )
    }

    XCTAssertThrowsError(try Digits(4...).parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:5
        1 | 201801
          |     ^ expected at least 4 digits
        """,
        "\(error)"
      )
    }
  }
}
