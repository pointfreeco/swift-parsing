@testable import Parsing
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
    ) { error in
      // TODO: How should this error render?
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1-5
        1 | true Hello, world!
          | ^^^^^ pipe: expected end of input
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual("Hello, world!", Substring(input))
  }

  func testFailureInput() {
    var input = "true"[...].utf8
    XCTAssertThrowsError(
      try PrefixUpTo("\n".utf8).pipe {
        Bool.parser()
      }
      .parse(&input)
    ) { error in
      XCTAssertEqual(
        #"""
        error: unexpected input
         --> input:1:1
        1 | true
          | ^ expected prefix up to "\n"
        """#,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual("true", Substring(input))
  }
}
