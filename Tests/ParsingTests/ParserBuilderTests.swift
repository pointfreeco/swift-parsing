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
        "\(error)"
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
        "\(error)"
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
        error: unexpected input
         --> input:1:1
        1 | Blob
          | ^ expected integer
        """,
        "\(error)"
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

  func testWrapsCustomErrors() {
    struct MyParser: Parser {
      func parse(_ input: inout Substring) throws {
        struct MyError: LocalizedError {
          var errorDescription: String? {
            "whoops!"
          }
        }
        throw MyError()
      }
    }

    XCTAssertThrowsError(
      try Parse {
        Int.parser()
        MyParser()
      }
      .parse("123 Blob")
    ) { error in
      XCTAssertEqual(
        """
        error: whoops!
         --> input:1:4
        1 | 123 Blob
          |    ^
        """,
        "\(error)"
      )
    }

    func custom<P>(@ParserBuilder _ build: () -> P) -> P {
      build()
    }
    XCTAssertThrowsError(
      try custom {
        Int.parser()
        MyParser()
      }
      .parse("123 Blob")
    ) { error in
      XCTAssertEqual(
        """
        error: whoops!
         --> input:1:4
        1 | 123 Blob
          |    ^
        """,
        "\(error)"
      )
    }
  }
}
