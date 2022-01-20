import Parsing
import XCTest

final class IntTests: XCTestCase {
  func testBasics() {
    let parser = Int.parser(of: Substring.UTF8View.self)

    var input = "123 Hello"[...].utf8
    XCTAssertEqual(123, try parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "-123 Hello"[...].utf8
    XCTAssertEqual(-123, try parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "+123 Hello"[...].utf8
    XCTAssertEqual(123, try parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "\(Int.max) Hello"[...].utf8
    XCTAssertEqual(Int.max, try parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "\(Int.min) Hello"[...].utf8
    XCTAssertEqual(Int.min, try parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input))
    XCTAssertEqual("Hello", String(input))

    input = "- Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input))
    XCTAssertEqual("- Hello", String(input))

    input = "+ Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input))
    XCTAssertEqual("+ Hello", String(input))
  }

  func testOverflow() {
    var input = "1234 Hello"[...].utf8
    XCTAssertThrowsError(try UInt8.parser(of: Substring.UTF8View.self).parse(&input))
    XCTAssertEqual("1234 Hello", String(input))
  }
}
