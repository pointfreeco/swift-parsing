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
    XCTAssertEqual(1_234_567_890_123_456_846_996_462_118_072_609_669_120, parser.parse(&input))
    XCTAssertEqual(" Hello", String(input))

    input = String(format: "1%f Hello", Double.greatestFiniteMagnitude)[...].utf8
    XCTAssertEqual(nil, parser.parse(&input))
    XCTAssertEqual(String(format: "1%f Hello", Double.greatestFiniteMagnitude), String(input))

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

    input = String(format: "1%f Hello", Float.greatestFiniteMagnitude)[...].utf8
    XCTAssertEqual(nil, parser.parse(&input))
    XCTAssertEqual(String(format: "1%f Hello", Float.greatestFiniteMagnitude), String(input))

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
      XCTAssertEqual(1_234_567_890_123_456_788_999_898_750_329_779_388_416, parser.parse(&input))
      XCTAssertEqual(" Hello", String(input))

      input = String(format: "1%f Hello", Float80.greatestFiniteMagnitude)[...].utf8
      XCTAssertEqual(nil, parser.parse(&input))
      XCTAssertEqual(String(format: "1%f Hello", Float80.greatestFiniteMagnitude), String(input))

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
