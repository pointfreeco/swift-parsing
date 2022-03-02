import CustomDump
import Parsing
import XCTest

final class ReplaceErrorTests: XCTestCase {
  func testBacktracks() {
    var input = "123"[...]
    XCTAssertNoDifference(
      0,
      Parse {
        Int.parser()
        "!"
      }.replaceError(with: 0).parse(&input))
    XCTAssertNoDifference("123", input)
  }
}
