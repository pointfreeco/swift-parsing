import Parsing
import XCTest

class ManyTests: XCTestCase {
  func testNoSeparator() {
    var input = "         Hello world"[...].utf8
    XCTAssertNotNil(
      Many(" ".utf8)
        .parse(&input)
    )
    XCTAssertEqual(Substring(input), "Hello world")
  }

  func testSeparator() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      Many(Int.parser(), separator: ",".utf8).parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testTrailingSeparator() {
    var input = "1,2,3,4,5,"[...].utf8

    XCTAssertEqual(
      Many(Int.parser(), separator: ",".utf8).parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), ",")
  }

  func testMinimum() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      Many(
        Int.parser(),
        separator: ",".utf8
      )
        .minimum(6)
      .parse(&input),
      nil
    )
    XCTAssertEqual(Substring(input), "1,2,3,4,5")

    XCTAssertEqual(
      Many(
        Int.parser(),
        separator: ",".utf8
      )
        .minimum(5)
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
        separator: ",".utf8
      )
        .maximum(3)
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
        separator: ",".utf8,
        +=
      )
        .parse(&input),
      15
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testEmptyComponents() {
    var input = "2001:db8::2:1"[...]
    XCTAssertEqual(
      Many(Prefix { $0.isHexDigit }, separator: ":").parse(&input),
      ["2001", "db8", "", "2", "1"]
    )
  }

  func testManyEnvironmentReset() {
    var input = "10,20"[...]

    XCTAssertEqual(
      Many(
        Prefix { $0 != "," }.pipe(Int.parser()),
        into: 0,
        separator: ",",
        +=
      )
        .maximum(1)
        .parse(&input),
      10
    )
    XCTAssertEqual(input, ",20")
  }
}
