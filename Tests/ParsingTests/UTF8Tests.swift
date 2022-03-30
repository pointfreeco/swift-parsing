//import Parsing
//import XCTest
//
//final class UTF8Tests: XCTestCase {
//  func testSubstringNormalization() {
//    var input = "\u{00E9}e\u{0301}e\u{0341} Hello, world"[...].utf8
//    let parser = FromSubstring<Substring.UTF8View, String> { "é" }
//    XCTAssertNoThrow(try parser.parse(&input))
//    XCTAssertEqual("e\u{0301}e\u{0341} Hello, world", Substring(input))
//    XCTAssertNoThrow(try parser.parse(&input))
//    XCTAssertEqual("e\u{0341} Hello, world", Substring(input))
//    XCTAssertNoThrow(try parser.parse(&input))
//    XCTAssertEqual(" Hello, world", Substring(input))
//    XCTAssertThrowsError(try parser.parse(&input)) { error in
//      XCTAssertEqual(
//        """
//        error: unexpected input
//         --> input:1:4
//        1 | ééé Hello, world
//          |    ^ expected "é"
//        """,
//        "\(error)"
//      )
//    }
//    XCTAssertEqual(" Hello, world", Substring(input))
//  }
//
//  func testUnicodeScalars() {
//    var input = "🇺🇸 Hello, world"[...].unicodeScalars
//    let parser = "🇺".unicodeScalars
//    XCTAssertNoThrow(try parser.parse(&input))
//    XCTAssertEqual("🇸 Hello, world", Substring(input))
//    XCTAssertThrowsError(try parser.parse(&input)) { error in
//      XCTAssertEqual(
//        """
//        error: unexpected input
//         --> input:1:1
//        1 | 🇺🇸 Hello, world
//          | ^ expected "🇺"
//        """,
//        "\(error)"
//      )
//    }
//    XCTAssertEqual("🇸 Hello, world", Substring(input))
//  }
//
//  func testUTF8Normalization() {
//    enum City {
//      case losAngeles
//      case newYork
//      case sanJose
//    }
//
//    let city = OneOf {
//      "Los Angeles".utf8.map { City.losAngeles }
//      "New York".utf8.map { City.newYork }
//      "San Jos\u{00E9}".utf8.map { City.sanJose }
//    }
//
//    XCTAssertThrowsError(try city.parse("San Jose\u{0301}")) { error in
//      XCTAssertEqual(
//        """
//        error: unexpected input
//         --> input:1:1
//        1 | San José
//          | ^ expected "Los Angeles"
//          | ^ expected "New York"
//          | ^ expected "San José"
//        """,
//        "\(error)"
//      )
//    }
//  }
//}
