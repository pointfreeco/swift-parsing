import Parsing
import XCTest

final class BoolTests: XCTestCase {
  func testParsesTrue() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertEqual(true, try Bool.parser().parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testParsesFalse() {
    var input = "false Hello, world!"[...].utf8
    XCTAssertEqual(false, try Bool.parser().parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testParseFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertThrowsError(try Bool.parser().parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
  }
}
