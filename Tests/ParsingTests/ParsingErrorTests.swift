import Parsing
import XCTest

class ParsingErrorTests: XCTestCase {
  func testUnknownInput() {
    struct MyInput {}
    struct MyOutput {}
    struct MyParser: Parser {
      func parse(_ input: inout MyInput) throws -> MyOutput {
        struct MyError: Error {}
        throw MyError()
      }
    }
    XCTAssertThrowsError(
      try Parse {
        MyParser()
        MyParser()
      }.parse(MyInput())
    ) { error in
      XCTAssertEqual(
        """
        error: MyError()
        """,
        "\(error)"
      )
    }
  }

  func testAlignsLineNumber() {
    let parser = Many(atLeast: 101) {
      "Hello"
    } separator: {
      "\n"
    }

    XCTAssertThrowsError(
      try parser.parse(String(repeating: "Hello\n", count: 100) + "World")
    ) { error in
      XCTAssertEqual(
        """
        error: unexpected input
           --> input:100:6
        100 | Hello
            |      ^ expected 1 more value of "()"
        """,
        "\(error)"
      )
    }
  }

  func testTruncatesLongLines() {
    XCTAssertThrowsError(
      try Many(atLeast: 101) { "hello" }.parse(
        String(repeating: "hello", count: 100) + String(repeating: "world", count: 100)
      )
    ) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:501
        1 | …hellohellohellohelloworldworldworldworldworldworldworldworldworldworldworl…
          |                      ^ expected 1 more value of "()"
        """,
        "\(error)"
      )
    }

    XCTAssertThrowsError(
      try Many(atLeast: 101) { "hello" }.parse(
        String(repeating: "hello", count: 100) + "world"
      )
    ) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:501
        1 | …hellohellohellohelloworld
          |                      ^ expected 1 more value of "()"
        """,
        "\(error)"
      )
    }

    XCTAssertThrowsError(
      try "hello".parse(
        String(repeating: "world", count: 100)
      )
    ) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | worldworldworldworldworldworldworldworldworldworldworldworldworldworldworld…
          | ^ expected "hello"
        """,
        "\(error)"
      )
    }
  }

  func testEOLContext() {
    let stringLiteral = Parse {
      "\""
      Many(into: "") {
        $0.append(contentsOf: $1)
      } element: {
        OneOf {
          Prefix(1...) { $0 != "\"" && $0 >= " " }.map(String.init)
          Parse {
            "\\"
            OneOf {
              "\n".map { "\n" }
              "\r".map { "\r" }
              "\t".map { "\t" }
            }
          }
        }
      } terminator: {
        "\""
      }
    }

    XCTAssertThrowsError(
      try stringLiteral.parse(
        """
        "Hello
        world"
        """
      )
    ) { error in
      XCTAssertEqual(
        #"""
        error: multiple failures occurred

        error: unexpected input
         --> input:1:7
        1 | "Hello
          |       ^ expected 1 element satisfying predicate

        error: unexpected input
         --> input:1:7
        1 | "Hello
          |       ^ expected "\\"

        error: unexpected input
         --> input:1:7
        1 | "Hello
          |       ^ expected "\""
        """#,
        "\(error)"
      )
    }
  }
}
