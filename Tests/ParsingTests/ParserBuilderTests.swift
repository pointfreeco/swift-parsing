import Parsing
import XCTest

final class ParserBuilderTests: XCTestCase {
  func testBuildIfVoid() {
    var parseComma = true
    var parser = Parse(input: Substring.self) {
      "Hello"
      if parseComma {
        ","
      }
      " "
      Prefix { $0 != "!" }
      "!"
    }
    var input = "Hello, world!"[...]
    XCTAssertEqual("world", try parser.parse(&input))
    XCTAssertEqual(input, ""[...])

    input = "Hello world!"[...]
    XCTAssertThrowsError(try parser.parse(&input)) { error in
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
    XCTAssertEqual(input, " world!"[...])

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
    input = "Hello world!"
    XCTAssertEqual("world", try parser.parse(&input))
    XCTAssertEqual(input, ""[...])

    input = "Hello, world!"
    XCTAssertThrowsError(try parser.parse(&input)) { error in
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
    XCTAssertEqual(input, ", world!"[...])
  }

  func testBuildIfOutput() throws {
    var parseInt = true
    var parser = Parse(input: Substring.self) {
      if parseInt {
        Int.parser()
        " "
      }
      Rest()
    }
    var input = "42 Blob"[...]
    var (int, string) = try XCTUnwrap(parser.parse(&input))
    XCTAssertEqual(42, int)
    XCTAssertEqual("Blob", string)
    XCTAssertEqual(input, ""[...])

    input = "Blob"
    XCTAssertThrowsError(try parser.parse(&input)) { error in
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
    XCTAssertEqual(input, "Blob"[...])

    parseInt = false
    parser = Parse {
      if parseInt {
        Int.parser()
        " "
      }
      Rest()
    }
    input = "Blob"
    (int, string) = try XCTUnwrap(parser.parse(&input))
    XCTAssertEqual(nil, int)
    XCTAssertEqual("Blob", string)
    XCTAssertEqual(input, ""[...])
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

    var input = "123 Blob"[...]
    XCTAssertThrowsError(
      try Parse(input: Substring.self) {
        Int.parser()
        MyParser()
      }
      .parse(&input)
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
    XCTAssertEqual(input, " Blob"[...])

    input = "123 Blob"[...]

    func custom<P>(@ParserBuilder<Substring> _ build: () -> P) -> P {
      build()
    }
    XCTAssertThrowsError(
      try custom {
        Int.parser()
        MyParser()
      }
      .parse(&input)
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
    XCTAssertEqual(input, " Blob"[...])
  }

  func testNestedPrint() throws {
    let p1 = ParsePrint(input: Substring.self) {
      Digits()
      ","
      Digits()
    }
    let p2 = ParsePrint(input: Substring.self) {
      Digits()
      ","
      Digits()
    }
    let p3 = ParsePrint {
      p1
      ","
      p2
    }
    var input = ""[...]
    try p3.print((1, 2, (3, 4)), into: &input)
    XCTAssertEqual(input, "1,2,3,4")
  }

  func testNestedPrint_differentLayouts() throws {
    let p1 = ParsePrint(input: Substring.self) {
      Int32.parser()
      ","
      Int8.parser()
    }
    let p2 = ParsePrint(input: Substring.self) {
      Int8.parser()
      ","
      Int32.parser()
    }
    let p3 = ParsePrint {
      p1
      ","
      p2
    }
    var input = ""[...]
    try p3.print((1, 2, (3, 4)), into: &input)
    XCTAssertEqual(input, "1,2,3,4")
  }
}
