@testable import Parsing
import XCTest

final class FlatMapTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertEqual(43, try Int.parser().flatMap { Always($0 + 1) }.parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))

    input = "42 Hello, world!"[...].utf8
    XCTAssertEqual(43, try Int.parser().flatMap { return Always($0 + 1) }.parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testUpstreamFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertThrowsError(try Int.parser().flatMap { Always($0 + 1) }.parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello, world!
          | ^ expected integer
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual("Hello, world!", Substring(input))
  }

  func testDownstreamFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertThrowsError(
      try Prefix(2).flatMap { _ in Int.parser() }.parse(&input)
    ) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1-2
        1 | Hello, world!
          | ^^ expected integer
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual("llo, world!", Substring(input))
  }
}
