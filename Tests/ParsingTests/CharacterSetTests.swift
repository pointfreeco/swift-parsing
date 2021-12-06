import Parsing
import XCTest

final class CharacterSetTests: XCTestCase {
  func testTruncatedMaximum() {
    var input = "abc123!"[...]
    let output = CharacterSet.alphanumerics
      .minimum(3)
      .maximum(5)
      .parse(&input)

    XCTAssertEqual(input, "3!")
    XCTAssertEqual(output, "abc12")
  }

  func testMinimum() {
    var input = "abc123!"[...]
    let output = CharacterSet.alphanumerics
      .minimum(3)
      .parse(&input)

    XCTAssertEqual(input, "!")
    XCTAssertEqual(output, "abc123")
  }
}
