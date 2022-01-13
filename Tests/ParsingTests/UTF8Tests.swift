import CustomDump
import Parsing
import XCTest

final class UTF8Tests: XCTestCase {
  func testSubstringNormalization() {
    var input = "\u{00E9}e\u{0301}e\u{0341} Hello, world"[...].utf8
    let parser = StartsWith<Substring>("é").utf8
    XCTAssertNotNil(parser.parse(&input))
    XCTAssertNoDifference("e\u{0301}e\u{0341} Hello, world", Substring(input))
    XCTAssertNotNil(parser.parse(&input))
    XCTAssertNoDifference("e\u{0341} Hello, world", Substring(input))
    XCTAssertNotNil(parser.parse(&input))
    XCTAssertNoDifference(" Hello, world", Substring(input))
    XCTAssertNil(parser.parse(&input))
    XCTAssertNoDifference(" Hello, world", Substring(input))
  }

  func testUnicodeScalars() {
    var input = "🇺🇸 Hello, world"[...].utf8
    let parser = StartsWith<Substring.UnicodeScalarView>("🇺".unicodeScalars).utf8
    XCTAssertNotNil(parser.parse(&input))
    XCTAssertNoDifference("🇸 Hello, world", Substring(input))
    XCTAssertNil(parser.parse(&input))
    XCTAssertNoDifference("🇸 Hello, world", Substring(input))
  }
}
