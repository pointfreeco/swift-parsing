import Parsing
import XCTest

final class WhitespaceTests: XCTestCase {
  func testTrimsAllWhitespace() {
    var input = "    \r \t\t \r\n \n\r    Hello, world!"[...].utf8
    XCTAssertNotNil(Whitespace().parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
  }

  func testAlwaysSucceeds() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNotNil(Whitespace().parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
  }

  func testTrimsHorizontalWhitespace() {
    var input = "    \r \t\t \r\n \n\r    Hello, world!"[...].utf8
    XCTAssertNotNil(Whitespace(.horizontal).parse(&input))
    XCTAssertEqual("\r \t\t \r\n \n\r    Hello, world!", Substring(input))
  }

  func testTrimsVerticalWhitespace() {
    var input = "\r\n\r\n \n\r    Hello, world!"[...].utf8
    XCTAssertNotNil(Whitespace(.vertical).parse(&input))
    XCTAssertEqual(" \n\r    Hello, world!", Substring(input))
  }
}
