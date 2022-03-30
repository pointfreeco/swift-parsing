//import Parsing
//import XCTest
//
//final class RestTests: XCTestCase {
//  func testRest() {
//    var input = "Hello, world!"[...]
//    XCTAssertEqual("Hello, world!", try Rest().parse(&input))
//    XCTAssertEqual("", input)
//  }
//
//  func testRestAlwaysSucceeds() {
//    var input = ""[...]
//    XCTAssertThrowsError(try Rest().parse(&input)) { error in
//      XCTAssertEqual(
//        """
//        error: unexpected input
//         --> input:1:1
//        1 |
//          | ^ expected a non-empty input
//        """,
//        "\(error)"
//      )
//    }
//    XCTAssertEqual("", input)
//  }
//}
