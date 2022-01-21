import Parsing
import XCTest

final class PrintingTests: XCTestCase {
  func testPrinting() throws {
    let p = Parse {
      Int.parser()
      Whitespace()
        .printing(" ".utf8)
      Int.parser()
    }

    var input = ""[...].utf8
    try p.print((1, 2), to: &input)
    XCTAssertEqual(Substring(input), "1 2")
  }
}
