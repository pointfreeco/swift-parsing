import Benchmark
import Foundation
import Parsing

/**
 This benchmark shows how to create a naive JSON parser with combinators.

 It is mostly implemented according to the [spec](https://www.json.org/json-en.html) (we take a
 shortcut and use `Double.parser()`, which behaves accordingly).
 */
let jsonSuite = BenchmarkSuite(name: "JSON") { suite in
  enum JSONValue: Equatable {
    indirect case array([JSONValue])
    case boolean(Bool)
    case null
    case number(Double)
    indirect case object([String: JSONValue])
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
      .map(Character.init)
  }

  let escape = Parse {
    "\\".utf8

    OneOf {
      "\"".utf8.map { "\"" as Character }
      "\\".utf8.map { "\\" as Character }
      "/".utf8.map { "/" as Character }
      "b".utf8.map { "\u{8}" as Character }
      "f".utf8.map { "\u{c}" as Character }
      "n".utf8.map { "\n" as Character }
      "r".utf8.map { "\r" as Character }
      "t".utf8.map { "\t" as Character }
      unicode
    }
  }

  let literal = Prefix(1...) {
    $0 != .init(ascii: "\"") && $0 != .init(ascii: "\\")
  }
  .map { String(Substring($0)) }

  enum StringFragment {
    case escape(Character)
    case literal(String)
  }

  let fragment = OneOf {
    literal.map(StringFragment.literal)
    escape.map(StringFragment.escape)
  }

  let stringLiteral = Parse {
    "\"".utf8
    Many(into: "") { string, fragment in
      switch fragment {
      case let .escape(character):
        string.append(character)
      case let .literal(other):
        string.append(contentsOf: other)
      }
    } element: {
      fragment
    }
    "\"".utf8
  }

  let string = Parse(JSONValue.string) {
    stringLiteral
  }

  let number = Parse(JSONValue.number) {
    Double.parser(of: Substring.UTF8View.self)
  }

  let boolean = Parse(JSONValue.boolean) {
    Bool.parser(of: Substring.UTF8View.self)
  }

  let null = Parse(JSONValue.null) {
    "null".utf8
  }

  let object = Parse(JSONValue.object) {
    "{".utf8
    Many(into: [String: JSONValue]()) { object, pair in
      let (name, value) = pair
      object[name] = value
    } element: {
      Skip {
        Whitespace()
      }
      stringLiteral
      Skip {
        Whitespace()
      }
      ":".utf8
      Lazy {
        json!
      }
    } separator: {
      ",".utf8
      Skip {
        Whitespace()
      }
    }
    "}".utf8
  }

  let array = Parse(JSONValue.array) {
    "[".utf8
    Many {
      Lazy {
        json!
      }
    } separator: {
      ",".utf8
    }
    "]".utf8
  }

  json = Parse {
    Skip {
      Whitespace()
    }

    OneOf {
      object
      array
      string
      number
      boolean
      null
    }

    Skip {
      Whitespace()
    }
  }
  .eraseToAnyParser()

  let input = #"""
    {
      "hello": true,
      "goodbye": 42.42,
      "whatever": null,
      "xs": [1, "hello", null, false],
      "ys": {
        "0": 2,
        "1": "goodbye"
      }
    }
    """#
  var jsonOutput: JSONValue!
  suite.benchmark("Parser") {
    var input = input[...].utf8
    jsonOutput = json.parse(&input)
  } tearDown: {
    precondition(
      jsonOutput
      == .object([
        "hello": .boolean(true),
        "goodbye": .number(42.42),
        "whatever": .null,
        "xs": .array([.number(1), .string("hello"), .null, .boolean(false)]),
        "ys": .object([
          "0": .number(2),
          "1": .string("goodbye"),
        ]),
      ])
    )
  }

  let dataInput = Data(input.utf8)
  var objectOutput: Any!
  suite.benchmark("JSONSerialization") {
    objectOutput = try JSONSerialization.jsonObject(with: dataInput, options: [])
  } tearDown: {
    precondition(
      (objectOutput as! NSDictionary) == [
        "hello": true,
        "goodbye": 42.42,
        "whatever": NSNull(),
        "xs": [1, "hello", nil, false],
        "ys": [
          "0": 2,
          "1": "goodbye",
        ],
      ]
    )
  }
}
