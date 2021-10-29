import Parsing
import XCTest

final class OneOfTests: XCTestCase {
  func testOneOfFirstSuccess() {
    var input = "New York, Hello!"[...]
    let parser = StartsWith<Substring>("New York").orElse(StartsWith("Berlin"))

    XCTAssertNotNil(parser.parse(&input))
    XCTAssertEqual(", Hello!", Substring(input))
    XCTAssertEqual(parser.print(()), "New York")
  }

  func testOneOfSecondSuccess() {
    var input = "Berlin, Hello!"[...]
    XCTAssertNotNil(StartsWith("New York").orElse(StartsWith("Berlin")).parse(&input))
    XCTAssertEqual(", Hello!", Substring(input))
  }

  func testOneOfFailure() {
    var input = "London, Hello!"[...]
    XCTAssertNil(StartsWith("New York").orElse(StartsWith("Berlin")).parse(&input))
    XCTAssertEqual("London, Hello!", Substring(input))
  }

  func testOneOfManyFirstSuccess() {
    var input = "New York, Hello!"[...]
    XCTAssertNotNil(OneOfMany(StartsWith("New York"), StartsWith("Berlin")).parse(&input))
    XCTAssertEqual(", Hello!", Substring(input))
  }

  func testOneOfManyLastSuccess() {
    var input = "Berlin, Hello!"[...]
    XCTAssertNotNil(OneOfMany(StartsWith("New York"), StartsWith("Berlin")).parse(&input))
    XCTAssertEqual(", Hello!", Substring(input))
  }

  func testOneOfManyFailure() {
    var input = "London, Hello!"[...]
    XCTAssertNil(OneOfMany(StartsWith("New York"), StartsWith("Berlin")).parse(&input))
    XCTAssertEqual("London, Hello!", Substring(input))
  }
}
