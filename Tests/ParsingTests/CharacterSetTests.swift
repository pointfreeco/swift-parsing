import Parsing
import XCTest

final class CharacterSetTests: XCTestCase {
  func testDecimalDigits() {
    let characterSet = CharacterSet.decimalDigits

    var input = "42abc"[...]

    let output = characterSet.parse(&input)
    XCTAssertEqual(output, "42")
    XCTAssertEqual(input, "abc")
  }

  func testAlphanumerics() {
    let characterSet = CharacterSet.alphanumerics

    var input = "42abc;."[...]

    let output = characterSet.parse(&input)
    XCTAssertEqual(output, "42abc")
    XCTAssertEqual(input, ";.")
  }

  func testCustom() {
    let characterSet = CharacterSet(charactersIn: "0123")

    var input = "23456789abcdef"[...]

    let output = characterSet.parse(&input)
    XCTAssertEqual(output, "23")
    XCTAssertEqual(input, "456789abcdef")
  }

  func testCompletion() throws {
    let characterSet = CharacterSet(charactersIn: "123")

    var input = "123456"[...]

    let firstOutput = try XCTUnwrap(characterSet.parse(&input))
    let secondOutput = try XCTUnwrap(characterSet.parse(&input))

    XCTAssertEqual(firstOutput, "123")
    XCTAssertTrue(secondOutput.isEmpty)
  }
}
