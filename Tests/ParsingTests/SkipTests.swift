import Parsing
import XCTest

final class SkipTests: XCTestCase {
  func testSkipSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertNoThrow(try Skip { Int.parser() }.parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testSkipFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertThrowsError(try Skip { Int.parser() }.parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
  }
}
