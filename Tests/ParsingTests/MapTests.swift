import Parsing
import XCTest

final class MapTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertEqual("42", Int.parser().map(String.init).parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testOverload() {
    let array = [1].map { "\($0)" }
    XCTAssert(type(of: array) == Array<String>.self)
  }
}
