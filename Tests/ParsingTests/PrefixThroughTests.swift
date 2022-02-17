import CustomDump
import Parsing
import XCTest

final class PrefixThroughTests: XCTestCase {
  func testSuccess() {
    var input = "Hello,world, 42!"[...]
    XCTAssertNoDifference("Hello,world, ", try PrefixThrough(", ").parse(&input))
    XCTAssertNoDifference("42!", input)
  }

  func testSuccessIsEmpty() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference("", try PrefixThrough("").parse(&input))
    XCTAssertNoDifference("Hello, world!", input)
  }

  func testFailureIsEmpty() {
    var input = ""[...]
    XCTAssertThrowsError(try PrefixThrough(", ").parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 |
          | ^ expected prefix through ", "
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("", input)
  }

  func testFailureNoMatch() {
    var input = "Hello world!"[...]
    XCTAssertThrowsError(try PrefixThrough(", ").parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello world!
          | ^ expected prefix through ", "
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("Hello world!", input)
  }

  func testUTF8() {
    var input = "Hello,world, 42!"[...].utf8
    XCTAssertNoDifference("Hello,world, ", Substring(try PrefixThrough(", ".utf8).parse(&input)))
    XCTAssertNoDifference("42!", Substring(input))
  }
}
