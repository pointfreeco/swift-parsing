import Parsing
import XCTest

final class UTF8Tests: XCTestCase {
  func testSubstringNormalization() {
    var input = "\u{00E9}e\u{0301}e\u{0341} Hello, world"[...].utf8
    let parser = FromSubstring<Substring.UTF8View, String> { "é" }
    XCTAssertNoThrow(try parser.parse(&input))
    XCTAssertEqual("e\u{0301}e\u{0341} Hello, world", Substring(input))
    XCTAssertNoThrow(try parser.parse(&input))
    XCTAssertEqual("e\u{0341} Hello, world", Substring(input))
    XCTAssertNoThrow(try parser.parse(&input))
    XCTAssertEqual(" Hello, world", Substring(input))
    XCTAssertThrowsError(try parser.parse(&input))
    XCTAssertEqual(" Hello, world", Substring(input))
  }

  func testUnicodeScalars() {
    var input = "🇺🇸 Hello, world"[...].unicodeScalars
    let parser = StartsWith<Substring.UnicodeScalarView>("🇺".unicodeScalars)
    XCTAssertNoThrow(try parser.parse(&input))
    XCTAssertEqual("🇸 Hello, world", Substring(input))
    XCTAssertThrowsError(try parser.parse(&input))
    XCTAssertEqual("🇸 Hello, world", Substring(input))
  }

  func testUTF8() {
    var input = "🇺🇸 Hello, world"[...].utf8
    let parser = StartsWith<Substring.UTF8View>("🇺".utf8)
    XCTAssertNoThrow(try parser.parse(&input))
    XCTAssertEqual("🇸 Hello, world", Substring(input))
    XCTAssertThrowsError(try parser.parse(&input))
    XCTAssertEqual("🇸 Hello, world", Substring(input))
  }
}
