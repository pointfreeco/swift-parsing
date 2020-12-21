import Benchmark
import Foundation
import Parsing

/*
 This benchmark shows how to create a naive JSON parser with combinators.

     name                   time        std        iterations
     --------------------------------------------------------
     JSON.Parser            5500.000 ns ±  43.67 %     236332
     JSON.JSONSerialization 2325.000 ns ± 120.39 %     536604

 It is not 100% correct according to the [spec](https://www.json.org/json-en.html).
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

private let object = Skip(StartsWith("{".utf8))
  .take(
    Many(
      Skip(Whitespace())
        .take(stringLiteral)
        .skip(Whitespace())
        .skip(StartsWith(":".utf8))
        .skip(Whitespace())
        .take(Lazy { json }),
      separator: Skip(Whitespace()).skip(StartsWith(",".utf8)).skip(Whitespace())
    )
  )
  .map { JSON.object(Dictionary(uniqueKeysWithValues: $0)) }

private let array = Skip(StartsWith("[".utf8))
  .skip(Whitespace())
  .take(
    Many(
      Lazy { json },
      separator: Skip(Whitespace()).skip(StartsWith(",".utf8).skip(Whitespace()))
    )
  )
  .skip(Whitespace())
  .skip(StartsWith("]".utf8))
  .map(JSON.array)

private let stringLiteral = Skip(StartsWith<Input>("\"".utf8))
  .take(Prefix { $0 != .init(ascii: "\"") }) // FIXME: implement according to spec
  .skip(StartsWith("\"".utf8))
  .map { String(decoding: $0, as: UTF8.self) }

private let string = stringLiteral
  .map(JSON.string)

private let number = Double.parser(of: Input.self) // FIXME: implement according to spec
  .map(JSON.number)

private let boolean = Bool.parser(of: Input.self)
  .map(JSON.boolean)

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
        jsonOutput == JSON.object([
          "hello": .boolean(true),
          "goodbye": .number(42.42),
          "whatever": .null,
          "xs": .array([.number(1), .string("hello"), .null, .boolean(false)]),
          "ys": .object([
            "0": .number(2),
            "1": .string("goodbye")
          ])
        ])
      )
    }
  )

  var objectOutput: Any!
  suite.benchmark(
    name: "JSONSerialization",
    run: { objectOutput = try JSONSerialization.jsonObject(with: Data(input.utf8), options: []) },
    tearDown: {
      precondition(
        (objectOutput as! NSDictionary) == [
          "hello": true,
          "goodbye": 42.42,
          "whatever": NSNull(),
          "xs": [1, "hello", nil, false],
          "ys": [
            "0": 2,
            "1": "goodbye"
          ]
        ]
      )
    }
  )
}
