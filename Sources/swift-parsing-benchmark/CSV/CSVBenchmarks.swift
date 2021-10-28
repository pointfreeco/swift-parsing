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

private typealias Input = Substring.UTF8View

private let plainField = Prefix<Input> {
  $0 != .init(ascii: ",") && $0 != .init(ascii: "\n")
}

private let quotedField = Parse {
  "\"".utf8
  Prefix { $0 != .init(ascii: "\"") }
  "\"".utf8
}

private let field = OneOf {
  quotedField
  plainField
}
.map { String(decoding: $0, as: UTF8.self) }

private let line = Many {
  field
} separatedBy: {
  ",".utf8
}

private let csv = Many {
  line
} separatedBy: {
  "\n".utf8
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
