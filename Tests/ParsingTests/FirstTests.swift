import CustomDump
import Parsing
import XCTest

final class FirstTests: XCTestCase {
  func testSuccess() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference("H", First().parse(&input))
    XCTAssertNoDifference("ello, world!", input)
  }

  func testFailure() {
    var input = ""[...]
    XCTAssertNoDifference(nil, First().parse(&input))
    XCTAssertNoDifference("", input)
  }
}
