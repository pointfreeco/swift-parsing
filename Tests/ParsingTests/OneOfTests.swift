//import Parsing
//import XCTest
//
//final class OneOfTests: XCTestCase {
//  func testOneOfFirstSuccess() {
//    var input = "New York, Hello!"[...]
//    XCTAssertNotNil(StartsWith("New York").orElse(StartsWith("Berlin")).parse(&input))
//    XCTAssertEqual(", Hello!", Substring(input))
//  }
//
//  func testOneOfSecondSuccess() {
//    var input = "Berlin, Hello!"[...]
//    XCTAssertNotNil(StartsWith("New York").orElse(StartsWith("Berlin")).parse(&input))
//    XCTAssertEqual(", Hello!", Substring(input))
//  }
//
//  func testOneOfFailure() {
//    var input = "London, Hello!"[...]
//    XCTAssertNil(StartsWith("New York").orElse(StartsWith("Berlin")).parse(&input))
//    XCTAssertEqual("London, Hello!", Substring(input))
//  }
//
//  func testOneOfManyFirstSuccess() {
//    var input = "New York, Hello!"[...]
//    XCTAssertNotNil(OneOfMany(StartsWith("New York"), StartsWith("Berlin")).parse(&input))
//    XCTAssertEqual(", Hello!", Substring(input))
//  }
//
//  func testOneOfManyLastSuccess() {
//    var input = "Berlin, Hello!"[...]
//    XCTAssertNotNil(OneOfMany(StartsWith("New York"), StartsWith("Berlin")).parse(&input))
//    XCTAssertEqual(", Hello!", Substring(input))
//  }
//
//  func testOneOfManyFailure() {
//    var input = "London, Hello!"[...]
//    XCTAssertNil(OneOfMany(StartsWith("New York"), StartsWith("Berlin")).parse(&input))
//    XCTAssertEqual("London, Hello!", Substring(input))
//  }
//}
