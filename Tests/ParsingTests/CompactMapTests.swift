import Parsing
import XCTest

final class CompactMapTests: XCTestCase {
  func testSuccess() async {
    var input = "FF0000"[...]
    let output = await Prefix(2).compactMap { Int(String($0), radix: 16) }.parse(&input)
    XCTAssertEqual(
      0xFF,
      output
    )
    XCTAssertEqual("0000", Substring(input))
  }

  func testFailure() async {
    var input = "ERRORS"[...]
    let output = await Prefix(2).compactMap { Int(String($0), radix: 16) }.parse(&input)
    XCTAssertEqual(
      nil,
      output
    )
    XCTAssertEqual("ERRORS", Substring(input))
  }
}
