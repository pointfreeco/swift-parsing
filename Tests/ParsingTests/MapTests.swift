import Parsing
import XCTest

final class MapTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertEqual("42", Int.parser().map(String.init).parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testOverload() {
    struct Identifier: Equatable {}
    struct Type {}

    func fresh() -> Type { Type() }

    let parameters = [Identifier]().map { _ in fresh() }
    XCTAssert(type(of: parameters) == Array<Type>.self)
  }
}
