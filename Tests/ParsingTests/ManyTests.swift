import Parsing
import XCTest

class ManyTests: XCTestCase {
  func testNoSeparator() throws {
    let parser = Many { " ".utf8 }

    var input = "     Hello world"[...].utf8
    let output: [()] = try XCTUnwrap(parser.parse(&input))
    XCTAssertEqual(output.count, 5)
    XCTAssertEqual(Substring(input), "Hello world")

    XCTAssertEqual(parser.print(output).map(Substring.init), "     ")
  }

  func testSeparator() throws {
    let parser = Many { Int.parser() } separatedBy: { ",".utf8 }

    var input = "1,2,3,4,5 Hello world"[...].utf8
    let output = try XCTUnwrap(parser.parse(&input))
    XCTAssertEqual(output, [1, 2, 3, 4, 5])
    XCTAssertEqual(Substring(input), " Hello world")

    XCTAssertEqual(parser.print(output).map(Substring.init), "1,2,3,4,5")
  }

  func testTrailingSeparator() throws {
    let parser = Many { Int.parser() } separatedBy: { ",".utf8 }

    var input = "1,2,3,4,5,"[...].utf8
    let output = try XCTUnwrap(parser.parse(&input))
    XCTAssertEqual(output, [1, 2, 3, 4, 5])
    XCTAssertEqual(Substring(input), ",")
  }

  func testMinimum() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      Many(atLeast: 6) {
        Int.parser()
      } separatedBy: {
        ",".utf8
      }
      .parse(&input),
      nil
    )
    XCTAssertEqual(Substring(input), "1,2,3,4,5")

    XCTAssertEqual(
      Many(atLeast: 5) {
        Int.parser()
      } separatedBy: {
        ",".utf8
      }
      .parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testMaximum() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      Many(atMost: 3) {
        Int.parser()
      } separatedBy: {
        ",".utf8
      }
      .parse(&input),
      [1, 2, 3]
    )
    XCTAssertEqual(Substring(input), ",4,5")
  }

  func testReduce() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      Many(into: 0, +=) {
        Int.parser()
      } separatedBy: {
        ",".utf8
      }
      .parse(&input),
      15
    )
    XCTAssertEqual(Substring(input), "")
  }
}
