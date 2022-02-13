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
  
  func testFlatSeparatedBuilder() throws {
    // N == 3 -> Requires Zip_5 => A flat Zip<OVOVO> is used
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
  
  func testNestedSeparatedBuilder() throws {
    // N == 4 -> Requires Zip_7 => Nested as Zip_4<Zip<OV>…>
    let parser = Parse {
      Int.parser()
      Double.parser()
      CharacterSet.letters
      Double.parser()
    } separator: {
      ";"
    }
    
    var input = "1;2.0;abc;3.0"[...]
    let (int, double1, chars, double2) = try XCTUnwrap(parser.parse(&input))
    XCTAssertEqual(int, 1)
    XCTAssertEqual(double1, 2.0)
    XCTAssertEqual(chars, "abc")
    XCTAssertEqual(double2, 3.0)
    XCTAssertEqual(input, "")
  }
}
