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

//  func testJSON() {
//    enum JSONValue: Equatable {
//      case array([Self])
//      case boolean(Bool)
//      case null
//      case number(Double)
//      case object([String: Self])
//      case string(String)
//    }
//
//    var json: AnyParserPrinter<Substring.UTF8View, JSONValue>!
//
//    let string = ParsePrint {
//      "\"".utf8
//      Many(into: "") { string, fragment in
//        string.append(contentsOf: fragment)
//      } iterator: { string in
//        string.map(String.init).reversed().makeIterator()
//      } element: {
//        OneOf {
//          Prefix(1...) {
//            $0 != .init(ascii: "\"") && $0 != .init(ascii: "\\") && $0 >= .init(ascii: " ")
//          }
//          .map(.string)
//
//          Parse {
//            "\\".utf8
//
//            OneOf {
//              "\"".utf8.map { "\"" }
//              "\\".utf8.map { "\\" }
//              "/".utf8.map { "/" }
//              "b".utf8.map { "\u{8}" }
//              "f".utf8.map { "\u{c}" }
//              "n".utf8.map { "\n" }
//              "r".utf8.map { "\r" }
//              "t".utf8.map { "\t" }
//
//              Prefix(4) { $0.isHexDigit }.map(.unicode)
//            }
//          }
//        }
//      } terminator: {
//        "\"".utf8
//      }
//    }
//
//    let object = ParsePrint {
//      "{".utf8
//      Many(into: [String: JSONValue]()) { object, pair in
//        let (name, value) = pair
//        object[name] = value
//      } iterator: { object in
//        (object.sorted(by: { $0.key < $1.key }) as [(String, JSONValue)]).reversed().makeIterator()
//      } element: {
//        Whitespace()
//        string
//        Whitespace()
//        ":".utf8
//        Lazy { json! }
//      } separator: {
//        ",".utf8
//      } terminator: {
//        "}".utf8
//      }
//    }
//
//    let array = ParsePrint {
//      "[".utf8
//      Many {
//        Lazy { json! }
//      } separator: {
//        ",".utf8
//      } terminator: {
//        "]".utf8
//      }
//    }
//
//    json = .init(
//      ParsePrint {
//        Whitespace()
//        OneOf {
//          object.map(.case(JSONValue.object))
//          array.map(.case(JSONValue.array))
//          string.map(.case(JSONValue.string))
//          Double.parser().map(.case(JSONValue.number))
//          Bool.parser().map(.case(JSONValue.boolean))
//          "null".utf8.map { JSONValue.null }
//        }
//        Whitespace()
//      }
//    )
//
//    let input = #"""
//      {
//        "hello": true,
//        "goodbye": 42.42,
//        "whatever": null,
//        "xs": [1, "hello, null, false],
//        "ys": {
//          "0": 2,
//          "1": "goodbye"
//        }
//      }
//      """#
//
//    XCTAssertThrowsError(try json.parse(input)) { error in
//      XCTAssertEqual(
//        #"""
//        error: multiple failures occurred
//
//        error: unexpected input
//         --> input:5:34
//        5 | …hello, null, false],
//          |                      ^ expected 1 element satisfying predicate
//          |                      ^ expected "\\"
//          |                      ^ expected "\""
//
//        error: unexpected input
//         --> input:5:13
//        5 |   "xs": [1, "hello, null, false],
//          |             ^ expected "{"
//          |             ^ expected "["
//          |             ^ expected double
//          |             ^ expected "true" or "false"
//          |             ^ expected "null"
//
//        error: unexpected input
//         --> input:5:11
//        5 |   "xs": [1, "hello, null, false],
//          |           ^ expected "]"
//
//        error: unexpected input
//         --> input:5:9
//        5 |   "xs": [1, "hello, null, false],
//          |         ^ expected "{"
//          |         ^ expected "\""
//          |         ^ expected double
//          |         ^ expected "true" or "false"
//          |         ^ expected "null"
//
//        error: unexpected input
//         --> input:4:19
//        4 |   "whatever": null,
//          |                   ^ expected "}"
//
//        error: unexpected input
//         --> input:1:1
//        1 | {
//          | ^ expected "["
//          | ^ expected "\""
//          | ^ expected double
//          | ^ expected "true" or "false"
//          | ^ expected "null"
//        """#,
//        "\(error)"
//      )
//    }
//  }
}

extension UTF8.CodeUnit {
  fileprivate var isHexDigit: Bool {
    (.init(ascii: "0") ... .init(ascii: "9")).contains(self)
      || (.init(ascii: "A") ... .init(ascii: "F")).contains(self)
      || (.init(ascii: "a") ... .init(ascii: "f")).contains(self)
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
