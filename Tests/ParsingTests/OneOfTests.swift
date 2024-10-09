import Parsing
import XCTest

final class OneOfTests: XCTestCase {
  func testOneOfSingleton() {
    var input = "AB"[...]
    XCTAssertThrowsError(
      try Parse(input: Substring.self) { OneOf { Prefix(2) { $0 == "A" } } }
        .parse(&input)
    )
    XCTAssertEqual("B", Substring(input))
  }

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

  func testOneOfManyLastPartialFailure() {
    var input = "Berkeley, Hello!"[...]
    XCTAssertThrowsError(
      try OneOf {
        for parser in [
          Parse {
            "New "
            "York"
          },
          Parse {
            "Ber"
            "lin"
          },
        ] {
          parser
        }
      }
      .parse(&input)
    ) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:4
        1 | Berkeley, Hello!
          |    ^ expected "lin"

        error: unexpected input
         --> input:1:1
        1 | Berkeley, Hello!
          | ^ expected "New "
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("keley, Hello!", Substring(input))
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
    struct IntParser: Parser {
      var body: some Parser<Substring.UTF8View, Int> {
        OneOf {
          Int.parser()
          Prefix(2).compactMap { _ in Int?.none }
        }
      }
    }

    XCTAssertThrowsError(
      try IntParser().parse("Hello"[...].utf8)
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
      try Parse(input: Substring.UTF8View.self) {
        OneOf {
          Int.parser()
          Prefix(2).compactMap { _ in Int?.none }
        }
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

  #if swift(>=5.8)
    func testJSON() {
      struct JSONValue: ParserPrinter {
        enum Output: Equatable {
          case array([Self])
          case boolean(Bool)
          case null
          case number(Double)
          case object([String: Self])
          case string(String)
        }

        var body: some ParserPrinter<Substring.UTF8View, Output> {
          Whitespace()
          OneOf {
            JSONObject().map(.case(Output.object))
            JSONArray().map(.case(Output.array))
            JSONString().map(.case(Output.string))
            Double.parser().map(.case(Output.number))
            Bool.parser().map(.case(Output.boolean))
            "null".utf8.map { Output.null }
          }
          Whitespace()
        }
      }

      struct JSONString: ParserPrinter {
        var body: some ParserPrinter<Substring.UTF8View, String> {
          "\"".utf8
          Many(into: "") { string, fragment in
            string.append(contentsOf: fragment)
          } decumulator: { string in
            string.map(String.init).reversed().makeIterator()
          } element: {
            OneOf {
              Prefix(1) { $0.isUnescapedJSONStringByte }.map(.string)

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
                  ParsePrint(.unicode) {
                    Prefix(4) { $0.isHexDigit }
                  }
                }
              }
            }
          } terminator: {
            "\"".utf8
          }
        }
      }

      struct JSONObject: ParserPrinter {
        var body: some ParserPrinter<Substring.UTF8View, [String: JSONValue.Output]> {
          "{".utf8
          Many(into: [String: JSONValue.Output]()) {
            (object: inout [String: JSONValue.Output], pair: (String, JSONValue.Output)) in
            let (name, value) = pair
            object[name] = value
          } decumulator: { object in
            (object.sorted(by: { $0.key < $1.key }) as [(String, JSONValue.Output)])
              .reversed()
              .makeIterator()
          } element: {
            Whitespace()
            JSONString()
            Whitespace()
            ":".utf8
            JSONValue()
          } separator: {
            ",".utf8
          } terminator: {
            "}".utf8
          }
        }
      }

      struct JSONArray: ParserPrinter {
        var body: some ParserPrinter<Substring.UTF8View, [JSONValue.Output]> {
          "[".utf8
          Many {
            JSONValue()
          } separator: {
            ",".utf8
          } terminator: {
            "]".utf8
          }
        }
      }

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

      XCTAssertThrowsError(try JSONValue().parse(input)) { error in
        XCTAssertEqual(
          #"""
          error: multiple failures occurred

          error: unexpected input
           --> input:5:34
          5 | …hello, null, false],
            |                      ^ expected 1 element satisfying predicate
            |                      ^ expected "\\"
            |                      ^ expected "\""

          error: unexpected input
           --> input:5:13
          5 |   "xs": [1, "hello, null, false],
            |             ^ expected "{"
            |             ^ expected "["
            |             ^ expected double
            |             ^ expected "true" or "false"
            |             ^ expected "null"

          error: unexpected input
           --> input:5:11
          5 |   "xs": [1, "hello, null, false],
            |           ^ expected "]"

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
  #endif
}

extension UTF8.CodeUnit {
  fileprivate var isHexDigit: Bool {
    (.init(ascii: "0") ... .init(ascii: "9")).contains(self)
      || (.init(ascii: "A") ... .init(ascii: "F")).contains(self)
      || (.init(ascii: "a") ... .init(ascii: "f")).contains(self)
  }

  fileprivate var isUnescapedJSONStringByte: Bool {
    self != .init(ascii: "\"") && self != .init(ascii: "\\") && self >= .init(ascii: " ")
  }
}

extension Conversion where Self == AnyConversion<Substring.UTF8View, String> {
  fileprivate static var unicode: Self {
    Self(
      apply: {
        UInt32(Substring($0), radix: 16)
          .flatMap(UnicodeScalar.init)
          .map(String.init)
      },
      unapply: {
        $0.unicodeScalars.first
          .map { String(UInt32($0), radix: 16)[...].utf8 }
      }
    )
  }
}
