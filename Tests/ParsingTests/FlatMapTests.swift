import Parsing
import XCTest

final class FlatMapTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual(43, Int.parser().flatMap { Always<Substring, Int>($0 + 1) }.parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertEqual(nil, Int.parser().flatMap { Always<Substring, Int>($0 + 1) }.parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
  }
}
