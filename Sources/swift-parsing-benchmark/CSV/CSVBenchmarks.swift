import Benchmark
import Foundation
import Parsing

//name                 time           std        iterations
//---------------------------------------------------------
//CSV.Parser           1245858.500 ns ±  10.38 %       1090
//CSV.Mutating methods 1309019.000 ns ±   8.27 %       1060

let csvSuite = BenchmarkSuite(name: "CSV") { suite in
  let rowCount = 1_000
  let columnCount = 5
  var output: [[String]] = []

  let csv = CSV()
  suite.benchmark(
    name: "Parser",
    run: {
      output = csv.parse(csvInput)!
    },
    tearDown: {
      precondition(output.count == rowCount)
      precondition(output.allSatisfy { $0.count == columnCount })
    }
  )

  suite.benchmark(
    name: "Ad hoc mutating methods",
    run: {
      var input = csvInput[...].utf8
      output = input.parseCsv()
    },
    tearDown: {
      precondition(output.count == rowCount)
      precondition(output.allSatisfy { $0.count == columnCount })
    }
  )
}

// MARK: - Parser

private typealias Input = Substring.UTF8View
private protocol UTF8Parser: Parser where Input == Substring.UTF8View {}

private protocol _Parser: Parser {
  associatedtype Body: Parser
  @ParserBuilder var body: Body { get }
}

extension _Parser {
  @inlinable @inline(__always)
  func parse(_ input: inout Body.Input) -> Body.Output? {
    self.body.parse(&input)
  }
}

private struct PlainField: _Parser {
  var body: Prefix<Input> {
    Prefix { $0 != .init(ascii: ",") && $0 != .init(ascii: "\n") }
  }
}

private struct QuotedField: _Parser {
  var body: Zip3_VOV<String.UTF8View, Prefix<Input>, String.UTF8View> {
    "\"".utf8
    Prefix { $0 != .init(ascii: "\"") }
    "\"".utf8
  }
}

private struct Field: _Parser {
  var body: Parsers.Map<OneOf<OneOf2<QuotedField, PlainField>>, String> {
    OneOf {
      QuotedField()
      PlainField()
    }
    .map { String(Substring($0)) }
  }
}

private struct Line: _Parser {
  var body: Many<Field, [Field.Output], String.UTF8View> {
    Many {
      Field()
    } separator: {
      ",".utf8
    }
  }
}

private struct CSV: _Parser {
  var body: Many<Line, [Line.Output], String.UTF8View> {
    Many {
      Line()
    } separator: {
      "\n".utf8
    }
  }
}

// MARK: - Ad hoc mutating methods

extension Substring.UTF8View {
  fileprivate mutating func parseCsv() -> [[String]] {
    var results: [[String]] = []
    while !self.isEmpty {
      results.append(self.parseLine())
    }
    return results
  }

  fileprivate mutating func parseLine() -> [String] {
    var row: [String] = []
    while !self.isEmpty {
      row.append(self.parseField())

      if self.first == UTF8.CodeUnit(ascii: "\n") {
        self.removeFirst()
        break
      } else if self.first == UTF8.CodeUnit(ascii: ",") {
        self.removeFirst()
      }
    }
    return row
  }

  fileprivate mutating func parseField() -> String {
    if self.first == UTF8.CodeUnit(ascii: "\"") {
      return String(Substring(self.parseQuotedField()))
    } else {
      return String(Substring(self.parsePlainField()))
    }
  }

  fileprivate mutating func parseQuotedField() -> Substring.UTF8View {
    self.removeFirst()
    let field = self.remove(while: { $0 != UTF8.CodeUnit(ascii: "\"") })
    self.removeFirst()
    return field
  }

  fileprivate mutating func parsePlainField() -> Substring.UTF8View {
    self.remove(while: { $0 != UTF8.CodeUnit(ascii: "\n") && $0 != UTF8.CodeUnit(ascii: ",") })
  }

  fileprivate mutating func remove(
    while condition: (Substring.UTF8View.Element) -> Bool
  ) -> Substring.UTF8View {
    let prefix = self.prefix(while: condition)
    self.removeFirst(prefix.count)
    return prefix
  }
}
