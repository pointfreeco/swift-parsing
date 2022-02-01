import Benchmark
import Foundation
import Parsing

/*
 This benchmark shows how to create a naive JSON parser with combinators.

 It is mostly implemented according to the [spec](https://www.json.org/json-en.html) (we take a
 shortcut and use `Double.parser()`, which behaves accordingly).
 */

private struct JSONValue: Parser {
  func parse(_ input: inout Substring.UTF8View) -> Output? {
    Parse {
      Skip {
        Whitespace()
      }

      OneOf {
        JSONObject().map(Output.object)
        JSONArray().map(Output.array)
        JSONString().map(Output.string)
        Double.parser().map(Output.number)
        Bool.parser().map(Output.boolean)
        "null".utf8.map { Output.null }
      }

      Skip {
        Whitespace()
      }
    }
    .parse(&input)
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

private struct JSONObject: Parser {
  func parse(_ input: inout Substring.UTF8View) -> [String: JSONValue.Output]? {
    Parse {
      "{".utf8
      Many(into: Output()) { object, pair in
        let (name, value) = pair
        object[name] = value
      } element: {
        Skip {
          Whitespace()
        }
        JSONString()
        Skip {
          Whitespace()
        }
        ":".utf8
        JSONValue()
      } separator: {
        ",".utf8
        Skip {
          Whitespace()
        }
      }
      "}".utf8
    }
    .parse(&input)
  }
}

private struct JSONArray: Parser {
  func parse(_ input: inout Substring.UTF8View) -> [JSONValue.Output]? {
    Parse {
      "[".utf8
      Many {
        JSONValue()
      } separator: {
        ",".utf8
      }
      "]".utf8
    }
    .parse(&input)
  }
}

private struct JSONString: Parser {
  func parse(_ input: inout Substring.UTF8View) -> String? {
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

    enum StringFragment {
      case escape(Character)
      case literal(String)
    }

    return Parse {
      "\"".utf8
      Many(into: "") { string, fragment in
        switch fragment {
        case let .escape(character):
          string.append(character)
        case let .literal(other):
          string.append(contentsOf: other)
        }
      } element: {
        OneOf {
          Parse(StringFragment.literal) {
            Prefix(1...) { $0 != .init(ascii: "\"") && $0 != .init(ascii: "\\") }
              .map { String(Substring($0)) }
          }

          Parse(StringFragment.escape) {
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
        }
      }
      "\"".utf8
    }
    .parse(&input)
  }
}

let jsonSuite = BenchmarkSuite(name: "JSON") { suite in
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
  var jsonOutput: JSONValue.Output!
  suite.benchmark(
    name: "Parser",
    run: { jsonOutput = JSONValue().parse(input) },
    tearDown: {
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
  )

  let dataInput = Data(input.utf8)
  var objectOutput: Any!
  suite.benchmark(
    name: "JSONSerialization",
    run: { objectOutput = try JSONSerialization.jsonObject(with: dataInput, options: []) },
    tearDown: {
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
  )
}
