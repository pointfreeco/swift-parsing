import Parsing
import XCTest

final class NewlineTests: XCTestCase {
  func testSuccess() {
    var input = "\n\r\n\n\rHello, world!"[...].utf8
    XCTAssertNotNil(ASCIINewline().parse(&input))
    XCTAssertEqual("\r\n\n\rHello, world!", Substring(input))
    XCTAssertNotNil(ASCIINewline().parse(&input))
    XCTAssertEqual("\n\rHello, world!", Substring(input))
    XCTAssertNotNil(ASCIINewline().parse(&input))
    XCTAssertEqual("\rHello, world!", Substring(input))
    XCTAssertNil(ASCIINewline().parse(&input))
    XCTAssertEqual("\rHello, world!", Substring(input))
  }

  func testAlwaysSucceeds() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNil(ASCIINewline().parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
  }
}
