import CustomDump
import Parsing
import XCTest

final class NewlineTests: XCTestCase {
  func testSuccess() {
    var input = "\n\r\n\n\rHello, world!"[...].utf8
    XCTAssertNotNil(Newline().parse(&input))
    XCTAssertNoDifference("\r\n\n\rHello, world!", Substring(input))
    XCTAssertNotNil(Newline().parse(&input))
    XCTAssertNoDifference("\n\rHello, world!", Substring(input))
    XCTAssertNotNil(Newline().parse(&input))
    XCTAssertNoDifference("\rHello, world!", Substring(input))
    XCTAssertNil(Newline().parse(&input))
    XCTAssertNoDifference("\rHello, world!", Substring(input))
  }

  func testAlwaysSucceeds() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNil(Newline().parse(&input))
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }
}
