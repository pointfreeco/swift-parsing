import CustomDump
import Parsing
import XCTest

final class OptionalTests: XCTestCase {
  func testParseWrappedSuccess() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertNoDifference(.some(true), Optionally { Bool.parser() }.parse(&input))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }

  func testParseWrappedFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNoDifference(.none, Optionally { Bool.parser() }.parse(&input))
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }

  func testParseBacktracking() {
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

  func testPrintNilSuccess() {
    var input = "!"[...]

    XCTAssertNoThrow(try Optionally { Bool.parser() }.print(.none, into: &input))
    XCTAssertNoDifference("!"[...], input)
  }

  func testPrintValueSuccess() {
    var input = "!"[...]

    XCTAssertNoThrow(try Optionally { Bool.parser() }.print(.some(true), into: &input))
    XCTAssertNoDifference("true!"[...], input)
  }

  func testPrintBadOptionalValue() {
    var input = "!"[...]

    XCTAssertThrowsError(
      try Optionally { Prefix { !$0.isWhitespace } }.print("foo bar", into: &input))
    XCTAssertNoDifference("!"[...], input)
  }
}
