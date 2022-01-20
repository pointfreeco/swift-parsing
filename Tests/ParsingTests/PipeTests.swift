import Parsing
import XCTest

final class PipeTests: XCTestCase {
  func testSuccess() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertEqual(true, try Prefix(5).pipe { Bool.parser() }.parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
  }

  func testFailureOutput() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertThrowsError(
      try Prefix(5).pipe {
        Bool.parser()
        End()
      }
      .parse(&input)
    )
    XCTAssertEqual("true Hello, world!", Substring(input))
  }

  func testFailureInput() {
    var input = "true"[...].utf8
    XCTAssertThrowsError(
      try PrefixUpTo("\n".utf8).pipe {
        Bool.parser()
      }
      .parse(&input)
    )
    XCTAssertEqual("true", Substring(input))
  }
}
