import Parsing
import XCTest

private func exponent(`associativity`: Associativity) -> AnyParser<Substring, Double> {
  let term = OneOf {
    Parse {
      Skip { "(" }
      Lazy { exponent(associativity: `associativity`) }
      Skip { ")" }
    }
    Double.parser()
  }

  return InfixOperator(associativity: `associativity`) {
    "^".map { pow }
  } expression: {
    Lazy { term }
  }
  .eraseToAnyParser()
}


final class InfixOperatorTests: XCTestCase {
  func testLeftAssociativity() {
    var input = "2^3^2"[...]
    XCTAssertEqual(64, exponent(associativity: .left).parse(&input))
    XCTAssertEqual("", input)
    input = "(2^3)^2"[...]
    XCTAssertEqual(64, exponent(associativity: .left).parse(&input))
    XCTAssertEqual("", input)
    input = "2^(3^2)"[...]
    XCTAssertEqual(512, exponent(associativity: .left).parse(&input))
    XCTAssertEqual("", input)
  }

  func testRightAssociativity() {
    var input = "2^3^2"[...]
    XCTAssertEqual(512, exponent(associativity: .right).parse(&input))
    XCTAssertEqual("", input)
    input = "(2^3)^2"[...]
    XCTAssertEqual(64, exponent(associativity: .right).parse(&input))
    XCTAssertEqual("", input)
    input = "2^(3^2)"[...]
    XCTAssertEqual(512, exponent(associativity: .right).parse(&input))
    XCTAssertEqual("", input)
  }
}
