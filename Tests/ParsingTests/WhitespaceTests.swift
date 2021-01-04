import Parsing
import XCTest

final class WhitespaceTests: XCTestCase {
  func testTrimsWhitespace() {
    var input = "    \r \t\t \r\n \n\r    Hello, world!"[...].utf8
    XCTAssertNotNil(Whitespace().parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
  }

  func testAlwaysSucceeds() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNotNil(Whitespace().parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
  }

  func testExcludesNewlinesWhitespace() {
    var input = "    \t\t    \r\nHello, world!"[...].utf8
    XCTAssertNotNil(Whitespace(includeNewlines: false).parse(&input))
    XCTAssertEqual("\r\nHello, world!", Substring(input))
  }
}
