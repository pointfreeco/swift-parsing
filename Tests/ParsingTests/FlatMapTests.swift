import CustomDump
import Parsing
import XCTest

final class FlatMapTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertNoDifference(43, Int.parser().flatMap { Always($0 + 1) }.parse(&input))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }

  func testFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNoDifference(nil, Int.parser().flatMap { Always($0 + 1) }.parse(&input))
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }
}
