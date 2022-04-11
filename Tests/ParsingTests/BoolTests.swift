import Parsing
import XCTest

final class BoolTests: XCTestCase {
  func testParsesTrue() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertEqual(true, try Bool.parser().parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testParsesFalse() {
    var input = "false Hello, world!"[...].utf8
    XCTAssertEqual(false, try Bool.parser().parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testParseFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertThrowsError(try Bool.parser().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello, world!
          | ^ expected "true" or "false"
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("Hello, world!", Substring(input))
  }

  func testPrintsTrue() {
    var input = "!"[...]
    XCTAssertNoThrow(try Bool.parser().print(true, into: &input))
    XCTAssertEqual(input, "true!"[...])
  }

  func testPrintsFalse() {
    var input = "!"[...]
    XCTAssertNoThrow(try Bool.parser().print(false, into: &input))
    XCTAssertEqual(input, "false!"[...])
  }
}
