import Parsing
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
    XCTAssertThrowsError(try parser.parse("Hello world!"))

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
    XCTAssertThrowsError(try parser.parse("Hello, world!"))
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
    XCTAssertThrowsError(try parser.parse("Blob"))

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
