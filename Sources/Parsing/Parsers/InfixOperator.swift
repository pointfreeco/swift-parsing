public struct InfixOperator<Operator, Expression>: Parser
where
  Operator: Parser,
  Expression: Parser,
  Operator.Input == Expression.Input,
  Operator.Output == (Expression.Output, Expression.Output) -> Expression.Output
{
  public let `associativity`: Associativity
  public let expression: Expression
  public let `operator`: Operator

  @inlinable
  public init(
    _ operator: Operator,
    associativity: Associativity,
    do expression: Expression
  ) {
    self.associativity = `associativity`
    self.expression = expression
    self.operator = `operator`
  }

  @inlinable
  public func parse(_ input: inout Expression.Input) -> Expression.Output? {
    switch associativity {
    case .left:
      guard var lhs = self.expression.parse(&input) else { return nil }
      var rest = input
      while
        let operation = self.operator.parse(&input),
        let rhs = self.expression.parse(&input)
      {
        rest = input
        lhs = operation(lhs, rhs)
      }
      input = rest
      return lhs
    case .right:
      var lhs: [(Expression.Output, Operator.Output)] = []
      while true {
        guard let rhs = self.expression.parse(&input)
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
