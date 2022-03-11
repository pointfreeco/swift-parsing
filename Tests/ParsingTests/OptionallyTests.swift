import Parsing
import XCTest

final class OptionalTests: XCTestCase {
  func testParseWrappedSuccess() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertEqual(.some(true), Optionally { Bool.parser() }.parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testParseWrappedFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertEqual(.none, Optionally { Bool.parser() }.parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
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

    XCTAssertEqual(.some(true), try parser.parse("Hello, true world!"))
    XCTAssertEqual(.none, try parser.parse("Hello, world!"))
  }

  func testPrintNilSuccess() {
    var input = "!"[...]

    XCTAssertNoThrow(try Optionally { Bool.parser() }.print(.none, into: &input))
    XCTAssertEqual("!"[...], input)
  }

  func testPrintValueSuccess() {
    var input = "!"[...]

    XCTAssertNoThrow(try Optionally { Bool.parser() }.print(.some(true), into: &input))
    XCTAssertEqual("true!"[...], input)
  }

  func testPrintBadOptionalValue() {
    var input = "!"[...]

    XCTAssertThrowsError(
      try Optionally { Prefix { !$0.isWhitespace } }.print("foo bar", into: &input))
    XCTAssertEqual("!"[...], input)
  }
}
