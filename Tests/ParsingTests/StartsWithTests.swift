import CustomDump
import Parsing
import XCTest

final class StartsWithTests: XCTestCase {
  func testStartsWith() {
    var str = "Hello, world!"[...].utf8
    XCTAssertNotNil(StartsWith("Hello".utf8).parse(&str))
    XCTAssertNoDifference(", world!", Substring(str))
  }
}
