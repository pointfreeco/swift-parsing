import Parsing
import XCTest

final class OneOfTests: XCTestCase {
  func testOneOfFirstSuccess() {
    var input = "New York, Hello!"[...]
    XCTAssertNoThrow(
      try OneOf {
        "New York"
        "Berlin"
      }
      .parse(&input)
    )
    XCTAssertEqual(", Hello!", Substring(input))
  }

  func testOneOfSecondSuccess() {
    var input = "Berlin, Hello!"[...]
    XCTAssertNoThrow(
      try OneOf {
        "New York"
        "Berlin"
      }
      .parse(&input)
    )
    XCTAssertEqual(", Hello!", Substring(input))
  }

  func testOneOfFailure() {
    var input = "London, Hello!"[...]
    XCTAssertThrowsError(
      try OneOf {
        "New York"
        "Berlin"
      }
      .parse(&input)
    ) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | London, Hello!
          | ^ expected "New York"
          | ^ expected "Berlin"
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("London, Hello!", Substring(input))
  }

  func testOneOfManyFirstSuccess() {
    var input = "New York, Hello!"[...]
    XCTAssertNoThrow(
      try OneOf {
        for city in ["New York", "Berlin"] {
          city
        }
      }
      .parse(&input)
    )
    XCTAssertEqual(", Hello!", Substring(input))
  }

  func testOneOfManyLastSuccess() {
    var input = "Berlin, Hello!"[...]
    XCTAssertNoThrow(
      try OneOf {
        for city in ["New York", "Berlin"] {
          city
        }
      }
      .parse(&input)
    )
    XCTAssertEqual(", Hello!", Substring(input))
  }

  func testOneOfManyFailure() {
    var input = "London, Hello!"[...]
    XCTAssertThrowsError(
      try OneOf {
        "New York"
        "Berlin"
      }
      .parse(&input)
    ) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | London, Hello!
          | ^ expected "New York"
          | ^ expected "Berlin"
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("London, Hello!", Substring(input))
  }

  func testRanking() {
    XCTAssertThrowsError(
      try OneOf {
        Int.parser()
        Prefix(2).compactMap { _ in Int?.none }
      }
      .parse("Hello"[...].utf8)
    ) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: failed to process "Int" from "He"
         --> input:1:1-2
        1 | Hello
          | ^^

        error: unexpected input
         --> input:1:1
        1 | Hello
          | ^ expected integer
        """,
        "\(error)"
      )
    }
  }

  func testRanking_2() {
    XCTAssertThrowsError(
      try OneOf {
        Int.parser()
        Prefix(2).compactMap { _ in Int?.none }
      }
      .parse("Hello")
    ) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: failed to process "Int" from "He"
         --> input:1:1-2
        1 | Hello
          | ^^

        error: unexpected input
         --> input:1:1
        1 | Hello
          | ^ expected integer
        """,
        "\(error)"
      )
    }
  }

  func testJSON() {
    enum JSONValue: Equatable {
      case array([Self])
      case boolean(Bool)
      case null
      case number(Double)
      case object([String: Self])
      case string(String)
    }

    var json: AnyParser<Substring.UTF8View, JSONValue>!

    let unicode = Prefix(4) {
      (.init(ascii: "0") ... .init(ascii: "9")).contains($0)
        || (.init(ascii: "A") ... .init(ascii: "F")).contains($0)
        || (.init(ascii: "a") ... .init(ascii: "f")).contains($0)
    }
    .compactMap {
      UInt32(Substring($0), radix: 16)
        .flatMap(UnicodeScalar.init)
        .map(String.init)
    }

    let string = Parse {
      "\"".utf8
      Many(into: "") { string, fragment in
        string.append(contentsOf: fragment)
      } element: {
        OneOf {
          Prefix(1...) { $0 != .init(ascii: "\"") && $0 != .init(ascii: "\\") }
            .map { String(Substring($0)) }

          Parse {
            "\\".utf8

            OneOf {
              "\"".utf8.map { "\"" }
              "\\".utf8.map { "\\" }
              "/".utf8.map { "/" }
              "b".utf8.map { "\u{8}" }
              "f".utf8.map { "\u{c}" }
              "n".utf8.map { "\n" }
              "r".utf8.map { "\r" }
              "t".utf8.map { "\t" }
              unicode
            }
          }
        }
      } terminator: {
        "\"".utf8
      }
    }

    let object = Parse {
      "{".utf8
      Many(into: [String: JSONValue]()) { object, pair in
        let (name, value) = pair
        object[name] = value
      } element: {
        Skip { Whitespace() }
        string
        Skip { Whitespace() }
        ":".utf8
        Lazy { json! }
      } separator: {
        ",".utf8
      } terminator: {
        "}".utf8
      }
    }

    let array = Parse {
      "[".utf8
      Many {
        Lazy { json! }
      } separator: {
        ",".utf8
      } terminator: {
        "]".utf8
      }
    }

    json = Parse {
      Skip { Whitespace() }
      OneOf {
        object.map(JSONValue.object)
        array.map(JSONValue.array)
        string.map(JSONValue.string)
        Double.parser().map(JSONValue.number)
        Bool.parser().map(JSONValue.boolean)
        "null".utf8.map { JSONValue.null }
      }
      Skip { Whitespace() }
    }
    .eraseToAnyParser()

    let input = #"""
      {
        "hello": true,
        "goodbye": 42.42,
        "whatever": null,
        "xs": [1, "hello, null, false],
        "ys": {
          "0": 2,
          "1": "goodbye"
        }
      }
      """#

    XCTAssertThrowsError(try json.parse(input)) { error in
      XCTAssertEqual(
        #"""
        error: multiple failures occurred

        error: unexpected input
         --> input:6:4
        6 |   "ys": {
          |    ^ expected ","
          |    ^ expected "]"

        error: unexpected input
         --> input:5:9
        5 |   "xs": [1, "hello, null, false],
          |         ^ expected "{"
          |         ^ expected "\""
          |         ^ expected double
          |         ^ expected "true" or "false"
          |         ^ expected "null"

        error: unexpected input
         --> input:4:19
        4 |   "whatever": null,
          |                   ^ expected "}"

        error: unexpected input
         --> input:1:1
        1 | {
          | ^ expected "["
          | ^ expected "\""
          | ^ expected double
          | ^ expected "true" or "false"
          | ^ expected "null"
        """#,
        "\(error)"
      )
    }
  }

  func testNormalization() {
    enum City {
      case losAngeles
      case newYork
      case sanJose
    }
    
    let city = OneOf {
      "Los Angeles".utf8.map { City.losAngeles }
      "New York".utf8.map { City.newYork }
      "San Jos\u{00E9}".utf8.map { City.sanJose }
    }

    XCTAssertThrowsError(try city.parse("San Jose\u{0301}")) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | San José
          | ^ expected "Los Angeles"
          | ^ expected "New York"
          | ^ expected "San José"
        """,
        "\(error)"
      )
    }
  }

  func testFailure1() throws {
    let accountingNumber = OneOf {
      Int.parser(isSigned: false)

      Parse {
        "("
        Int.parser(isSigned: false)
        ")"
      }
      .map { -$0 }
    }

    _ = try accountingNumber.parse("100")
    _ = try accountingNumber.parse("(100)")

    XCTAssertThrowsError(try accountingNumber.parse("(100]")) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:5
        1 | (100]
          |     ^ expected ")"

        error: unexpected input
         --> input:1:1
        1 | (100]
          | ^ expected integer
        """,
        "\(error)"
      )
    }
  }
}
