import Benchmark
import Foundation
import Parsing

let intParser = Int.parser()
struct IntParserWithEnvironment: Parser {
  @ParserEnvironment(\.maximum) var maximum
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
        .maximum(100)
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
      Many(Int.parser())
        .minimum(1)
        .maximum(10)
        .parse(&input)
      == [123]
    )
  }
}
