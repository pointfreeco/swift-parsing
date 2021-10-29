import Benchmark
import Parsing

let arithmeticSuite = BenchmarkSuite(name: "Arithmetic") { suite in
  let arithmetic = "1 + 2 * 3 / 4 - 5"

  suite.benchmark("Parser") {
    var a = arithmetic[...].utf8
    precondition(expr.parse(&a) == -2.5)
  }
}

private var expr: AnyParser<Substring.UTF8View, Double> {
  AnyParser(
    InfixOperator(associativity: .left) {
      Skip { Whitespace() }
      OneOf {
        "+".utf8.map { (+) }
        "-".utf8.map { (-) }
      }
      Skip { Whitespace() }
    } expression: {
      Lazy { term }
    }
  )
}

private let term = InfixOperator(associativity: .left) {
  Skip { Whitespace() }
  OneOf {
    "*".utf8.map { (*) }
    "/".utf8.map { (/) }
  }
  Skip { Whitespace() }
} expression: {
  factor
}

private let factor = OneOf {
  Parse {
    Skip { "(".utf8 }
    expr
    Skip { ")".utf8 }
  }
  integer
}

private let integer = Parse {
  Skip { Whitespace() }
  Double.parser()
  Skip { Whitespace() }
}
