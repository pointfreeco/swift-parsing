import CustomDump
import Parsing
import XCTest

final class CompactMapTests: XCTestCase {
  func testSuccess() {
    var input = "FF0000"[...]
    XCTAssertNoDifference(
      0xFF,
      try Prefix(2).compactMap { Int(String($0), radix: 16) }.parse(&input)
    )
    XCTAssertNoDifference("0000", Substring(input))
  }

  func testFailure() {
    var input = "GG0000"[...]
    XCTAssertThrowsError(
      try Prefix(2).compactMap { Int(String($0), radix: 16) }.parse(&input)
    ) { error in
      XCTAssertNoDifference(
        """
        error: failed to process "Int" from "GG"
         --> input:1:1-2
        1 | GG0000
          | ^^
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("0000", Substring(input))
  }

  func testOverloadArray() {
    let array = [1].compactMap { "\($0)" }
    XCTAssert(type(of: array) == Array<String>.self)
  }

  func testOverloadString() {
    let array = "abc".compactMap { "\($0)" }
    XCTAssert(type(of: array) == Array<String>.self)
  }

  func testOverloadUnicodeScalars() {
    let array = "abc".unicodeScalars.compactMap { "\($0)" }
    XCTAssert(type(of: array) == Array<String>.self)
  }

  func testOverloadUTF8View() {
    let array = "abc".utf8.compactMap { "\($0)" }
    XCTAssert(type(of: array) == Array<String>.self)
  }
}
