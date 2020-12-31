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

private typealias Input = Slice<UnsafeBufferPointer<UInt8>>

private var json: AnyParser<Input, JSON> {
  Skip(Whitespace())
    .take(
      object
        .orElse(array)
        .orElse(string)
        .orElse(number)
        .orElse(boolean)
        .orElse(null)
    )
    .skip(Whitespace())
    .eraseToAnyParser()
}

// MARK: Object

private let object = Skip(StartsWith("{".utf8))
  .take(
    Many(
      Skip(Whitespace())
        .take(stringLiteral)
        .skip(Whitespace())
        .skip(StartsWith(":".utf8))
        .take(Lazy { json }),
      into: [:],
      separator: StartsWith(",".utf8).skip(Whitespace())
    ) { object, pair in
      let (name, value) = pair
      object[name] = value
    }
  )
  .skip(StartsWith("}".utf8))
  .map(JSON.object)

// MARK: Array

private let array = StartsWith("[".utf8)
  .take(
    Many(
      Lazy { json },
      separator: StartsWith(",".utf8)
    )
  )
  .skip(StartsWith("]".utf8))
  .map(JSON.array)

// MARK: String

private let unicode = Prefix<Input>(4) {
  (.init(ascii: "0") ... .init(ascii: "9")).contains($0)
    || (.init(ascii: "A") ... .init(ascii: "F")).contains($0)
    || (.init(ascii: "a") ... .init(ascii: "f")).contains($0)
}
.compactMap {
  UInt32(String(decoding: $0, as: UTF8.self), radix: 16)
    .flatMap(UnicodeScalar.init)
    .map(Character.init)
}

private let escape = StartsWith<Input>(#"\"#.utf8)
  .take(
    StartsWith("\"".utf8).map { "\"" }
      .orElse(StartsWith(#"\"#.utf8).map { #"\"# })
      .orElse(StartsWith("/".utf8).map { "/" })
      .orElse(StartsWith("b".utf8).map { "\u{8}" })
      .orElse(StartsWith("f".utf8).map { "\u{c}" })
      .orElse(StartsWith("n".utf8).map { "\n" })
      .orElse(StartsWith("r".utf8).map { "\r" })
      .orElse(StartsWith("t".utf8).map { "\t" })
      .orElse(unicode)
  )

private let literal = Prefix<Input>(1...) {
  $0 != .init(ascii: "\"") && $0 != .init(ascii: #"\"#)
}
.map { String(decoding: $0, as: UTF8.self) }

private enum StringFragment {
  case escape(Character)
  case literal(String)
}

private let fragment = literal.map(StringFragment.literal)
  .orElse(escape.map(StringFragment.escape))

private let stringLiteral = StartsWith("\"".utf8)
  .take(
    Many(fragment, into: "") {
      switch $1 {
      case let .escape(character):
        $0.append(character)
      case let .literal(string):
        $0.append(contentsOf: string)
      }
    }
  )
  .skip(StartsWith("\"".utf8))

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

private let null = StartsWith<Input>("null".utf8)
  .map { _ in JSON.null }

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
