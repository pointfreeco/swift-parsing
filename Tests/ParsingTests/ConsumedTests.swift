import Parsing
import XCTest

final class ConsumedTests: XCTestCase {
  func testConsumed() throws {
    var input = "    \r \t\t \r\n \n\r    Hello, world!"[...].utf8
    XCTAssertEqual(
      "    \r \t\t \r\n \n\r    ",
      try Substring(Consumed { Whitespace() }.parse(&input))
    )
    XCTAssertEqual("Hello, world!", Substring(input))
  }
}
