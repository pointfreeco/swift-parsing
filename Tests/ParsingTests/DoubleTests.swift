import Parsing
import XCTest

final class DoubleTests: XCTestCase {
  func testDouble() {
    let parser = Double.parser(of: Substring.UTF8View.self)

    var input = "123 Hello"[...].utf8
    XCTAssertEqual(123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "123. Hello"[...].utf8
    XCTAssertEqual(123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "123.123 Hello"[...].utf8
    XCTAssertEqual(123.123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "1234567890123456789012345678901234567890 Hello"[...].utf8
    XCTAssertEqual(1234567890123456846996462118072609669120, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "-123 Hello"[...].utf8
    XCTAssertEqual(-123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "+123 Hello"[...].utf8
    XCTAssertEqual(123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "Hello"[...].utf8
    XCTAssertEqual(nil, parser.parse(&input))
    XCTAssertEqual("Hello", String(input))
  }

  func testFloat() {
    let parser = Float.parser(of: Substring.UTF8View.self)

    var input = "123 Hello"[...].utf8
    XCTAssertEqual(123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "123. Hello"[...].utf8
    XCTAssertEqual(123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "123.123 Hello"[...].utf8
    XCTAssertEqual(123.123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "1234567890123456789012345678901234567890 Hello"[...].utf8
    XCTAssertEqual(.infinity, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "-123 Hello"[...].utf8
    XCTAssertEqual(-123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "+123 Hello"[...].utf8
    XCTAssertEqual(123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "Hello"[...].utf8
    XCTAssertEqual(nil, parser.parse(&input))
    XCTAssertEqual("Hello", String(input))
  }

  #if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
  func testFloat80() {
    let parser = Float80.parser(of: Substring.UTF8View.self)

    var input = "123 Hello"[...].utf8
    XCTAssertEqual(123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "123. Hello"[...].utf8
    XCTAssertEqual(123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "123.123 Hello"[...].utf8
    XCTAssertEqual(123.123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "1234567890123456789012345678901234567890 Hello"[...].utf8
    XCTAssertEqual(1234567890123456788999898750329779388416, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "-123 Hello"[...].utf8
    XCTAssertEqual(-123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "+123 Hello"[...].utf8
    XCTAssertEqual(123, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = "Hello"[...].utf8
    XCTAssertEqual(nil, parser.parse(&input))
    XCTAssertEqual("Hello", String(input))
  }
  #endif
}
