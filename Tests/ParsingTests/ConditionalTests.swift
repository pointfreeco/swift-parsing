import Parsing
import XCTest

final class ConditionalTests: XCTestCase {
  struct MultipleOf2: Parser {
    var body: some Parser<Substring.UTF8View, Bool> {
      Int.parser()
        .flatMap { n in
          if n.isMultiple(of: 2) {
            Always<Substring.UTF8View, Bool>(true)
          } else {
            Fail<Substring.UTF8View, Bool>(throwing: OddNumberError())
          }
        }
    }
  }

  func testFirst() {
    var input = "42 Hello, world!"[...]
    XCTAssertEqual(true, try MultipleOf2().parse(&input.utf8))
    XCTAssertEqual(" Hello, world!", input)
  }

  func testSecond() {
    var input = "43 Hello, world!"[...]
    XCTAssertThrowsError(try MultipleOf2().parse(&input.utf8)) { error in
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
