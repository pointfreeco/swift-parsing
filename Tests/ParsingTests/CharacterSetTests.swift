import CustomDump
import Parsing
import XCTest

final class CharacterSetTests: XCTestCase {
  func testDecimalDigits() {
    let characterSet = CharacterSet.decimalDigits

    var input = "42abc"[...]

    let output = characterSet.parse(&input)
    XCTAssertNoDifference(output, "42")
    XCTAssertNoDifference(input, "abc")
  }

  func testAlphanumerics() {
    let characterSet = CharacterSet.alphanumerics

    var input = "42abc;."[...]

    let output = characterSet.parse(&input)
    XCTAssertNoDifference(output, "42abc")
    XCTAssertNoDifference(input, ";.")
  }

  func testCustom() {
    let characterSet = CharacterSet(charactersIn: "0123")

    var input = "23456789abcdef"[...]

    let output = characterSet.parse(&input)
    XCTAssertNoDifference(output, "23")
    XCTAssertNoDifference(input, "456789abcdef")
  }

  func testCompletion() throws {
    let characterSet = CharacterSet(charactersIn: "123")

    var input = "123456"[...]

    let firstOutput = try XCTUnwrap(characterSet.parse(&input))
    let secondOutput = try XCTUnwrap(characterSet.parse(&input))

    XCTAssertNoDifference(firstOutput, "123")
    XCTAssertTrue(secondOutput.isEmpty)
  }
}
