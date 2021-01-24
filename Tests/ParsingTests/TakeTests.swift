import Parsing
import XCTest

final class TakeTests: XCTestCase {
  func testTake2Success() {
    var input = "12345"[...]
    XCTAssert(try ("1", "2") == XCTUnwrap(First().take(First()).parse(&input)))
    XCTAssertEqual("345", input)
  }

  func testTake3Success() {
    var input = "12345"[...]
    XCTAssert(try ("1", "2", "3") == XCTUnwrap(First().take(First()).take(First()).parse(&input)))
    XCTAssertEqual("45", input)
  }

  func testTake4Success() {
    var input = "12345"[...]
    XCTAssert(
      try ("1", "2", "3", "4")
        == XCTUnwrap(First().take(First()).take(First()).take(First()).parse(&input)))
    XCTAssertEqual("5", input)
  }

  func testTake5Success() {
    var input = "12345"[...]
    XCTAssert(
      try ("1", "2", "3", "4", "5")
        == XCTUnwrap(First().take(First()).take(First()).take(First()).take(First()).parse(&input)))
    XCTAssertEqual("", input)
  }
}
