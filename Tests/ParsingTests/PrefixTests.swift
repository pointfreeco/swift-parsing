import Parsing
import XCTest

final class PrefixTests: XCTestCase {
  func testPrefixSuccess() {
    var input = "42 Hi!"[...]
    XCTAssertEqual("42", try Prefix(2).parse(&input))
    XCTAssertEqual(" Hi!", input)
  }

  func testPrefixUnder() {
    var input = "42 Hi!"[...]
    XCTAssertThrowsError(try Prefix(8).parse(&input))
    XCTAssertEqual("42 Hi!", input)
  }

  func testPrefixOver() {
    var input = "42 Hi!"[...]
    XCTAssertThrowsError(try Prefix(10).parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:7
        1 | 42 Hi!
          |       ^ expected 4 more elements
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("42 Hi!", input)
  }

  func testPrefixWhile() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("42", try Prefix(while: { $0.isNumber }).parse(&input))
    XCTAssertEqual(" Hello, world!", input)
  }

  func testPrefixWhileAlwaysSucceeds() {
    var input = "Hello, world!"[...]
    XCTAssertEqual("", try Prefix(while: { $0.isNumber }).parse(&input))
    XCTAssertEqual("Hello, world!", input)
  }

  func testPrefixRangeFromSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("42 Hello, world!", try Prefix(1...).parse(&input))
    XCTAssertEqual("", input)
  }

  func testPrefixRangeFromFailure() {
    var input = "42 Hello, world!"[...]
    XCTAssertThrowsError(try Prefix(100...) { _ in true }.parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:17
        1 | 42 Hello, world!
          |                 ^ expected 84 more elements satisfying predicate
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("42 Hello, world!", input)
  }

  func testPrefixRangeFromWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("42", try Prefix(1..., while: { $0.isNumber }).parse(&input))
    XCTAssertEqual(" Hello, world!", input)
  }

  func testPrefixRangeThroughSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("42 Hello, ", try Prefix(...10).parse(&input))
    XCTAssertEqual("world!", input)
  }

  func testPrefixRangeThroughWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("42", try Prefix(...10, while: { $0.isNumber }).parse(&input))
    XCTAssertEqual(" Hello, world!", input)
  }

  func testPrefixLengthFromWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("4", try Prefix(1, while: { $0.isNumber }).parse(&input))
    XCTAssertEqual("2 Hello, world!", input)
  }
}
