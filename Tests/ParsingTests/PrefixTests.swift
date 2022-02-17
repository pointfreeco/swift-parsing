import CustomDump
import Parsing
import XCTest

final class PrefixTests: XCTestCase {
  func testPrefixSuccess() {
    var input = "42 Hi!"[...]
    XCTAssertNoDifference("42", try Prefix(2).parse(&input))
    XCTAssertNoDifference(" Hi!", input)
  }

  func testPrefixUnder() {
    var input = "42 Hi!"[...]
    XCTAssertThrowsError(try Prefix(8).parse(&input))
    XCTAssertNoDifference("", input)
  }

  func testPrefixOver() {
    var input = "42 Hi!"[...]
    XCTAssertThrowsError(try Prefix(10).parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:7
        1 | 42 Hi!
          |       ^ expected 4 more elements
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("", input)
  }

  func testPrefixWhile() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("42", try Prefix(while: { $0.isNumber }).parse(&input))
    XCTAssertNoDifference(" Hello, world!", input)
  }

  func testPrefixWhileAlwaysSucceeds() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference("", try Prefix(while: { $0.isNumber }).parse(&input))
    XCTAssertNoDifference("Hello, world!", input)
  }

  func testPrefixRangeFromSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("42 Hello, world!", try Prefix(1...).parse(&input))
    XCTAssertNoDifference("", input)
  }

  func testPrefixRangeFromFailure() {
    var input = "42 Hello, world!"[...]
    XCTAssertThrowsError(try Prefix(100...) { _ in true }.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:17
        1 | 42 Hello, world!
          |                 ^ expected 84 more elements satisfying predicate
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("", input)
  }

  func testPrefixRangeFromWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("42", try Prefix(1..., while: { $0.isNumber }).parse(&input))
    XCTAssertNoDifference(" Hello, world!", input)
  }

  func testPrefixRangeThroughSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("42 Hello, ", try Prefix(...10).parse(&input))
    XCTAssertNoDifference("world!", input)
  }

  func testPrefixRangeThroughWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("42", try Prefix(...10, while: { $0.isNumber }).parse(&input))
    XCTAssertNoDifference(" Hello, world!", input)
  }

  func testPrefixLengthFromWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("4", try Prefix(1, while: { $0.isNumber }).parse(&input))
    XCTAssertNoDifference("2 Hello, world!", input)
  }
}
