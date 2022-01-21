import Parsing
import XCTest

final class EndTests: XCTestCase {
  func testSuccess() {
    var input = ""[...]
    XCTAssertNoThrow(try End().parse(&input))
    XCTAssertEqual("", input)
  }

  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertThrowsError(try End().parse(&input))
    XCTAssertEqual("Hello, world!", input)
  }
}
