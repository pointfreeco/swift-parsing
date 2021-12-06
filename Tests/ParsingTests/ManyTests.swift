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
        atLeast: 6,
        separator: ",".utf8
      )
      .parse(&input),
      nil
    )
    XCTAssertEqual(Substring(input), "1,2,3,4,5")

    XCTAssertEqual(
      Many(
        Int.parser(),
        atLeast: 5,
        separator: ",".utf8
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
        separator: ",".utf8
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
        separator: ",".utf8,
        +=
      )
      .parse(&input),
      15
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testFailureIfNoProgress() {
     var input = " Hello, World!"[...]
     XCTAssertEqual(
       Many(CharacterSet.alphanumerics).parse(&input),
       [""]
     )
   }

  func testSuccessThenNoProgress() {
    var input = "Hello, World!"[...]
    XCTAssertEqual(
      Many(CharacterSet.alphanumerics).parse(&input),
      ["Hello", ""]
    )
    XCTAssertEqual(Substring(input), ", World!")
  }

  func testArray() {
    var input = [1, 2, 3, 4][...]
    let output = Many(AnyParser { $0.first == 3 ? -3 : $0.removeFirst() }).parse(&input)
    XCTAssertEqual([1, 2, -3], output)
    XCTAssertEqual([3, 4], input)
  }

  func testEmptyComponents() {
    var input = "2001:db8::2:1"[...]
    XCTAssertEqual(
      Many(Prefix(while: \.isHexDigit), separator: ":").parse(&input),
      ["2001", "db8", "", "2", "1"]
    )
  }
}
