import Parsing
import XCTest

final class ReplaceErrorTests: XCTestCase {
  func testBacktracks() {
    var input = "123"[...]
    XCTAssertEqual(
      0,
      Parse {
        Int.parser()
        "!"
      }.replaceError(with: 0).parse(&input.utf8))
    XCTAssertEqual("123", input)
  }
}
