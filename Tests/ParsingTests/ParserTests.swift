import CustomDump
import Parsing
import XCTest

final class ParserTests: XCTestCase {
  func testNonIncrementalParsingValidatesEnd() {
    XCTAssertThrowsError(try Int.parser().parse("123 Hello")) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:4
        1 | 123 Hello
          |    ^ expected end of input
        """,
        "\(error)"
      )
    }
  }
}
