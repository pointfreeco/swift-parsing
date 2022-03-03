import Parsing
import XCTest

final class EndTests: XCTestCase {
  func testSuccess() {
    var input = ""[...]
    XCTAssertNoThrow(try End().parse(&input))
    XCTAssertEqual("", input)
  }

  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertThrowsError(try End().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello, world!
          | ^ expected end of input
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("Hello, world!", input)
  }

  func testTrailingWhitespace() {
    XCTAssertThrowsError(try Int.parser().parse("123   ")) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:4
        1 | 123␣␣␣
          |    ^ expected end of input
        """,
        "\(error)"
      )
    }
  }
}
