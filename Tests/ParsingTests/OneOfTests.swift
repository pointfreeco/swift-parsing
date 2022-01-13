import CustomDump
import Parsing
import XCTest

final class OneOfTests: XCTestCase {
  func testOneOfFirstSuccess() {
    var input = "New York, Hello!"[...]
    XCTAssertNotNil("New York".orElse("Berlin").parse(&input))
    XCTAssertNoDifference(", Hello!", Substring(input))
  }

  func testOneOfSecondSuccess() {
    var input = "Berlin, Hello!"[...]
    XCTAssertNotNil("New York".orElse("Berlin").parse(&input))
    XCTAssertNoDifference(", Hello!", Substring(input))
  }

  func testOneOfFailure() {
    var input = "London, Hello!"[...]
    XCTAssertNil("New York".orElse("Berlin").parse(&input))
    XCTAssertNoDifference("London, Hello!", Substring(input))
  }

  func testOneOfManyFirstSuccess() {
    var input = "New York, Hello!"[...]
    XCTAssertNotNil(OneOfMany("New York", "Berlin").parse(&input))
    XCTAssertNoDifference(", Hello!", Substring(input))
  }

  func testOneOfManyLastSuccess() {
    var input = "Berlin, Hello!"[...]
    XCTAssertNotNil(OneOfMany("New York", "Berlin").parse(&input))
    XCTAssertNoDifference(", Hello!", Substring(input))
  }

  func testOneOfManyFailure() {
    var input = "London, Hello!"[...]
    XCTAssertNil(OneOfMany("New York", "Berlin").parse(&input))
    XCTAssertNoDifference("London, Hello!", Substring(input))
  }
}
