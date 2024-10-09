import Parsing
import XCTest

@available(*, deprecated)
final class FromSubstringTests: XCTestCase {
  func testUTF8View() {
    let p = Parse(input: Substring.UTF8View.self) {
      "caf".utf8
      From(.substring) { "é" }
    }

    var input = "caf\u{00E9}"[...].utf8
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)

    input = "cafe\u{0301}"[...].utf8
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)
  }

  func testUnicodeScalarView() {
    let p = Parse {
      "caf".unicodeScalars
      From(.substring) { "é" }
    }

    var input = "caf\u{00E9}"[...].unicodeScalars
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)

    input = "cafe\u{0301}"[...].unicodeScalars
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)
  }

  func testDeprecatedUTF8View() {
    let p = Parse(input: Substring.UTF8View.self) {
      "caf".utf8
      FromSubstring { "é" }
    }

    var input = "caf\u{00E9}"[...].utf8
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)

    input = "cafe\u{0301}"[...].utf8
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)
  }

  func testDeprecatedUnicodeScalarView() {
    let p = Parse {
      "caf".unicodeScalars
      FromSubstring { "é" }
    }

    var input = "caf\u{00E9}"[...].unicodeScalars
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)

    input = "cafe\u{0301}"[...].unicodeScalars
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)
  }
}
