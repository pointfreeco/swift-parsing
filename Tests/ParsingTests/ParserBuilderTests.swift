@testable import Parsing
import XCTest

final class ParserBuilderTests: XCTestCase {
  func testBuildIfVoid() {
    var parseComma = true
    var parser = Parse {
      "Hello"
      if parseComma {
        ","
      }
      " "
      Prefix { $0 != "!" }
      "!"
    }
    XCTAssertEqual("world", try parser.parse("Hello, world!"))
    XCTAssertThrowsError(try parser.parse("Hello world!")) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:6
        1 | Hello world!
          |      ^ expected ","
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }

    parseComma = false
    parser = Parse {
      "Hello"
      if parseComma {
        ","
      }
      " "
      Prefix { $0 != "!" }
      "!"
    }
    XCTAssertEqual("world", try parser.parse("Hello world!"))
    XCTAssertThrowsError(try parser.parse("Hello, world!")) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:6
        1 | Hello, world!
          |      ^ expected " "
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
  }

  func testBuildIfOutput() throws {
    var parseInt = true
    var parser = Parse {
      if parseInt {
        Int.parser()
        " "
      }
      Rest()
    }
    var (int, string) = try XCTUnwrap(parser.parse("42 Blob"))
    XCTAssertEqual(42, int)
    XCTAssertEqual("Blob", string)
    XCTAssertThrowsError(try parser.parse("Blob")) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:1
        1 | London, Hello!
          | ^ expected "New York"

        error: unexpected input
         --> input:1:1
        1 | London, Hello!
          | ^ expected "Berlin"
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }

    parseInt = false
    parser = Parse {
      if parseInt {
        Int.parser()
        " "
      }
      Rest()
    }
    (int, string) = try XCTUnwrap(parser.parse("Blob"))
    XCTAssertEqual(nil, int)
    XCTAssertEqual("Blob", string)
  }
}
