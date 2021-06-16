//import Parsing
//import XCTest
//
//final class FilterTests: XCTestCase {
//  func testSuccess() {
//    var input = "42 Hello, world!"[...].utf8
//    XCTAssertEqual(42, Int.parser().filter { $0.isMultiple(of: 2) }.parse(&input))
//    XCTAssertEqual(" Hello, world!", Substring(input))
//  }
//
//  func testFailure() {
//    var input = "43 Hello, world!"[...].utf8
//    XCTAssertEqual(nil, Int.parser().filter { $0.isMultiple(of: 2) }.parse(&input))
//    XCTAssertEqual("43 Hello, world!", Substring(input))
//  }
//}
