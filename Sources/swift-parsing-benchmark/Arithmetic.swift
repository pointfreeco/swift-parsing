import Benchmark
import Foundation
import Parsing

/// This benchmark demonstrates how to parse a recursive grammar: arithmetic.
let arithmeticSuite = BenchmarkSuite(name: "Arithmetic") { suite in
  struct AdditionAndSubtraction: Parser {
    func parse(_ input: inout Substring.UTF8View) -> Double? {
      InfixOperator(associativity: .left) {
        OneOf {
          "+".utf8.map { (+) }
          "-".utf8.map { (-) }
        }
      } lowerThan: {
        MultiplicationAndDivision()
      }
      .parse(&input)
    }
  }

  struct MultiplicationAndDivision: Parser {
    func parse(_ input: inout Substring.UTF8View) -> Double? {
      InfixOperator(associativity: .left) {
        OneOf {
          "*".utf8.map { (*) }
          "/".utf8.map { (/) }
        }
      } lowerThan: {
        Exponent()
      }
      .parse(&input)
    }
  }

  struct Exponent: Parser {
    func parse(_ input: inout Substring.UTF8View) -> Double? {
      InfixOperator(associativity: .left) {
        "^".utf8.map { pow }
      } lowerThan: {
        Factor()
      }
      .parse(&input)
    }
  }

  struct Factor: Parser {
    func parse(_ input: inout Substring.UTF8View) -> Double? {
      OneOf {
        Parse {
          "(".utf8
          AdditionAndSubtraction()
          ")".utf8
        }

        Double.parser()
      }
      .parse(&input)
    }
  }

  let input = "1+2*3/4-5^2"
  var output: Double!
  suite.benchmark("Parser") {
    var input = input[...].utf8
    output = AdditionAndSubtraction().parse(&input)
  } tearDown: {
    precondition(output == -22.5)
  }
}

public struct InfixOperator<Operator, Operand>: Parser
where
  Operator: Parser,
  Operand: Parser,
  Operator.Input == Operand.Input,
  Operator.Output == (Operand.Output, Operand.Output) -> Operand.Output
{
  public let `associativity`: Associativity
  public let operand: Operand
  public let `operator`: Operator

  @inlinable
  public init(
    associativity: Associativity,
    @ParserBuilder _ operator: () -> Operator,
    @ParserBuilder lowerThan operand: () -> Operand  // Should this be called `precedes operand:`?
  ) {
    self.associativity = `associativity`
    self.operand = operand()
    self.operator = `operator`()
  }

  @inlinable
  public func parse(_ input: inout Operand.Input) -> Operand.Output? {
    switch associativity {
    case .left:
      guard var lhs = self.operand.parse(&input) else { return nil }
      var rest = input
      while let operation = self.operator.parse(&input),
        let rhs = self.operand.parse(&input)
      {
        rest = input
        lhs = operation(lhs, rhs)
      }
      input = rest
      return lhs
    case .right:
      var lhs: [(Operand.Output, Operator.Output)] = []
      while true {
        guard let rhs = self.operand.parse(&input)
        else { break }
        guard let operation = self.operator.parse(&input)
        else {
          return lhs.reversed().reduce(rhs) { rhs, pair in
            let (lhs, operation) = pair
            return operation(lhs, rhs)
          }
        }
        lhs.append((rhs, operation))
      }
      return nil
    }
  }
}

public enum Associativity {
  case left
  case right
}
