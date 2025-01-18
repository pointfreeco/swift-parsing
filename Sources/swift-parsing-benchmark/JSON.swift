import Benchmark
import Foundation
import Parsing

/// This benchmark shows how to create a naive JSON parser with combinators.
///
/// It is implemented according to the [spec](https://www.json.org/json-en.html).
let jsonSuite = BenchmarkSuite(name: "JSON") { suite in
  #if swift(>=5.8)
    struct JSONValue: ParserPrinter {
      enum Output: Equatable {
        case array([Self])
        case boolean(Bool)
        case float(Double)
        case integer(Int)
        case null
        case object([String: Self])
        case string(String)
      }

      var body: some ParserPrinter<Substring.UTF8View, Output> {
        Whitespace()
        OneOf {
          JSONObject().map(.case(Output.object))
          JSONArray().map(.case(Output.array))
          JSONString().map(.case(Output.string))
          JSONNumber().pipe {
            OneOf {
              Rest().map(.string.lossless(Int.self)).map(.case(Output.integer))
              Rest().map(.string.lossless(Double.self)).map(.case(Output.float))
            }
          }
          Bool.parser().map(.case(Output.boolean))
          "null".utf8.map { Output.null }
        }
        Whitespace()
      }
    }

    struct EscapedSingleChar: ParserPrinter {
      var body: some ParserPrinter<Substring.UTF8View, String> {
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
        }
      }
    }

    struct UnescapedString: ParserPrinter {
      var body: some ParserPrinter<Substring.UTF8View, String> {
        Prefix(1...) { $0.isUnescapedJSONStringByte }
          .printing { output, input in
            try Prefix(output.count) { $0.isUnescapedJSONStringByte }.print(output, into: &input)
          }
          .map(.string)
      }
    }

    struct LiteralUnicodeCodePoint: ParserPrinter {
      var body: some ParserPrinter<Substring.UTF8View, UInt32> {
        "\\".utf8
        Parse {
          "u".utf8
          Prefix(4) { $0.isHexDigit }.map(.base16Int)
        }
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
            OneOf {
              // surrogate pair
              Parse(.surrogateCodePoint) {
                LiteralUnicodeCodePoint()
                  .filter((0xD800 ... 0xDBFF).contains)
                LiteralUnicodeCodePoint()
                  .filter((0xDC00 ... 0xDFFF).contains)
              }

              // single unicode scalar
              LiteralUnicodeCodePoint()
            }
            .map(.codePointToString)

            EscapedSingleChar()

            UnescapedString()
          }
        } terminator: {
          "\"".utf8
        }
      }
    }

    struct JSONNumber: ParserPrinter {
      var body: some ParserPrinter<Substring.UTF8View, Substring.UTF8View> {
        Consumed {
          Optionally { "-".utf8 }

          OneOf {
            "0".utf8
            Parse {
              Digits(1).filter { $0 != 0 }
              Digits(0...)
            }.map { _ in }
          }

          Optionally { ".".utf8; Digits(1...) }

          Optionally {
            OneOf { "e".utf8; "E".utf8 }
            Optionally { OneOf { "+".utf8; "-".utf8 } }
            Digits(1...)
          }
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

    let json = JSONValue()
    let input = #"""
      {
        "hello": true,
        "goodbye": 42.42,
        "xs": [1, "hello", null, false],
        "ys": {
          "0": 2,
          "1": "goodbye\n"
        },
        "\uD834\uDD1E": null
      }
      """#
    var jsonOutput: JSONValue.Output!
    suite.benchmark("Parser") {
      var input = input[...].utf8
      jsonOutput = try json.parse(&input)
    } tearDown: {
      precondition(
        jsonOutput
          == .object([
            "hello": .boolean(true),
            "goodbye": .float(42.42),
            "xs": .array([.integer(1), .string("hello"), .null, .boolean(false)]),
            "ys": .object([
              "0": .integer(2),
              "1": .string("goodbye\n"),
            ]),
            "𝄞": .null,
          ])
      )
      precondition(
        try! Substring(json.print(jsonOutput))
          == """
          {\
          "goodbye":42.42,\
          "hello":true,\
          "xs":[1,"hello",null,false],\
          "ys":{"0":2,"1":"goodbye\\n"},\
          "𝄞":null\
          }
          """
      )
      precondition(try! json.parse(json.print(jsonOutput)) == jsonOutput)
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
          "xs": [1, "hello", nil, false] as [Any?],
          "ys": [
            "0": 2,
            "1": "goodbye\n",
          ] as [String: Any],
          "𝄞": NSNull(),
        ]
      )
    }
  #endif
}

private extension UTF8.CodeUnit {
  var isHexDigit: Bool {
    (.init(ascii: "0") ... .init(ascii: "9")).contains(self)
      || (.init(ascii: "A") ... .init(ascii: "F")).contains(self)
      || (.init(ascii: "a") ... .init(ascii: "f")).contains(self)
  }

  var isUnescapedJSONStringByte: Bool {
    self != .init(ascii: "\"") && self != .init(ascii: "\\") && self >= .init(ascii: " ")
  }
}

private extension Conversion where Self == AnyConversion<Substring.UTF8View, UInt32> {
  static var base16Int: Self {
    Self(
      apply: { UInt32(Substring($0), radix: 16) },
      unapply: { int in
        var utf8View = String(int, radix: 16)[...].utf8
        utf8View.prepend(contentsOf: Array("000"[...].utf8))
        return utf8View.suffix(4)
      }
    )
  }
}

private extension Conversion where Self == AnyConversion<(UInt32, UInt32), UInt32> {
  static var surrogateCodePoint: Self {
    Self(
      apply: { (h, l) in
        let a = (h - 0xD800) * 0x400
        let b = (l - 0xDC00) + 0x10000
        return a + b
      },
      unapply: { codePoint in
        let h = (codePoint - 0x10000) / 0x400 + 0xD800
        let l = (codePoint - 0x10000) % 0x400 + 0xDC00
        return (h, l)
      }
    )
  }
}

private extension Conversion where Self == AnyConversion<UInt32, String> {
  static var codePointToString: Self {
    Self(.unicodeScalar.map(.unicodeScalarView.substring.string))
  }
}

private extension Conversion where Self == AnyConversion<UInt32, UnicodeScalar> {
  static var unicodeScalar: Self {
    Self(apply: { UnicodeScalar($0) }, unapply: { UInt32($0) })
  }
}

private extension Conversion where Self == AnyConversion<UnicodeScalar, Substring.UnicodeScalarView> {
  static var unicodeScalarView: Self {
    Self(
      apply: { .init([$0]) },
      unapply: { $0.count == 1 ? $0.first : nil }
    )
  }
}
