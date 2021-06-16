//import Parsing
//import XCTest
//
//final class ConditionalTests: XCTestCase {
//  let parser = Int.parser()
//    .pullback(\Substring.utf8)
//    .flatMap {
//      $0.isMultiple(of: 2)
//        ? Conditional.first(Always(true))
//        : Conditional.second(Fail())
//    }
//
//  func testFirst() {
//    var input = "42 Hello, world!"[...]
//    XCTAssertEqual(true, parser.parse(&input))
//    XCTAssertEqual(" Hello, world!", input)
//  }
//
//  func testSecond() {
//    var input = "43 Hello, world!"[...]
//    XCTAssertEqual(nil, parser.parse(&input))
//    XCTAssertEqual("43 Hello, world!", input)
//  }
//}
