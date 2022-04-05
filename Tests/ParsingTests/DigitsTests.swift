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

    XCTAssertEqual("0", try Digits().print(0))
  }

  func testZeroMinimum() {
    struct Rational: Equatable { var numerator, denominator: Int }

    let rational = Parse(.memberwise(Rational.init)) {
      Digits(0...)
      "."
      Digits(1...)
    }

    XCTAssertEqual(
      try rational.parse(".123"),
      .init(numerator: 0, denominator: 123)
    )
    XCTAssertEqual(
      try rational.print(.init(numerator: 0, denominator: 123)),
      ".123"
    )
  }
}
