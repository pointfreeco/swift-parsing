@testable import Parsing
import XCTest

final class AlwaysTests: XCTestCase {
  func testAlways() {
    var input = "Hello, world!"[...]
    XCTAssertEqual(42, Always(42).parse(&input))
    XCTAssertEqual("Hello, world!", input)
  }

  func testMap() {
    var input = "Hello, world!"[...]
    XCTAssertEqual(43, Always(42).map { $0 + 1 }.parse(&input))
    XCTAssertEqual("Hello, world!", input)
  }

  func testColor() {
    var input = "#FF0000"[...].utf8

    struct Color: Equatable {
      let red, green, blue: UInt8
    }

    let hexPrimary = Prefix()
      .count(2)
      .pipe(UInt8.parser(of: Substring.UTF8View.self, isSigned: false, radix: 16).skip(End()))

    let hexColor = "#".utf8
      .take(hexPrimary)
      .take(hexPrimary)
      .take(hexPrimary)
      .map(Color.init)

    XCTAssertEqual(
      hexColor.parse(&input),
      .init(red: 255, green: 0, blue: 0)
    )
    XCTAssert(input.isEmpty)
  }
}
