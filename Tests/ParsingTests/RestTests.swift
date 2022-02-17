import CustomDump
import Parsing
import XCTest

final class RestTests: XCTestCase {
  func testRest() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference("Hello, world!", Rest().parse(&input))
    XCTAssertNoDifference("", input)
  }

  func testRestAlwaysSucceeds() {
    var input = ""[...]
    XCTAssertNoDifference("", Rest().parse(&input))
    XCTAssertNoDifference("", input)
  }
}
