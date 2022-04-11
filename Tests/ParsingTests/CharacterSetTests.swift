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

  func testPrintUpstreamInputFailure() {
    let p = ParsePrint {
      CharacterSet(charactersIn: "\n").inverted
      First()
    }
    XCTAssertThrowsError(try p.print(("Hello", " ")))
  }

  func testPrintSuccess() {
    var input = " WORLD"[...]
    XCTAssertNoThrow(try CharacterSet.uppercaseLetters.print("HELLO", into: &input))
    XCTAssertEqual("HELLO WORLD", input)
  }

  func testPrintFailureInOutput() {
    XCTAssertThrowsError(try CharacterSet.uppercaseLetters.print("Hello")) { error in
      XCTAssertEqual(
        """
        error: round-trip expectation failed

        A character set does not contain a character to be printed.

        "Hello"
          ^ not found in set

        <CFCharacterSet Predefined UppercaseLetter Set>

        During a round-trip, the character set would have failed to parse this character, which \
        means its data is in an invalid state.
        """,
        "\(error)"
      )
    }
  }

  func testPrintFailureInInput() {
    var input = "WORLD"[...]
    XCTAssertThrowsError(try CharacterSet.uppercaseLetters.print("HELLO", into: &input)) { error in
      XCTAssertEqual(
        """
        error: round-trip expectation failed

        A character set contains a character that is printed by the next printer.

        "WORLD"
         ^ found in set

        <CFCharacterSet Predefined UppercaseLetter Set>

        During a round-trip, the character set would have parsed this character, which means the \
        data handed to the next printer is in an invalid state.
        """,
        "\(error)"
      )
    }
  }
}
