import Benchmark
import Foundation
import Parsing

/// This benchmarks the performance of `PrefixUntil` against `PrefixUpTo` for simple parsing.
let prefixUntilSuite = BenchmarkSuite(name: "PrefixUntil") { suite in
  let input = String(repeating: ".", count: 10_000) + "Hello, world!"

  do {
    var output: Substring!
    suite.benchmark("PrefixUpTo") {
      var input = input[...]
      output = try PrefixUpTo("Hello").parse(&input)
    } tearDown: {
      precondition(output.count == 10_000)
    }
  }

  do {
    var output: Substring!
    suite.benchmark("PrefixUntil / FastPath") {
      var input = input[...]
      output = try PrefixUntil("H") { "Hello" }.parse(&input)
    } tearDown: {
      precondition(output.count == 10_000)
    }
  }

  do {
    var output: Substring!
    suite.benchmark("PrefixUntil / SlowPath") {
      var input = input[...]
      output = try PrefixUntil { "Hello" }.parse(&input)
    } tearDown: {
      precondition(output.count == 10_000)
    }
  }

  struct Attribute: Equatable {
    public let at1: Int
    public let at2: Int?
  }

  struct ParsedText: Equatable {
    var attribute: Attribute?
    var text: String
  }

  do {
    var output: [ParsedText]!
    suite.benchmark("PrefixUntil / FastPath / Complex") {
      
      let fontModifier = Parse {
        "|"
        Int.parser()
        Optionally {
          ":"
          Int.parser()
        }
        "🌶"
      }.map { Attribute(at1: $0.0, at2: $0.1) }

      let textWithAttributes = Parse {
        Peek { Prefix<Substring>(1) }
        Optionally { fontModifier }
        Optionally { PrefixUntil("|") { fontModifier }.map(String.init) }
      }.map { ParsedText(attribute: $0.0, text: $0.1 ?? "") }

      let mainParser = Many(1...) {
        textWithAttributes
      }
      var input = String(repeating: ".", count: 10_000) + "|36🌶INFO|0🌶|08:45:33| |33:1🌶ci runs in Secret Filtering mode|0🌶 "
      var complexInput = input[...]
      output = try mainParser.parse(&complexInput)
    } tearDown: {
      precondition(ParsedText(attribute: Attribute(at1: 36, at2: nil), text: "INFO") == output[1])
      precondition(ParsedText(attribute: Attribute(at1: 0, at2: nil), text: "|08:45:33| ") == output[2])
      precondition(ParsedText(attribute: Attribute(at1: 33, at2: 1), text: "ci runs in Secret Filtering mode") == output[3])
      precondition(ParsedText(attribute: Attribute(at1: 0, at2: nil), text: " ") == output[4])
    }
  }


  do {
    var output: [ParsedText]!
    suite.benchmark("PrefixUntil / SlowPath / Complex") {
      
      let fontModifier = Parse {
        "|"
        Int.parser()
        Optionally {
          ":"
          Int.parser()
        }
        "🌶"
      }.map { Attribute(at1: $0.0, at2: $0.1) }

      let textWithAttributes = Parse {
        Peek { Prefix<Substring>(1) }
        Optionally { fontModifier }
        Optionally { PrefixUntil { fontModifier }.map(String.init) }
      }.map { ParsedText(attribute: $0.0, text: $0.1 ?? "") }

      let mainParser = Many(1...) {
        textWithAttributes
      }
      var input = String(repeating: ".", count: 10_000) + "|36🌶INFO|0🌶|08:45:33| |33:1🌶ci runs in Secret Filtering mode|0🌶 "
      var complexInput = input[...]
      output = try mainParser.parse(&complexInput)
    } tearDown: {
      precondition(ParsedText(attribute: Attribute(at1: 36, at2: nil), text: "INFO") == output[1])
      precondition(ParsedText(attribute: Attribute(at1: 0, at2: nil), text: "|08:45:33| ") == output[2])
      precondition(ParsedText(attribute: Attribute(at1: 33, at2: 1), text: "ci runs in Secret Filtering mode") == output[3])
      precondition(ParsedText(attribute: Attribute(at1: 0, at2: nil), text: " ") == output[4])
    }
  }
}
