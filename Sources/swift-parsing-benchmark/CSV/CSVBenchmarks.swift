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

private typealias Input = Slice<UnsafeBufferPointer<UTF8.CodeUnit>>

private let plainField = Prefix<Input> {
  $0 != .init(ascii: ",") && $0 != .init(ascii: "\n")
}

private let quotedField = Skip(StartsWith<Input>("\"".utf8))
  .take(Prefix { $0 != .init(ascii: "\"") })
  .skip(StartsWith("\"".utf8))

private let field = quotedField.orElse(plainField)
  .map { String(decoding: $0, as: UTF8.self) }

private let line = Many(field, separator: StartsWith(",".utf8))

private let csv = Many(line, separator: StartsWith("\n".utf8))

// MARK: - Ad hoc mutating methods

private extension Substring.UTF8View {
  mutating func parseCsv() -> [[String]] {
    var results: [[String]] = []
    while !self.isEmpty {
      results.append(self.parseLine())
    }
    return results
  }

  mutating func parseLine() -> [String] {
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

  mutating func parseField() -> String {
    if self.first == UTF8.CodeUnit(ascii: "\"") {
      return String(Substring(self.parseQuotedField()))
    } else {
      return String(Substring(self.parsePlainField()))
    }
  }

  mutating func parseQuotedField() -> Substring.UTF8View {
    self.removeFirst()
    let field = self.remove(while: { $0 != UTF8.CodeUnit(ascii: "\"") })
    self.removeFirst()
    return field
  }

  mutating func parsePlainField() -> Substring.UTF8View {
    self.remove(while: { $0 != UTF8.CodeUnit(ascii: "\n") && $0 != UTF8.CodeUnit(ascii: ",") })
  }

  mutating func remove(
    while condition: (Substring.UTF8View.Element) -> Bool
  ) -> Substring.UTF8View {
    let prefix = self.prefix(while: condition)
    self.removeFirst(prefix.count)
    return prefix
  }
}
