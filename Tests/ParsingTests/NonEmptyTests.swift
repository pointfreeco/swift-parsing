import Parsing
import XCTest

final class NonEmptyTests: XCTestCase {
  func testSuccess() {
    var input = "Hello, world!"[...]
    XCTAssertEqual("Hello", CharacterSet.alphanumerics.nonEmpty.parse(&input))
    XCTAssertEqual(", world!", input)
  }

  func testFailure() {
    var input = " Hello, world!"[...]
    XCTAssertEqual(nil, CharacterSet.alphanumerics.nonEmpty.parse(&input))
    XCTAssertEqual(" Hello, world!", input)
  }
}
