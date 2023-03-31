import Parsing
import XCTest

final class BacktrackTests: XCTestCase {
  func testFailure() {
    let parser: some Parser<Substring, Substring> = Backtracking {
      Prefix(2) { $0 == "A" }
    }

    var input = "AB"[...]
    XCTAssertThrowsError(try parser.parse(&input))
    XCTAssertEqual("AB", Substring(input))
  }

  func testSuccess() throws {
    let parser: some Parser<Substring, Substring> = Backtracking {
      Prefix(1) { $0 == "A" }
    }
    var input = "AB"[...]
    let output = try parser.parse(&input)
    XCTAssertEqual("B", Substring(input))
    XCTAssertEqual("A", output)
  }

  func testPrint() throws {
    let parser: some ParserPrinter<Substring, Substring> = Backtracking {
      Prefix(2) { $0 == "A" }
    }

    let input = try parser.print("AA"[...])
    XCTAssertEqual(input, "AA")
  }
}
