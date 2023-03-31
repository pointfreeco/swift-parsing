import Parsing
import XCTest

final class SkipTests: XCTestCase {
  func testSkipSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssert(try () == XCTUnwrap(Skip { Int.parser(of: Substring.UTF8View.self) }.parse(&input)))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testSkipFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertThrowsError(
      try Skip { Int.parser(of: Substring.UTF8View.self) }.parse(&input)
    ) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello, world!
          | ^ expected integer
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("Hello, world!", Substring(input))
  }

  func testPrintParserSkipSuccess() {
    var input = "!"[...]
    let parser = Parse {
      Skip { "Hello, " }
      Prefix { $0 != "!" }
    }

    XCTAssertNoThrow(try parser.print("world"[...], into: &input))
    XCTAssertEqual(input, "Hello, world!")
  }
}
