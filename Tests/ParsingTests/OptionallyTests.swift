//import Parsing
//import XCTest
//
//final class OptionalTests: XCTestCase {
//  func testSuccess() {
//    var input = "true Hello, world!"[...].utf8
//    XCTAssertEqual(.some(true), Optionally { Bool.parser() }.parse(&input))
//    XCTAssertEqual(" Hello, world!", Substring(input))
//  }
//
//  func testFailure() {
//    var input = "Hello, world!"[...].utf8
//    XCTAssertEqual(.none, Optionally { Bool.parser() }.parse(&input))
//    XCTAssertEqual("Hello, world!", Substring(input))
//  }
//
//  func testBacktracking() {
//    let parser = Parse {
//      "Hello,"
//      Optionally {
//        " "
//        Bool.parser()
//      }
//      " world!"
//    }
//
//    XCTAssertEqual(.some(true), try parser.parse("Hello, true world!"))
//    XCTAssertEqual(.none, try parser.parse("Hello, world!"))
//  }
//}
