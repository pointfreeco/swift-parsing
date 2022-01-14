import Parsing
import XCTest

final class ParserBuilderTests: XCTestCase {
  func testBuildIf() {
    var parseComma = true
    var parser = Parse {
      "Hello"
      Skip {
        if parseComma {
          ","
        }
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
      Skip {
        if parseComma {
          ","
        }
      }
      " "
      Prefix { $0 != "!" }
      "!"
    }
    XCTAssertEqual("world", parser.parse("Hello world!"))
    XCTAssertNil(parser.parse("Hello, world!"))
  }
}
