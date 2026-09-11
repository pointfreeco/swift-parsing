import Parsing
import XCTest

final class FromUnicodeScalarViewTests: XCTestCase {
  func testSubstring() {
    let p = Parse(input: Substring.self) {
      "caf"
      From(.unicodeScalars) {
        "\u{00E9}".unicodeScalars
      }
    }

    var input = "caf\u{00E9}"[...]
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)

    XCTAssertThrowsError(try p.parse("cafe\u{0301}"))
  }

  func testUTF8View() {
    let p = Parse(input: Substring.UTF8View.self) {
      "caf".utf8
      From(.unicodeScalars) {
        "\u{00E9}".unicodeScalars
      }
    }

    var input = "caf\u{00E9}"[...].utf8
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)

    XCTAssertThrowsError(try p.parse("cafe\u{0301}".utf8))
  }

  func testBytes() {
    let p = Parse(input: ArraySlice<UInt8>.self) {
      Array("caf".utf8)
      From(.unicodeScalars) {
        "\u{00E9}".unicodeScalars
      }
    }

    var input = Array("caf\u{00E9}".utf8)[...]
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)

    XCTAssertThrowsError(try p.parse(Array("cafe\u{0301}".utf8)))
  }

  func testDeprecatedSubstring() {
    let p = Parse(input: Substring.self) {
      "caf"
      FromUnicodeScalarView {
        "\u{00E9}".unicodeScalars
      }
    }

    var input = "caf\u{00E9}"[...]
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)

    XCTAssertThrowsError(try p.parse("cafe\u{0301}"))
  }

  func testDeprecatedUTF8View() {
    let p = Parse(input: Substring.UTF8View.self) {
      "caf".utf8
      FromUnicodeScalarView {
        "\u{00E9}".unicodeScalars
      }
    }

    var input = "caf\u{00E9}"[...].utf8
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)

    XCTAssertThrowsError(try p.parse("cafe\u{0301}".utf8))
  }

  func testDeprecatedBytes() {
    let p = Parse(input: ArraySlice<UInt8>.self) {
      Array("caf".utf8)
      FromUnicodeScalarView {
        "\u{00E9}".unicodeScalars
      }
    }

    var input = Array("caf\u{00E9}".utf8)[...]
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)

    XCTAssertThrowsError(try p.parse(Array("cafe\u{0301}".utf8)))
  }
}
