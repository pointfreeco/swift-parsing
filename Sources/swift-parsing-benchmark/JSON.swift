import Benchmark
import Foundation
import Parsing

/*
 This benchmark shows how to create a naive JSON parser with combinators.

     name                   time        std        iterations
     --------------------------------------------------------
     JSON.Parser            7453.000 ns ±  57.46 %     169185
     JSON.JSONSerialization 2700.000 ns ±  94.15 %     471544

 It is mostly implemented according to the [spec](https://www.json.org/json-en.html) (we take a
 shortcut and use `Double.parser()`, which behaves accordingly).
 */

private enum JSON: Equatable {
  indirect case array([JSON])
  case boolean(Bool)
  case null
  case number(Double)
  indirect case object([String: JSON])
  case string(String)
}

private typealias Input = Substring.UTF8View

private var json: AnyParser<Input, JSON> {
  Parse {
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
}

// MARK: Object

private let object = Parse {
  "{".utf8
  Many(into: [String: JSON]()) { object, pair in
    let (name, value) = pair
    object[name] = value
  } forEach: {
    Skip {
      Whitespace()
    }
    stringLiteral
    Skip {
      Whitespace()
    }
    ":".utf8
    Lazy {
      json
    }
  } separatedBy: {
    ",".utf8
    Skip {
      Whitespace()
    }
  }
  "}".utf8
}
.map(JSON.object)

// MARK: Array

private let array = Parse {
  "[".utf8
  Many {
    Lazy {
      json
    }
  } separatedBy: {
    ",".utf8
  }
  "]".utf8
}
.map(JSON.array)

// MARK: String

private let unicode = Prefix(4) {
  (.init(ascii: "0") ... .init(ascii: "9")).contains($0)
    || (.init(ascii: "A") ... .init(ascii: "F")).contains($0)
    || (.init(ascii: "a") ... .init(ascii: "f")).contains($0)
}
.compactMap {
  UInt32(String(decoding: $0, as: UTF8.self), radix: 16)
    .flatMap(UnicodeScalar.init)
    .map(Character.init)
}

private let escape = Parse {
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

private let literal = Prefix(1...) {
  $0 != .init(ascii: "\"") && $0 != .init(ascii: "\\")
}
.map { String(decoding: $0, as: UTF8.self) }

private enum StringFragment {
  case escape(Character)
  case literal(String)
}

private let fragment = OneOf {
  literal.map(StringFragment.literal)
  escape.map(StringFragment.escape)
}

private let stringLiteral = Parse {
  "\"".utf8
  Many(into: "") { string, fragment in
    switch fragment {
    case let .escape(character):
      string.append(character)
    case let .literal(other):
      string.append(contentsOf: other)
    }
  } forEach: {
    fragment
  }
  "\"".utf8
}

private let string =
  stringLiteral
  .map(JSON.string)

// MARK: Number

private let number = Double.parser(of: Input.self)
  .map(JSON.number)

// MARK: Boolean

private let boolean = Bool.parser(of: Input.self)
  .map(JSON.boolean)

// MARK: Null

private let null = Parse { "null".utf8 }
  .map { JSON.null }

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
  var jsonOutput: JSON!
  suite.benchmark(
    name: "Parser",
    run: { jsonOutput = json.parse(input) },
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
