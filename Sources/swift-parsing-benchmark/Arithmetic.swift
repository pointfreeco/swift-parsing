import Benchmark
import CasePaths
import Foundation
import Parsing

enum Expression: Equatable {
  indirect case add(Expression, Expression)
  indirect case divide(Expression, Expression)
  indirect case exponent(Expression, Expression)
  case double(Double)
  indirect case multiply(Expression, Expression)
  indirect case subtract(Expression, Expression)
}

/*

 */

/// This benchmark demonstrates how to parse a recursive grammar: arithmetic.
let arithmeticSuite = BenchmarkSuite(name: "Arithmetic") { suite in

//  let tmp = "+".utf8.map(/Expression.add)

  struct AdditionAndSubtraction: ParserPrinter {
    let body = InfixOperator(associativity: .left) {
      [
        ("+".utf8, /Expression.add),
        ("-".utf8, /Expression.subtract)
      ]
    } lowerThan: {
      MultiplicationAndDivision()
    } /* higherThan: Factor() */

    func parse(_ input: inout Substring.UTF8View) throws -> Expression {
      try self.body.parse(&input)
    }
    func print(_ output: Expression, into input: inout Substring.UTF8View) throws {
      try self.body.print(output, into: &input)
    }
  }

  struct MultiplicationAndDivision: ParserPrinter {
    let body = InfixOperator(associativity: .left) {
      [
        ("*".utf8, /Expression.multiply),
        ("/".utf8, /Expression.divide)
      ]
    } lowerThan: {
      Exponent()
    } /* higherThan: AdditionAndSubtraction() */

    func parse(_ input: inout Substring.UTF8View) throws -> Expression {
      try self.body.parse(&input)
    }
    func print(_ output: Expression, into input: inout Substring.UTF8View) throws {
      try self.body.print(output, into: &input)
    }
  }

  struct Exponent: ParserPrinter {
    let body = InfixOperator(associativity: .left) {
      [
        ("^".utf8, /Expression.exponent)
      ]
    } lowerThan: {
      Factor()
    } /* higherThan: MultiplicationAndDivision() */

    func parse(_ input: inout Substring.UTF8View) throws -> Expression {
      try self.body.parse(&input)
    }
    func print(_ output: Expression, into input: inout Substring.UTF8View) throws {
      try self.body.print(output, into: &input)
    }
  }

  struct Factor: ParserPrinter {
    let body = OneOf {
      Parse {
        "(".utf8
        Lazy { AdditionAndSubtraction() }
        ")".utf8
      }

      Double.parser().map(/Expression.double)
    }
    .eraseToAnyParserPrinter()

    func parse(_ input: inout Substring.UTF8View) throws -> Expression {
      try self.body.parse(&input)
    }
    func print(_ output: Expression, into input: inout Substring.UTF8View) throws {
      try self.body.print(output, into: &input)
    }
  }

  let expr: Expression = .divide(
    .double(4),
    .multiply(
      .double(2),
      .double(3)
    )
  )
  let input1 = try! AdditionAndSubtraction().print(expr)
  // (2*3)/4
  print(Substring(input1))
  print("--")

  let input = "1.0+2.0*3.0/4.0-5.0^2.0"
  var output: Expression!
  suite.benchmark("Parser") {
    var input = input[...].utf8
    output = try AdditionAndSubtraction().parse(&input)
  } tearDown: {
    precondition(
      output
      == .subtract(
        .add(
          .double(1.0),
          .divide(
            .multiply(
              .double(2.0),
              .double(3.0)
            ),
            .double(4.0)
          )
        ),
        .exponent(
          .double(5.0),
          .double(2.0)
        )
      )
    )
    let roundtripInput = String(Substring(try! AdditionAndSubtraction().print(output)))
    precondition(roundtripInput == input)
  }
}

public struct InfixOperator<Operator, Operand, Operation>: Parser
where
  Operator: Parser,
  Operand: Parser,
  Operator.Input == Operand.Input,
  Operator.Output == Void,
  Operation: Conversion,
  Operation.Input == (Operand.Output, Operand.Output),
  Operation.Output == Operand.Output
{
  public let `associativity`: Associativity
  public let operand: Operand
  public let operators: [(Operator, Operation)]

  @inlinable
  public init(
    associativity: Associativity,
    _ operators: () -> [(Operator, Operation)],
    @ParserBuilder lowerThan operand: () -> Operand  // Should this be called `precedes operand:`?
  ) {
    self.associativity = `associativity`
    self.operand = operand()
    self.operators = operators()
  }

  @inlinable
  public func parse(_ input: inout Operand.Input) rethrows -> Operand.Output {
    switch associativity {
    case .left:
      var lhs = try self.operand.parse(&input)
      var rest = input
      while true {
        do {
          let operation: Operation! = try Parsers.OneOfMany(
            self.operators.map { `operator`, operation in
              `operator`.map { operation }
            }
          )
            .parse(&input)

          let rhs = try self.operand.parse(&input)
          rest = input
          lhs = try operation.apply((lhs, rhs))

        } catch {
          input = rest
          return lhs
        }
      }
      
    case .right:
      fatalError()
//      var lhs: [(Operand.Output, Operator.Output)] = []
//      while true {
//        let rhs = try self.operand.parse(&input)
//        do {
//          let operation = try self.operator.parse(&input)
//          lhs.append((rhs, operation))
//        } catch {
//          return try lhs.reversed().reduce(rhs) { rhs, pair in
//            let (lhs, operation) = pair
//            return try operation.apply((lhs, rhs))
//          }
//        }
//      }
    }
  }
}

struct InfixOperatorError: Error {}

extension InfixOperator: Printer
where
  Operator: Printer,
  Operand: Printer
{

  // Operator: AnyParserPrinter<Substring, AnyConversion<(Expression, Expression), Expression>>
  //    +/-
  //    OneOf {
  //      "+".utf8.map { /Expression.add as CasePath<Expression, (Expression, Expression)> }
  //      "-".utf8.map { /Expression.subtract as CasePath<Expression, (Expression, Expression)> }
  //    }
  // Operand:  AnyParserPrinter<Substring, Expression>
  //    MultiplicationDivision()

  // Operand.Output = Expression
  // Operator.Input = Substring

  public func print(_ output: Operand.Output, into input: inout Operator.Input) throws {
    switch associativity {
    case .left:

      let original = input
      for (`operator`, operation) in self.operators.reversed() {
        do {
          let (lhs, rhs) = try operation.unapply(output)

          try self.operand.print(rhs, into: &input)
          try `operator`.print((), into: &input)
          try self.operand.print(lhs, into: &input)
          return

        } catch {
          input = original
        }
      }

      try self.operand.print(output, into: &input)

//      throw loopError ?? InfixOperatorError()


//      var lhs = try self.operand.parse(&input)
//      var rest = input
//      while true {
//        do {
//          let operation: Operation! = try Parsers.OneOfMany(
//            self.operators.map { `operator`, operation in
//              `operator`.map { operation }
//            }
//          )
//            .parse(&input)
//
//          let rhs = try self.operand.parse(&input)
//          rest = input
//          lhs = try operation.apply((lhs, rhs))
//
//        } catch {
//          input = rest
//          return lhs
//        }
//      }



    case .right:
      fatalError()
    }
  }
}


public enum Associativity {
  case left
  case right
}
