import Parsing
import XCTest

final class PrefixTests: XCTestCase {
  func testPrefixSuccess() {
    var input = "42 Hi!"[...]
    XCTAssertEqual("42", try Prefix(2).parse(&input))
    XCTAssertEqual(" Hi!", input)
  }

  func testPrefixUnder() {
    var input = "42 Hi!"[...]
    XCTAssertThrowsError(try Prefix(8).parse(&input))
    XCTAssertEqual("", input)
  }

  func testPrefixOver() {
    var input = "42 Hi!"[...]
    XCTAssertThrowsError(try Prefix(10).parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:7
        1 | 42 Hi!
          |       ^ expected 4 more elements
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("", input)
  }

  func testPrefixWhile() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("42", try Prefix(while: { $0.isNumber }).parse(&input))
    XCTAssertEqual(" Hello, world!", input)
  }

  func testPrefixWhileAlwaysSucceeds() {
    var input = "Hello, world!"[...]
    XCTAssertEqual("", try Prefix(while: { $0.isNumber }).parse(&input))
    XCTAssertEqual("Hello, world!", input)
  }

  func testPrefixRangeFromSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("42 Hello, world!", try Prefix(1...).parse(&input))
    XCTAssertEqual("", input)
  }

  func testPrefixRangeFromFailure() {
    var input = "42 Hello, world!"[...]
    XCTAssertThrowsError(try Prefix(100...) { _ in true }.parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:17
        1 | 42 Hello, world!
          |                 ^ expected 84 more elements satisfying predicate
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("", input)
  }

  func testPrefixRangeFromWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("42", try Prefix(1..., while: { $0.isNumber }).parse(&input))
    XCTAssertEqual(" Hello, world!", input)
  }

  func testPrefixRangeThroughSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("42 Hello, ", try Prefix(...10).parse(&input))
    XCTAssertEqual("world!", input)
  }

  func testPrefixRangeThroughWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("42", try Prefix(...10, while: { $0.isNumber }).parse(&input))
    XCTAssertEqual(" Hello, world!", input)
  }

  func testPrefixLengthFromWhileSuccess() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual("4", try Prefix(1, while: { $0.isNumber }).parse(&input))
    XCTAssertEqual("2 Hello, world!", input)
  }

  func testPrintUpstreamInputFailure() {
    struct MyParserPrinter: ParserPrinter {
      var body: some ParserPrinter<Substring, (Substring, Character)> {
        Prefix { $0 != "\n" }
        First()
      }
    }
    XCTAssertThrowsError(try MyParserPrinter().print(("Hello", " "))) { error in
      XCTAssertEqual(
        """
        error: round-trip expectation failed

        A "Prefix" parser's predicate satisfied the first element printed by the next printer.

        During a round-trip, the "Prefix" parser would have parsed this element, which means the \
        data handed to the next printer is in an invalid state.
        """,
        "\(error)"
      )
    }
  }

  func testPrintWithMaxCountAllowMatchingNextElement() {
    struct MyParserPrinter: ParserPrinter {
      var body: some ParserPrinter<Substring, (Substring, Character)> {
        Prefix(3) { $0.isNumber }
        First()
      }
    }
    XCTAssertEqual("1230", try MyParserPrinter().print(("123", "0")))
  }
}
