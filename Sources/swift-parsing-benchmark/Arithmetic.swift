import Benchmark
import Darwin
import Parsing
import Foundation

let arithmeticSuite = BenchmarkSuite(name: "Arithmetic") { suite in
  let arithmetic = "1+2*3/4-5^2"

  suite.benchmark("Parser") {
    var arithmetic = arithmetic[...].utf8
    precondition(expression.parse(&arithmetic) == -22.5)
  }
}

private let expression: AnyParser<Substring.UTF8View, Double> = InfixOperator(
  OneOfMany(
    "+".utf8.map { (+) },
    "-".utf8.map { (-) }
  ),
  associativity: .left,
  do: term
)
.eraseToAnyParser()

private let term = InfixOperator(
  OneOfMany(
    "*".utf8.map { (*) },
    "/".utf8.map { (/) }
  ),
  associativity: .left,
  do: exponent
)

private let exponent = InfixOperator(
  "^".utf8.map { pow },
  associativity: .left,
  do: factor
)

private let factor = "(".utf8
  .take(Lazy { expression })
  .skip(")".utf8)
  .orElse(Double.parser())
