import CustomDump
import Parsing
import XCTest

final class PipeTests: XCTestCase {
  func testSuccess() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertNoDifference(true, Prefix(5).pipe(Bool.parser()).parse(&input))
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }

  func testFailureOutput() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertNoDifference(nil, Prefix(5).pipe(Bool.parser().skip(End())).parse(&input))
    XCTAssertNoDifference("true Hello, world!", Substring(input))
  }

  func testFailureInput() {
    var input = "true"[...].utf8
    XCTAssertNoDifference(nil, PrefixUpTo("\n".utf8).pipe(Bool.parser()).parse(&input))
    XCTAssertNoDifference("true", Substring(input))
  }
}
