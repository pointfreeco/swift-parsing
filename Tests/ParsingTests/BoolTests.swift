import CustomDump
import Parsing
import XCTest

final class BoolTests: XCTestCase {
  func testParsesTrue() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertNoDifference(true, Bool.parser().parse(&input))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }

  func testParsesFalse() {
    var input = "false Hello, world!"[...].utf8
    XCTAssertNoDifference(false, Bool.parser().parse(&input))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }

  func testParseFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNoDifference(nil, Bool.parser().parse(&input))
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }
}
