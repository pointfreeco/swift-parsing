@testable import Parsing
import XCTest

final class EndTests: XCTestCase {
  func testSuccess() {
    var input = ""[...]
    XCTAssertNoThrow(try End().parse(&input))
    XCTAssertEqual("", input)
  }

  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertThrowsError(try End().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello, world!
          | ^ expected end of input
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual("Hello, world!", input)
  }
}
