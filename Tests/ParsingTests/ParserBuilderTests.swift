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
    XCTAssertEqual("world", parser.parse("Hello, world!"))
    XCTAssertNil(parser.parse("Hello world!"))

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
    XCTAssertEqual("world", parser.parse("Hello world!"))
    XCTAssertNil(parser.parse("Hello, world!"))
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
    XCTAssertNil(parser.parse("Blob"))

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
  
  func testSeparatedBuilder() throws {
    let parser = Parse {
      Int.parser()
      Double.parser()
      CharacterSet.letters
    } separator: {
      ";"
    }
    
    var input = "1;2.0;abc"[...]
    let (int, double, chars) = try XCTUnwrap(parser.parse(&input))
    XCTAssertEqual(int, 1)
    XCTAssertEqual(double, 2.0)
    XCTAssertEqual(chars, "abc")
    XCTAssertEqual(input, "")
  }
}
