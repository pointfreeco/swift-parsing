import Parsing
import XCTest

final class OptionalTests: XCTestCase {
  func testSuccess() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertEqual(true, Optionally { Bool.parser() }.parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertEqual(nil, Optionally { Bool.parser() }.parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
  }
}
