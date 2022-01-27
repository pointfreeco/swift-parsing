@testable import Parsing
import XCTest

final class FilterTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertEqual(42, try Int.parser().filter { $0.isMultiple(of: 2) }.parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testFailure() {
    var input = "43 Hello, world!"[...].utf8
    XCTAssertThrowsError(try Int.parser().filter { $0.isMultiple(of: 2) }.parse(&input)) { error in
      XCTAssertEqual(
        """
        error: processed value 43 failed to satisfy predicate
         --> input:1:1
        1 | 43 Hello, world!
          | ^^ processed input
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testOverloadArray() {
    let array = [1].filter { _ in true }
    XCTAssert(type(of: array) == Array<Int>.self)
  }

  func testOverloadString() {
    let array = "abc".filter { _ in true }
    XCTAssert(type(of: array) == String.self)
  }

  func testOverloadUnicodeScalars() {
    let array = "abc".unicodeScalars.filter { _ in true }
    XCTAssert(type(of: array) == String.UnicodeScalarView.self)
  }

  func testOverloadUTF8View() {
    let array = "abc".utf8.filter { _ in true }
    XCTAssert(type(of: array) == [String.UTF8View.Element].self)
  }
}
