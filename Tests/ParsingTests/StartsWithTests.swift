import Parsing
import XCTest

final class StartsWithTests: XCTestCase {
  func testStartsWith() {
    var str = "Hello, world!"[...].utf8
    XCTAssertNoThrow(try StartsWith("Hello".utf8).parse(&str))
    XCTAssertEqual(", world!", Substring(str))
  }
  
  func testParseFailure() {
    var input = "Goodnight, Blob!"[...].utf8
    XCTAssertThrowsError(try StartsWith("Hello, ".utf8).parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | Goodnight, Blob!
          | ^ expected "Hello, "
        """,
        "\(error)"
      )
    }
  }
}
