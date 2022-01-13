import CustomDump
import Parsing
import XCTest

final class ConditionalTests: XCTestCase {
  let parser = Int.parser()
    .pullback(\Substring.utf8)
    .flatMap {
      $0.isMultiple(of: 2)
        ? Conditional.first(Always(true))
        : Conditional.second(Fail())
    }

  func testFirst() {
    var input = "42 Hello, world!"[...]
    XCTAssertNoDifference(true, parser.parse(&input))
    XCTAssertNoDifference(" Hello, world!", input)
  }

  func testSecond() {
    var input = "43 Hello, world!"[...]
    XCTAssertNoDifference(nil, parser.parse(&input))
    XCTAssertNoDifference("43 Hello, world!", input)
  }
}
