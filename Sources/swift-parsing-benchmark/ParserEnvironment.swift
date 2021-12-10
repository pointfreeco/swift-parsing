import Benchmark
import Foundation
import Parsing

let intParser = Int.parser()
struct IntParserWithEnvironment: Parser {
  @ParserEnvironment(\.skipSpaces) var skipSpaces
  func parse(_ input: inout Substring) -> Int? {
    intParser.parse(&input)
  }
}

let parserEnvironmentSuite = BenchmarkSuite(name: "Parser Environment") { suite in
  suite.benchmark("Using Environment") {
    var input = "123"[...]
    precondition(IntParserWithEnvironment().parse(&input) == 123)
  }

  suite.benchmark("Using Environment and modifier") {
    var input = "123"[...]
    precondition(
      IntParserWithEnvironment()
        .skipSpaces()
        .parse(&input)
      == 123
    )
  }

  suite.benchmark("Without Environment") {
    var input = "123"[...]
    precondition(Int.parser().parse(&input) == 123)
  }

  suite.benchmark("Without Environment and modifier") {
    var input = "123"[...]
    precondition(
      Int.parser()
        .skipSpaces()
        .parse(&input)
      == 123
    )
  }

}
