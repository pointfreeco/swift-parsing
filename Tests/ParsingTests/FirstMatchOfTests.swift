import Parsing
import XCTest

final class FirstMatchOfTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...].utf8

    XCTAssertNotNil(FirstMatchOf(StartsWith("Hello".utf8)).parse(&input))
    XCTAssertEqual(", world!", Substring(input))
  }

  func testFailure() {
    var input = "42 Hello, world!"[...].utf8

    XCTAssertNil(FirstMatchOf(StartsWith("Bonjour".utf8)).parse(&input))
    XCTAssertEqual("42 Hello, world!", Substring(input))
  }
}
