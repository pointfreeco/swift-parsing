//import Parsing
//import XCTest
//
//class ManyTests: XCTestCase {
//  func testNoSeparator() throws {
//    let parser = Many { " " }
//
//    var input = "     Hello world"[...]
//    let output: [()] = try XCTUnwrap(parser.parse(&input))
//    XCTAssertEqual(output.count, 5)
//    XCTAssertEqual(input, "Hello world")
//
//    XCTAssertEqual(parser.print(output), "     ")
//  }
//
//  func testSeparator() throws {
//    let parser = Many { Int.parser() } separatedBy: { "," }
//
//    var input = "1,2,3,4,5 Hello world"[...]
//    let output = try XCTUnwrap(parser.parse(&input))
//    XCTAssertEqual(output, [1, 2, 3, 4, 5])
//    XCTAssertEqual(input, " Hello world")
//
//    XCTAssertEqual(parser.print(output), "1,2,3,4,5")
//  }
//
//  func testTrailingSeparator() throws {
//    let parser = Many { Int.parser() } separatedBy: { "," }
//
//    var input = "1,2,3,4,5,"[...]
//    let output = try XCTUnwrap(parser.parse(&input))
//    XCTAssertEqual(output, [1, 2, 3, 4, 5])
//    XCTAssertEqual(input, ",")
//  }
//
//  func testMinimum() {
//    var input = "1,2,3,4,5"[...]
//
//    XCTAssertEqual(
//      Many(atLeast: 6) {
//        Int.parser()
//      } separatedBy: {
//        ","
//      }
//      .parse(&input),
//      nil
//    )
//    XCTAssertEqual(input, "1,2,3,4,5")
//
//    XCTAssertEqual(
//      Many(atLeast: 5) {
//        Int.parser()
//      } separatedBy: {
//        ","
//      }
//      .parse(&input),
//      [1, 2, 3, 4, 5]
//    )
//    XCTAssertEqual(input, "")
//  }
//
//  func testMaximum() throws {
//    let parser = Many(atMost: 3) { Int.parser() } separatedBy: { "," }
//
//    var input = "1,2,3,4,5"[...]
//    let output = try XCTUnwrap(parser.parse(&input))
//    XCTAssertEqual(output, [1, 2, 3])
//    XCTAssertEqual(input, ",4,5")
//
//    XCTAssertEqual(parser.print([1, 2, 3, 4, 5]), "1,2,3")
//  }
//
//  func testReduce() {
//    var input = "1,2,3,4,5"[...].utf8
//
//    XCTAssertEqual(
//      Many(into: 0, +=) {
//        Int.parser()
//      } separatedBy: {
//        ",".utf8
//      }
//      .parse(&input),
//      15
//    )
//    XCTAssertEqual(Substring(input), "")
//  }
//}
