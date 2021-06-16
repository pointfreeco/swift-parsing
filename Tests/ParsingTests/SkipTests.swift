//import Parsing
//import XCTest
//
//final class SkipTests: XCTestCase {
//  func testSkipFirstSuccess() {
//    var input = "Hello, 42!"[...].utf8
//    XCTAssertEqual(42, StartsWith("Hello, ".utf8).take(Int.parser()).parse(&input))
//    XCTAssertEqual("!", Substring(input))
//  }
//
//  func testSkipFirstFailedFirst() {
//    var input = "Hello, 42!"[...].utf8
//    XCTAssertEqual(nil, StartsWith("Goodbye, ".utf8).take(Int.parser()).parse(&input))
//    XCTAssertEqual("Hello, 42!", Substring(input))
//  }
//
//  func testSkipFirstFailedSecond() {
//    var input = "Hello, world!"[...].utf8
//    XCTAssertEqual(nil, StartsWith("Hello, ".utf8).take(Int.parser()).parse(&input))
//    XCTAssertEqual("Hello, world!", Substring(input))
//  }
//
//  func testSkipSecondSuccess() {
//    var input = "42 Hello, world!"[...].utf8
//    XCTAssertEqual(42, Int.parser().skip(StartsWith(" Hello, ".utf8)).parse(&input))
//    XCTAssertEqual("world!", Substring(input))
//  }
//
//  func testSkipSecondFailedFirst() {
//    var input = "Hello, world!"[...].utf8
//    XCTAssertEqual(nil, Int.parser().skip(StartsWith(" Hello, ".utf8)).parse(&input))
//    XCTAssertEqual("Hello, world!", Substring(input))
//  }
//
//  func testSkipSecondFailedSecond() {
//    var input = "42 Hello, world!"[...].utf8
//    XCTAssertEqual(nil, Int.parser().skip(StartsWith(" Goodbye, ".utf8)).parse(&input))
//    XCTAssertEqual("42 Hello, world!", Substring(input))
//  }
//
//  func testSkipSuccess() {
//    var input = "42 Hello, world!"[...].utf8
//    XCTAssert(try () == XCTUnwrap(Skip(Int.parser()).parse(&input)))
//    XCTAssertEqual(" Hello, world!", Substring(input))
//  }
//
//  func testSkipFailure() {
//    var input = "Hello, world!"[...].utf8
//    XCTAssertNil(Skip(Int.parser()).parse(&input))
//    XCTAssertEqual("Hello, world!", Substring(input))
//  }
//
//  func testIgnoreOutput() {
//    var input = "42 Hello, world!"[...].utf8
//    XCTAssert(try () == XCTUnwrap(Int.parser().ignoreOutput().parse(&input)))
//    XCTAssertEqual(" Hello, world!", Substring(input))
//  }
//}
