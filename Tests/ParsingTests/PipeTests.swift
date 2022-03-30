//import Parsing
//import XCTest
//
//final class PipeTests: XCTestCase {
//  func testSuccess() {
//    var input = "true Hello, world!"[...].utf8
//    XCTAssertEqual(true, try Prefix(4).pipe { Bool.parser() }.parse(&input))
//    XCTAssertEqual(" Hello, world!", Substring(input))
//  }
//
//  func testFailureOutput() {
//    var input = "true Hello, world!"[...].utf8
//    XCTAssertThrowsError(
//      try Prefix(10).pipe {
//        Bool.parser()
//      }
//      .parse(&input)
//    ) { error in
//      XCTAssertEqual(
//        """
//        error: unexpected input
//         --> input:1:5-10
//        1 | true Hello, world!
//          |     ^^^^^^ expected end of pipe
//        """,
//        "\(error)"
//      )
//    }
//    XCTAssertEqual(", world!", Substring(input))
//  }
//
//  func testFailureInput() {
//    var input = "true"[...].utf8
//    XCTAssertThrowsError(
//      try PrefixUpTo("\n".utf8).pipe {
//        Bool.parser()
//      }
//      .parse(&input)
//    ) { error in
//      XCTAssertEqual(
//        #"""
//        error: unexpected input
//         --> input:1:1
//        1 | true
//          | ^ expected prefix up to "\n"
//        """#,
//        "\(error)"
//      )
//    }
//    XCTAssertEqual("true", Substring(input))
//  }
//}
