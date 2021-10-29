import Parsing
import XCTest

class ManyTests: XCTestCase {
  func testNoSeparator() {
    var input = "         Hello world"[...]
    let parser = Many(StartsWith<Substring>(" "))

    XCTAssertNotNil(parser.parse(&input))
    XCTAssertEqual(Substring(input), "Hello world")

    XCTAssertEqual(
      parser.print([(), (), ()]),
      "   "
    )
  }

  func testSeparator() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      Many(Int.parser(), separator: StartsWith(",".utf8)).parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testTrailingSeparator() {
    var input = "1,2,3,4,5,"[...].utf8

    XCTAssertEqual(
      Many(Int.parser(), separator: StartsWith(",".utf8)).parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), ",")
  }

  func testMinimum() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      Many(
        Int.parser(),
        atLeast: 6,
        separator: StartsWith(",".utf8)
      )
      .parse(&input),
      nil
    )
    XCTAssertEqual(Substring(input), "1,2,3,4,5")

    XCTAssertEqual(
      Many(
        Int.parser(),
        atLeast: 5,
        separator: StartsWith(",".utf8)
      )
      .parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testMaximum() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      Many(
        Int.parser(),
        atMost: 3,
        separator: StartsWith(",".utf8)
      )
      .parse(&input),
      [1, 2, 3]
    )
    XCTAssertEqual(Substring(input), ",4,5")
  }

  func testReduce() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      Many(
        Int.parser(),
        into: 0,
        separator: StartsWith(",".utf8),
        +=
      )
      .parse(&input),
      15
    )
    XCTAssertEqual(Substring(input), "")
  }
}
