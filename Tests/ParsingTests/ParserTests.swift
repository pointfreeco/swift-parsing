import Parsing
import XCTest

final class ParserTests: XCTestCase {
  func testNonIncrementalParsingValidatesEnd() {
    XCTAssertThrowsError(try Int.parser().parse("123 Hello")) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:4
        1 | 123 Hello
          |    ^ expected end of input
        """,
        "\(error)"
      )
    }
  }

  func testNonThrowingParserParseCollectionSuccess() throws {
    let p = Parse { CharacterSet(charactersIn: "abc") }
    XCTAssertEqual("abacab", try p.parse("abacab"))
  }

  func testNonThrowingParserParseCollectionFailure() {
    let p = Parse { CharacterSet(charactersIn: "abc") }
    XCTAssertThrowsError(try p.parse("abacad")) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:6
        1 | abacad
          |      ^ expected end of input
        """,
        "\(error)"
      )
    }
  }

  func testNonThrowingParserParseStringToUTF8ViewSuccess() {
    enum Currency { case eur, gbp, usd, unknown }
    let p = OneOf {
      "€".utf8.map { Currency.eur }
      "£".utf8.map { Currency.gbp }
      "$".utf8.map { Currency.usd }
    }
    .replaceError(with: Currency.unknown)
    XCTAssertEqual(Currency.usd, try p.parse("$"))
  }

  func testNonThrowingParserParseStringToUTF8ViewFailure() {
    enum Currency { case eur, gbp, usd, unknown }
    let p = OneOf {
      "€".utf8.map { Currency.eur }
      "£".utf8.map { Currency.gbp }
      "$".utf8.map { Currency.usd }
    }
    .replaceError(with: Currency.unknown)
    XCTAssertThrowsError(try p.parse("฿")) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | ฿
          | ^ expected end of input
        """,
        "\(error)"
      )
    }
  }
}
