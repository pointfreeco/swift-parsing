import Parsing
import XCTest

final class OptionalTests: XCTestCase {
  struct OptionalBool: ParserPrinter {
    var body: some ParserPrinter<Substring.UTF8View, Bool?> {
      Optionally { Bool.parser() }
    }
  }

  func testParseWrappedSuccess() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertEqual(.some(true), try OptionalBool().parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testParseWrappedFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertEqual(.none, try OptionalBool().parse(&input))
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

    XCTAssertNoThrow(try OptionalBool().print(.none, into: &input.utf8))
    XCTAssertEqual("!"[...], input)
  }

  func testPrintValueSuccess() {
    var input = "!"[...]

    XCTAssertNoThrow(try OptionalBool().print(.some(true), into: &input.utf8))
    XCTAssertEqual("true!"[...], input)
  }

  func testPrintBadOptionalValue() {
    struct OptionalPrefix: ParserPrinter {
      var body: some ParserPrinter<Substring, Substring?> {
        Optionally { Prefix { !$0.isWhitespace } }
      }
    }

    var input = "!"[...]

    XCTAssertThrowsError(
      try OptionalPrefix().print("foo bar", into: &input))
    XCTAssertEqual("!"[...], input)
  }
}
