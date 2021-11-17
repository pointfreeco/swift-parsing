import Benchmark
import Foundation
import Parsing

//name                        time           std        iterations
//----------------------------------------------------------------
//CSV.Parser                  1884886.500 ns ±  13.14 %        694
//CSV.Ad hoc mutating methods 1229682.000 ns ±  12.79 %       1069

// MARK: - Parser

private struct CSV: Parser {
  func parse(_ input: inout Substring.UTF8View) -> [[String]]? {
    let plainField = Prefix {
      $0 != .init(ascii: ",") && $0 != .init(ascii: "\n")
    }

    let quotedField = "\"".utf8
      .take(Prefix { $0 != .init(ascii: "\"") })
      .skip("\"".utf8)

    let field = quotedField.orElse(plainField)
      .map { String(Substring($0)) }

    let line = Many(field, separator: ",".utf8)

    let csv = Many(line, separator: "\n".utf8)

    return csv.parse(&input)
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

// MARK: - Suite

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
