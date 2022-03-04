import CustomDump
import Parsing
import XCTest

final class AlwaysTests: XCTestCase {
  func testAlways() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference(42, Always(42).parse(&input))
    XCTAssertNoDifference("Hello, world!", input)
  }

  func testMap() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference(43, try Always(42).map { $0 + 1 }.parse(&input))
    XCTAssertNoDifference("Hello, world!", input)
  }
}
