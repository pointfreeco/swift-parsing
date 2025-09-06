@preconcurrency import Benchmark
import Foundation
import Parsing

/// This benchmark demonstrates how to parse a recursive grammar: arithmetic.
let arithmeticSuite = BenchmarkSuite(name: "Arithmetic") { suite in
  struct AdditionAndSubtraction: Parser {
    var body: some Parser<Substring.UTF8View, Double> {
      InfixOperator(associativity: .left) {
        OneOf {
          "+".utf8.map { (+) as (Double, Double) -> Double }
          "-".utf8.map { (-) }
        }
      } lowerThan: {
        MultiplicationAndDivision()
      }
    }
  }

  struct MultiplicationAndDivision: Parser {
    var body: some Parser<Substring.UTF8View, Double> {
      InfixOperator(associativity: .left) {
        OneOf {
          "*".utf8.map { (*) as (Double, Double) -> Double }
          "/".utf8.map { (/) }
        }
      } lowerThan: {
        Exponent()
      }
    }
  }

  struct Exponent: Parser {
    var body: some Parser<Substring.UTF8View, Double> {
      InfixOperator(associativity: .left) {
        "^".utf8.map { pow as (Double, Double) -> Double }
      } lowerThan: {
        Factor()
      }
    }
  }

  struct Factor: Parser {
    var body: some Parser<Substring.UTF8View, Double> {
      OneOf {
        Parse {
          "(".utf8
          AdditionAndSubtraction()
          ")".utf8
        }

        Double.parser()
      }
    }
  }

  let input = "1+2*3/4-5^2"
  var output: Double!
  suite.benchmark("Parser") {
    var input = input[...].utf8
    output = try AdditionAndSubtraction().parse(&input)
  } tearDown: {
    precondition(output == -22.5)
  }
}

public struct InfixOperator<Input, Operator: Parser, Operand: Parser>: Parser
where
  Operator.Input == Input,
  Operand.Input == Input,
  Operator.Output == (Operand.Output, Operand.Output) -> Operand.Output
{
  public let `associativity`: Associativity
  public let operand: Operand
  public let `operator`: Operator

  @inlinable
  public init(
    associativity: Associativity,
    @ParserBuilder<Input> _ operator: () -> Operator,
    @ParserBuilder<Input> lowerThan operand: () -> Operand  // Should this be called `precedes:`?
  ) {
    self.associativity = `associativity`
    self.operand = operand()
    self.operator = `operator`()
  }

  @inlinable
  public func parse(_ input: inout Input) rethrows -> Operand.Output {
    switch associativity {
    case .left:
      var lhs = try self.operand.parse(&input)
      var rest = input
      while true {
        do {
          let operation = try self.operator.parse(&input)
          let rhs = try self.operand.parse(&input)
          rest = input
          lhs = operation(lhs, rhs)
        } catch {
          input = rest
          return lhs
        }
      }
    case .right:
      var lhs: [(Operand.Output, Operator.Output)] = []
      while true {
        let rhs = try self.operand.parse(&input)
        do {
          let operation = try self.operator.parse(&input)
          lhs.append((rhs, operation))
        } catch {
          return lhs.reversed().reduce(rhs) { rhs, pair in
            let (lhs, operation) = pair
            return operation(lhs, rhs)
          }
        }
      }
    }
  }
}

public enum Associativity {
  case left
  case right
}
