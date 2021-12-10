import Parsing
import XCTest

final class FlatMapTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertEqual(43, Int.parser().flatMap { Always($0 + 1) }.parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertEqual(nil, Int.parser().flatMap { Always($0 + 1) }.parse(&input))
    XCTAssertEqual("Hello, world!", Substring(input))
  }

  func testSkipSpaces() {
    var input = "  124   true"[...]
    let output = Int.parser()
      .flatMap { version in
        version.isMultiple(of: 2)
        ? Conditional.first(Bool.parser())
        : Conditional.second(Fail())
      }
      .skipSpaces()
      .parse(&input)

    XCTAssertEqual(input, "")
    XCTAssertEqual(output, true)
  }
}
