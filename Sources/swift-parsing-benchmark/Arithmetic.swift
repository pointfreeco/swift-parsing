import Benchmark
import Parsing

let arithmeticSuite = BenchmarkSuite(name: "Arithmetic") { suite in
  let arithmetic = "1 + 2 * 3 / 4 - 5"

  suite.benchmark("Parser") {
    var a = arithmetic[...].utf8
    precondition(expr.parse(&a) == -3)
  }
}

private var expr: AnyParser<Substring.UTF8View, Int> {
  AnyParser(
    InfixLeft {
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

private let term = InfixLeft {
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
  natural
}

private let natural = Parse {
  Skip { Whitespace() }
  Int.parser()
  Skip { Whitespace() }
}

/*
 TODO: Should this be:

 InfixOperator(associativity: .left) {
   OneOf {
     "+".map(+)
     "-".map(-)
   }
 } expression {
   Lazy { term }
 }
 */
private struct InfixLeft<Operator, Expression>: Parser
where
  Operator: Parser,
  Expression: Parser,
  Operator.Input == Expression.Input,
  Operator.Output == (Expression.Output, Expression.Output) -> Expression.Output
{
  let expression: Expression
  let `operator`: Operator

  @inlinable
  init(
    @ParserBuilder _ operator: () -> Operator,
    @ParserBuilder expression: () -> Expression
  ) {
    self.expression = expression()
    self.operator = `operator`()
  }

  @inlinable
  func parse(_ input: inout Expression.Input) -> Expression.Output? {
    guard var lhs = self.expression.parse(&input) else { return nil }
    while
      let operation = self.operator.parse(&input),
      let rhs = self.expression.parse(&input)
    {
      lhs = operation(lhs, rhs)
    }
    return lhs
  }
}
