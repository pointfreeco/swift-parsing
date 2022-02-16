import Parsing
import XCTest

final class FromSubstringTests: XCTestCase {
  func testUTF8View() {
    let p = Parse {
      "caf".utf8
      FromSubstring { "é" }
    }

    var input = "caf\u{00E9}"[...].utf8
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)

    input = "cafe\u{0301}"[...].utf8
    XCTAssertNoThrow(try p.parse(&input))
    XCTAssert(input.isEmpty)
  }
}
