@testable import Parsing
import XCTest

final class FailTests: XCTestCase {
  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertThrowsError(try Fail<Substring, Int>().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: failed
         --> input:1:1
        1 | Hello, world!
          | ^
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual("Hello, world!", input)
  }
}
