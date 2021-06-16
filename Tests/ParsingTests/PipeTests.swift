//import Parsing
//import XCTest
//
//final class PipeTests: XCTestCase {
//  func testSuccess() {
//    var input = "true Hello, world!"[...].utf8
//    XCTAssertEqual(true, Prefix(5).pipe(Bool.parser()).parse(&input))
//    XCTAssertEqual("Hello, world!", Substring(input))
//  }
//
//  func testFailureOutput() {
//    var input = "true Hello, world!"[...].utf8
//    XCTAssertEqual(nil, Prefix(5).pipe(Bool.parser().skip(End())).parse(&input))
//    XCTAssertEqual("true Hello, world!", Substring(input))
//  }
//
//  func testFailureInput() {
//    var input = "true"[...].utf8
//    XCTAssertEqual(nil, PrefixUpTo("\n".utf8).pipe(Bool.parser()).parse(&input))
//    XCTAssertEqual("true", Substring(input))
//  }
//}
