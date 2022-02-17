import CustomDump
import Parsing
import XCTest

final class UTF8Tests: XCTestCase {
  func testSubstringNormalization() {
    var input = "\u{00E9}e\u{0301}e\u{0341} Hello, world"[...].utf8
    let parser = From<Conversions.UTF8ViewToSubstring, String>(.substring) { "é" }
    XCTAssertNoThrow(try parser.parse(&input))
    XCTAssertNoDifference("e\u{0301}e\u{0341} Hello, world", Substring(input))
    XCTAssertNoThrow(try parser.parse(&input))
    XCTAssertNoDifference("e\u{0341} Hello, world", Substring(input))
    XCTAssertNoThrow(try parser.parse(&input))
    XCTAssertNoDifference(" Hello, world", Substring(input))
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:4
        1 | ééé Hello, world
          |    ^ expected "é"
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference(" Hello, world", Substring(input))
  }

  func testUnicodeScalars() {
    var input = "🇺🇸 Hello, world"[...].unicodeScalars
    let parser = "🇺".unicodeScalars
    XCTAssertNoThrow(try parser.parse(&input))
    XCTAssertNoDifference("🇸 Hello, world", Substring(input))
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | 🇺🇸 Hello, world
          | ^ expected "🇺"
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("🇸 Hello, world", Substring(input))
  }
}
