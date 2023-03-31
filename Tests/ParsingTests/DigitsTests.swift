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
    XCTAssertEqual("00", try Digits(2).print(0))
    XCTAssertEqual("01", try Digits(2).print(1))

    XCTAssertThrowsError(try Digits(2).print(255) as Substring) { error in
      XCTAssertEqual(
        """
        error: round-trip expectation failed

        A "Digits" parser configured to parse at most 2 digits tried to print 255 (3 digits).
        """,
        "\(error)"
      )
    }
  }

  func testZeroMinimum() {
    struct Rational: Equatable { var numerator, denominator: Int }

    struct RationalParser: ParserPrinter {
      var body: some ParserPrinter<Substring, Rational> {
        Parse(.memberwise(Rational.init)) {
          Digits(0...)
          "."
          Digits(1...)
        }
      }
    }

    XCTAssertEqual(
      try RationalParser().parse(".123"),
      .init(numerator: 0, denominator: 123)
    )
    XCTAssertEqual(
      try RationalParser().print(Rational(numerator: 0, denominator: 123)),
      ".123"
    )
  }
}
