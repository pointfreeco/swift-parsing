import CustomDump
import Parsing
import XCTest

final class OptionalTests: XCTestCase {
  func testSuccess() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertNoDifference(.some(true), Optionally { Bool.parser() }.parse(&input))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }

  func testFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNoDifference(.none, Optionally { Bool.parser() }.parse(&input))
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }

  func testBacktracking() {
    let parser = Parse {
      "Hello,"
      Optionally {
        " "
        Bool.parser()
      }
      " world!"
    }

    XCTAssertNoDifference(.some(true), try parser.parse("Hello, true world!"))
    XCTAssertNoDifference(.none, try parser.parse("Hello, world!"))
  }
}
