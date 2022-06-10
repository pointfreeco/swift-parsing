import Benchmark
import Foundation
import Parsing

/// This benchmark shows how to create a naive JSON parser with combinators.
///
/// It is mostly implemented according to the [spec](https://www.json.org/json-en.html) (we take a
/// shortcut and use `Double.parser()`, which behaves accordingly).
let jsonSuite = BenchmarkSuite(name: "JSON") { suite in
  struct JSONValue: ParserPrinter {
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

    enum Output: Equatable {
      case array([Self])
      case boolean(Bool)
      case null
      case number(Double)
      case object([String: Self])
      case string(String)
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
          Prefix(1...) { $0.isUnescapedJSONStringByte }.map(.string)

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

              Prefix(4) { $0.isHexDigit }.map(.unicode)
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
      Many(into: [String: JSONValue.Output]()) { object, pair in
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
      "xs": [1, "hello", null, false],
      "ys": {
        "0": 2,
        "1": "goodbye\n"
      }
    }
    """#
  var jsonOutput: JSONValue.Output!
  suite.benchmark("Parser") {
    var input = input[...].utf8
    jsonOutput = try JSONValue().parse(&input)
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
    //      try! Substring(JSONValue().print(jsonOutput))
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
    //    precondition(try! JSONValue().parse(JSONValue().print(jsonOutput)) == jsonOutput)
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
