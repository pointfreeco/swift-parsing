import Parsing
import XCTest

struct Attribute: Equatable {
  public let at1: Int
  public let at2: Int?
}

struct ParsedText: Equatable {
  var attribute: Attribute?
  var text: String
}

final class PrefixUntilTests: XCTestCase {
  func testSuccess() {
    var input = "Hello,world, 42!"[...]
    XCTAssertEqual("Hello,world", try PrefixUntil(", ") { ", " }.parse(&input))
    XCTAssertEqual(", 42!", input)
  }
  
  func testSuccessIsEmpty() {
    var input = "Hello, world!"[...]
    XCTAssertEqual("", try PrefixUntil("") { "" }.parse(&input))
    XCTAssertEqual("Hello, world!", input)
  }
  
  func testMoreComplexExempleSlowPath() {
    let fontModifier = Parse {
      "|"
      Int.parser()
      Optionally {
        ":"
        Int.parser()
      }
      "🌶"
    }.map { Attribute(at1: $0.0, at2: $0.1) }

    let textWithAttributes = Parse {
      Peek { Prefix<Substring>(1) }
      Optionally { fontModifier }
      Optionally { PrefixUntil { fontModifier }.map(String.init) }
    }.map { ParsedText(attribute: $0.0, text: $0.1 ?? "") }

    let mainParser = Many(1...) {
      textWithAttributes
    }
    var input = "|36🌶INFO|0🌶|08:45:33| |33:1🌶ci runs in Secret Filtering mode|0🌶 "[...]
    XCTAssertEqual([
      ParsedText(attribute: Attribute(at1: 36, at2: nil), text: "INFO"),
      ParsedText(attribute: Attribute(at1: 0, at2: nil), text: "|08:45:33| "),
      ParsedText(attribute: Attribute(at1: 33, at2: 1), text: "ci runs in Secret Filtering mode"),
      ParsedText(attribute: Attribute(at1: 0, at2: nil), text: " "),
    ], try mainParser.parse(&input))
    XCTAssertEqual("", input)
  }

  func testMoreComplexExempleFastPath() {

    let fontModifier = Parse {
      "|"
      Int.parser()
      Optionally {
        ":"
        Int.parser()
      }
      "🌶"
    }.map { Attribute(at1: $0.0, at2: $0.1) }

    let textWithAttributes = Parse {
      Peek { Prefix<Substring>(1) }
      Optionally { fontModifier }
      Optionally { PrefixUntil("|") { fontModifier }.map(String.init) }
    }.map { ParsedText(attribute: $0.0, text: $0.1 ?? "") }

    let mainParser = Many(1...) {
      textWithAttributes
    }
    var input = "|36🌶INFO|0🌶|08:45:33| |33:1🌶ci runs in Secret Filtering mode|0🌶 "[...]
    XCTAssertEqual([
      ParsedText(attribute: Attribute(at1: 36, at2: nil), text: "INFO"),
      ParsedText(attribute: Attribute(at1: 0, at2: nil), text: "|08:45:33| "),
      ParsedText(attribute: Attribute(at1: 33, at2: 1), text: "ci runs in Secret Filtering mode"),
      ParsedText(attribute: Attribute(at1: 0, at2: nil), text: " "),
    ], try mainParser.parse(&input))
    XCTAssertEqual("", input)
  }

  func testFailureIsEmpty() {
    var input = ""[...]
    XCTAssertThrowsError(try PrefixUntil(", ") { ", " }.parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 |
          | ^ expected a non-empty input
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("", input)
  }
  
  func testConsumeWholeString() {
    var input = "Hello world!"[...]
    XCTAssertEqual("Hello world!", try PrefixUntil(", ") { ", " }.parse(&input))
  }
}
