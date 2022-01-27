@testable import Parsing
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
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello
          | ^ expected integer
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual("Hello", String(input))

    input = "- Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:2
        1 | - Hello
          |  ^ expected integer
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual(" Hello", String(input))

    input = "+ Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:2
        1 | + Hello
          |  ^ expected integer
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual(" Hello", String(input))
  }

  func testOverflow() {
    var input = "1234 Hello"[...].utf8
    XCTAssertThrowsError(try UInt8.parser(of: Substring.UTF8View.self).parse(&input)) { error in
      XCTAssertEqual(
        """
        error: failed to process "UInt8"
         --> input:1:1
        1 | 1234 Hello
          | ^^^^ overflowed 255
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual(" Hello", String(input))
  }
}
