import Parsing
import XCTest

struct LeftAssociate<OperatorParser, ValueParser>: Parser
where
  OperatorParser: Parser,
  ValueParser: Parser,
  OperatorParser.Input == ValueParser.Input,
  OperatorParser.Output == (ValueParser.Output, ValueParser.Output) -> ValueParser.Output
{
  let valueParser: ValueParser
  let operatorParser: OperatorParser

  init(_ operatorParser: OperatorParser, _ valueParser: ValueParser) {
    self.operatorParser = operatorParser
    self.valueParser = valueParser
  }

  func parse(_ input: inout ValueParser.Input) -> ValueParser.Output? {
    func parseHelp(_ lhs: ValueParser.Output) -> ValueParser.Output {
      guard let operation = self.operatorParser.parse(&input) else { return lhs }
      guard let rhs = self.valueParser.parse(&input) else { return lhs }
      return parseHelp(operation(lhs, rhs))
    }
    guard let lhs = self.valueParser.parse(&input) else { return nil }
    return parseHelp(lhs)
  }
}

extension Parser {
  func leftAssociate<Operator>(@ParserBuilder _ operator: () -> Operator)
  -> LeftAssociate<Operator, Self> {
    .init(`operator`(), self)
  }
}

var expr: AnyParser<Substring, Int> {
  AnyParser(
    Lazy {
      term.leftAssociate {
        Skip { UTF8View { Whitespace() } }
        OneOf {
          "+".map { (+) }
          "-".map { (-) }
        }
        Skip { UTF8View { Whitespace() } }
      }
    }
  )
}

let term = factor.leftAssociate {
  Skip { UTF8View { Whitespace() } }
  OneOf {
    "*".map { (*) }
    "/".map { (/) }
  }
  Skip { UTF8View { Whitespace() } }
}

let factor = OneOf {
  Parse {
    Skip { "(" }
    expr
    Skip { ")" }
  }
  natural
}

let natural = Parse {
  Skip { UTF8View { Whitespace() } }
  Int.parser()
  Skip { UTF8View { Whitespace() } }
}

class ArithmeticTests: XCTestCase {
  func testArithmetic() {
    XCTAssertEqual(
      expr.parse("1 + 2 * 3 / 4 - 5"),
      -3
    )
  }
}
