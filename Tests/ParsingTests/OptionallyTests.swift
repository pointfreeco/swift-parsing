import CustomDump
import Parsing
import XCTest

final class OptionalTests: XCTestCase {
  func testSuccess() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertNoDifference(.some(true), Optionally { Bool.parser() }.parse(&input))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }

  func testFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNoDifference(.none, Optionally { Bool.parser() }.parse(&input))
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }
    
  func testBacktracking() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference(.none, Optionally {
      "Hello, "
      Bool.parser()
    }.parse(&input))
    XCTAssertNoDifference("Hello, world!", input)
  }
}
