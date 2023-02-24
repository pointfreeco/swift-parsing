import Parsing
import XCTest

final class ConsumedTests: XCTestCase {
  func testConsumed() throws {
    struct ConsumedWhitespace: Parser {
      var body: some Parser<Substring.UTF8View, Substring.UTF8View> {
        Consumed { Whitespace() }
      }
    }

    var input = "    \r \t\t \r\n \n\r    Hello, world!"[...].utf8
    XCTAssertEqual(
      "    \r \t\t \r\n \n\r    ",
      try Substring(ConsumedWhitespace().parse(&input))
    )
    XCTAssertEqual("Hello, world!", Substring(input))

    input = ""[...].utf8
  }
}
