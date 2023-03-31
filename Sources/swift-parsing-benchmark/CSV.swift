import Benchmark
import Foundation
import Parsing

/// This benchmark demonstrates how to define a simple CSV parser with quoted fields and measures
/// its performance against more a more ad hoc approach at the same level of abstraction.
let csvSuite = BenchmarkSuite(name: "CSV") { suite in
  struct FieldParser: ParserPrinter {
    var body: some ParserPrinter<Substring.UTF8View, String> {
      OneOf {
        Parse {
          "\"".utf8
          Prefix { $0 != UInt8(ascii: "\"") }
          "\"".utf8
        }

        Prefix { $0 != UInt8(ascii: ",") && $0 != UInt8(ascii: "\n") }
      }
      .map(.string)
    }
  }

  struct LineParser: ParserPrinter {
    var body: some ParserPrinter<Substring.UTF8View, [String]> {
      Many {
        FieldParser()
      } separator: {
        ",".utf8
      }
    }
  }

  struct CSVParser: ParserPrinter {
    var body: some ParserPrinter<Substring.UTF8View, [[String]]> {
      Many {
        LineParser()
      } separator: {
        "\n".utf8
      } terminator: {
        End()
      }
    }
  }

  let expectedRowCount = 1_000
  let expectedColumnCount = 5
  var output: [[String]] = []

  let csv = CSVParser()
  suite.benchmark("Parser") {
    output = try csv.parse(csvInput)
  } tearDown: {
    precondition(output.count == expectedRowCount)
    precondition(output.allSatisfy { $0.count == expectedColumnCount })
    precondition(try! csv.parse(csv.print(output)) == output)
  }

  suite.benchmark("Ad hoc mutating methods") {
    var input = csvInput[...].utf8
    output = input.parseCsv()
  } tearDown: {
    precondition(output.count == expectedRowCount)
    precondition(output.allSatisfy { $0.count == expectedColumnCount })
  }
}

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
