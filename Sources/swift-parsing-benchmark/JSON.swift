import Benchmark
import Foundation
import Parsing

/// This benchmark shows how to create a naive JSON parser with combinators.
///
/// It is mostly implemented according to the [spec](https://www.json.org/json-en.html) (we take a
/// shortcut and use `Double.parser()`, which behaves accordingly).
let jsonSuite = BenchmarkSuite(name: "JSON") { suite in
  enum JSONValue: Equatable {
    case array([Self])
    case boolean(Bool)
    case null
    case number(Double)
    case object([String: Self])
    case string(String)
  }

  var json: AnyParserPrinter<Substring.UTF8View, JSONValue>!

  let unicode = ParsePrint(.unicode) {
    Prefix(4) { $0.isHexDigit }
  }

  let escape = Parse {
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

  let string = ParsePrint {
    "\"".utf8
    Many(into: "") { string, fragment in
      string.append(contentsOf: fragment)
    } iterator: { string in
      string.map(String.init).reversed().makeIterator()
    } element: {
      OneOf {
        Prefix(1...) { $0.isUnescapedJSONStringByte }.map(.string)

        escape
      }
    } terminator: {
      "\"".utf8
    }
  }

  let object = ParsePrint {
    "{".utf8
    Many(into: [String: JSONValue]()) { object, pair in
      let (name, value) = pair
      object[name] = value
    } iterator: { object in
      (object.sorted(by: { $0.key < $1.key }) as [(String, JSONValue)]).reversed().makeIterator()
    } element: {
      Whitespace()
      string
      Whitespace()
      ":".utf8
      Lazy { json! }
    } separator: {
      ",".utf8
    } terminator: {
      "}".utf8
    }
  }

  let array = ParsePrint {
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
    Whitespace()
    OneOf {
      object.map(.case(JSONValue.object))
      array.map(.case(JSONValue.array))
      string.map(.case(JSONValue.string))
      Double.parser().map(.case(JSONValue.number))
      Bool.parser().map(.case(JSONValue.boolean))
      "null".utf8.map { JSONValue.null }
    }
    Whitespace()
  }
  .eraseToAnyParserPrinter()

  let input = #"""
    {
      "hello": true,
      "goodbye": 42.42,
      "whatever": null,
      "xs": [1, "hello", null, false],
      "ys": {
        "0": 2,
        "1": "goodbye\n"
      }
    }
    """#
  var jsonOutput: JSONValue!
  suite.benchmark("Parser") {
    var input = input[...].utf8
    jsonOutput = try json.parse(&input)
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
            "1": .string("goodbye\n"),
          ]),
        ])
    )
    //    precondition(
    //      try! Substring(json.print(jsonOutput))
    //        == """
    //        {\
    //        "goodbye":42.42,\
    //        "hello":true,\
    //        "whatever":null,\
    //        "xs":[1.0,"hello",null,false],\
    //        "ys":{"0":2.0,"1":"goodbye\\n"}\
    //        }
    //        """
    //    )
    //    precondition(try! json.parse(json.print(jsonOutput)) == jsonOutput)
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
          "1": "goodbye\n",
        ],
      ]
    )
  }
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
