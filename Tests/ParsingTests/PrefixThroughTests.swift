import Parsing
import XCTest

final class PrefixThroughTests: XCTestCase {
  func testSuccess() {
    var input = "Hello,world, 42!"[...]
    XCTAssertEqual("Hello,world, ", try PrefixThrough(", ").parse(&input))
    XCTAssertEqual("42!", input)
  }

  func testSuccessIsEmpty() {
    var input = "Hello, world!"[...]
    XCTAssertEqual("", try PrefixThrough("").parse(&input))
    XCTAssertEqual("Hello, world!", input)
  }

  func testFailureIsEmpty() {
    var input = ""[...]
    XCTAssertThrowsError(try PrefixThrough(", ").parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 |
          | ^ expected prefix through ", "
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("", input)
  }

  func testFailureNoMatch() {
    var input = "Hello world!"[...]
    XCTAssertThrowsError(try PrefixThrough(", ").parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello world!
          | ^ expected prefix through ", "
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("Hello world!", input)
  }

  func testUTF8() {
    var input = "Hello,world, 42!"[...].utf8
    XCTAssertEqual("Hello,world, ", Substring(try PrefixThrough(", ".utf8).parse(&input)))
    XCTAssertEqual("42!", Substring(input))
  }
}
