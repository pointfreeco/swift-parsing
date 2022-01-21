import Parsing
import XCTest

class ThrowingTests: XCTestCase {
  func testIntThrowing() throws {
    var input = "42"[...]
    XCTAssertEqual(
      try Int.parser().parse(&input) as Int,
      42
    )

    input = "Hello"
    XCTAssertEqual(
      try Int.parser().parse(&input) as Int,
      42
    )

    input = "42,Hello"
    try Parse {
      Int.parser()
      ","
      Int.parser()
    }
    .parse(&input) as (Int, Int)

  }
}
