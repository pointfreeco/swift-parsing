import Parsing
import XCTest

final class MapTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertEqual("42", Int.parser().map(String.init).parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }
}
