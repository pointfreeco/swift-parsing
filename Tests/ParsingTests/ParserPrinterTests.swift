import Parsing
import XCTest

class ParserPrinterTests: XCTestCase {
  func testBasics() {
    let p = Parse {
      OneOf {
        "Hello"
        "Goodbye"
      }
      ", "
      Int.parser(of: Substring.self)
      "."
    }
    XCTAssertEqual(
      p.parse(
        """
        Hello, 42.
        """
      ),
      42
    )
    XCTAssertEqual(
      p.parse(
        """
        Goodbye, 42.
        """
      ),
      42
    )
    XCTAssertEqual(
      p.print(42),
      "Hello, 42."
    )
  }
}
