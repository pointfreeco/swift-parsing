import CustomDump
import Parsing
import XCTest

final class EndTests: XCTestCase {
  func testSuccess() {
    var input = ""[...]
    XCTAssertNotNil(End().parse(&input))
    XCTAssertNoDifference("", input)
  }

  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertNil(End().parse(&input))
    XCTAssertNoDifference("Hello, world!", input)
  }
}
