import CustomDump
import Parsing
import XCTest

final class IntTests: XCTestCase {
  func testBasics() {
    let parser = Int.parser(of: Substring.UTF8View.self)

    var input = "123 Hello"[...].utf8
    XCTAssertNoDifference(123, parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-123 Hello"[...].utf8
    XCTAssertNoDifference(-123, parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "+123 Hello"[...].utf8
    XCTAssertNoDifference(123, parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "\(Int.max) Hello"[...].utf8
    XCTAssertNoDifference(Int.max, parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "\(Int.min) Hello"[...].utf8
    XCTAssertNoDifference(Int.min, parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "Hello"[...].utf8
    XCTAssertNoDifference(nil, parser.parse(&input))
    XCTAssertNoDifference("Hello", String(input))

    input = "- Hello"[...].utf8
    XCTAssertNoDifference(nil, parser.parse(&input))
    XCTAssertNoDifference("- Hello", String(input))

    input = "+ Hello"[...].utf8
    XCTAssertNoDifference(nil, parser.parse(&input))
    XCTAssertNoDifference("+ Hello", String(input))
  }

  func testOverflow() {
    var input = "1234 Hello"[...].utf8
    XCTAssertNoDifference(nil, UInt8.parser(of: Substring.UTF8View.self).parse(&input))
    XCTAssertNoDifference("1234 Hello", String(input))
  }
}
