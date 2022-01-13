import CustomDump
import Parsing
import XCTest

final class OptionalTests: XCTestCase {
  func testSuccess() {
    var input = "true Hello, world!"[...].utf8
    XCTAssertNoDifference(.some(.some(true)), Optional.parser(of: Bool.parser()).parse(&input))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }

  func testFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNoDifference(.some(.none), Optional.parser(of: Bool.parser()).parse(&input))
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }
}
