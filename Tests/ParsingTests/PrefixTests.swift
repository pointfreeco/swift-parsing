import CustomDump
import Parsing
import XCTest

final class PrefixTests: XCTestCase {
  func testPrefixSuccess() {
    var input = "42 Hi!"[...]
    XCTAssertNoDifference("42", Prefix(2).parse(&input))
    XCTAssertNoDifference(" Hi!", input)
  }

  func testPrefixUnder() {
    var input = "42 Hi!"[...]
    XCTAssertNoDifference(nil, Prefix(8).parse(&input))
    XCTAssertNoDifference("42 Hi!", input)
  }

  func testPrefixOver() {
    var input = "42 Hi!"[...]
    XCTAssertNoDifference(nil, Prefix(10).parse(&input))
    XCTAssertNoDifference("42 Hi!", input)
  }

  func testPrefixWhile() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("42", Prefix(while: { $0.isNumber }).parse(&input))
    XCTAssertNoDifference(" Hello, world!", input)
  }

  func testPrefixWhileAlwaysSucceeds() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference("", Prefix(while: { $0.isNumber }).parse(&input))
    XCTAssertNoDifference("Hello, world!", input)
  }

  func testPrefixRangeFromSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("42 Hello, world!", Prefix(1...).parse(&input))
    XCTAssertNoDifference("", input)
  }

  func testPrefixRangeFromFailure() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference(nil, Prefix(100...).parse(&input))
    XCTAssertNoDifference("42 Hello, world!", input)
  }

  func testPrefixRangeFromWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("42", Prefix(1..., while: { $0.isNumber }).parse(&input))
    XCTAssertNoDifference(" Hello, world!", input)
  }

  func testPrefixRangeThroughSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("42 Hello, ", Prefix(...10).parse(&input))
    XCTAssertNoDifference("world!", input)
  }

  func testPrefixRangeThroughWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("42", Prefix(...10, while: { $0.isNumber }).parse(&input))
    XCTAssertNoDifference(" Hello, world!", input)
  }

  func testPrefixLengthFromWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference("4", Prefix(1, while: { $0.isNumber }).parse(&input))
    XCTAssertNoDifference("2 Hello, world!", input)
  }
}
