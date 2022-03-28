import Parsing
import XCTest

final class ConditionalTests: XCTestCase {
  let parser = Int.parser()
    .flatMap { n in
      if n.isMultiple(of: 2) {
        Always(true)
      } else {
        Fail<Substring, Bool>(throwing: OddNumberError())
      }
    }

  func testFirst() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual(true, try parser.parse(&input.utf8))
    XCTAssertEqual(" Hello, world!", input)
  }

  func testSecond() {
    var input = "43 Hello, world!"[...]
    XCTAssertThrowsError(try parser.parse(&input.utf8)) { error in
      XCTAssertEqual(
        """
        error: OddNumberError()
         --> input:1:1-2
        1 | 43 Hello, world!
          | ^^
        """,
        "\(error)"
      )
    }
    XCTAssertEqual(" Hello, world!", input)
  }
}

private struct OddNumberError: Error {}
