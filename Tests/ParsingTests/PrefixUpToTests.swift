import CustomDump
import Parsing
import XCTest

final class PrefixUpToTests: XCTestCase {
  func testSuccess() {
    var input = "Hello,world, 42!"[...]
    XCTAssertNoDifference("Hello,world", try PrefixUpTo(", ").parse(&input))
    XCTAssertNoDifference(", 42!", input)
  }

  func testSuccessIsEmpty() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference("", try PrefixUpTo("").parse(&input))
    XCTAssertNoDifference("Hello, world!", input)
  }

  func testFailureIsEmpty() {
    var input = ""[...]
    XCTAssertThrowsError(try PrefixUpTo(", ").parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 |
          | ^ expected prefix up to ", "
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("", input)
  }

  func testFailureNoMatch() {
    var input = "Hello world!"[...]
    XCTAssertThrowsError(try PrefixUpTo(", ").parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello world!
          | ^ expected prefix up to ", "
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("Hello world!", input)
  }

  func testUTF8() {
    var input = "Hello,world, 42!"[...].utf8
    XCTAssertNoDifference("Hello,world", Substring(try PrefixUpTo(", ".utf8).parse(&input)))
    XCTAssertNoDifference(", 42!", Substring(input))
  }

  func testPrint() throws {
    var input = ","[...]
    try PrefixUpTo(",").print("Hello", to: &input)
    XCTAssertNoDifference("Hello,", input)
  }
}
