import Parsing
import XCTest

final class CompactMapTests: XCTestCase {
  func testSuccess() {
    var input = "FF0000"[...]
    XCTAssertEqual(
      0xFF,
      Prefix(2).compactMap { Int(String($0), radix: 16) }.parse(&input)
    )
    XCTAssertEqual("0000", Substring(input))
  }

  func testFailure() {
    var input = "ERRORS"[...]
    XCTAssertEqual(
      nil,
      Prefix(2).compactMap { Int(String($0), radix: 16) }.parse(&input)
    )
    XCTAssertEqual("ERRORS", Substring(input))
  }
}
