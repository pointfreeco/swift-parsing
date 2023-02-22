import Parsing
import XCTest

final class BacktrackTests: XCTestCase {
  func testFailure() {
    var input = "AB"[...]
    XCTAssertThrowsError(
      try Backtracking { Prefix(2) { $0 == "A" } }
        .parse(&input)
    )
    XCTAssertEqual("AB", Substring(input))
  }

  func testSuccess() throws {
    var input = "AB"[...]
    let output = try Backtracking { Prefix(1) { $0 == "A" } }
      .parse(&input)
    XCTAssertEqual("B", Substring(input))
    XCTAssertEqual("A", output)
  }

  func testPrint() throws {
    let input = try Backtracking { Prefix(2) { $0 == "A" } }.print("AA")
    XCTAssertEqual(input, "AA")
  }
}
