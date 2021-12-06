import Parsing
import XCTest

final class FilterTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertEqual(42, Int.parser().filter { $0.isMultiple(of: 2) }.parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }

  func testFailure() {
    var input = "43 Hello, world!"[...].utf8
    XCTAssertEqual(nil, Int.parser().filter { $0.isMultiple(of: 2) }.parse(&input))
    XCTAssertEqual("43 Hello, world!", Substring(input))
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
  
  func testNonEmptySuccess() {
    var input = "Hello, world!"[...]
    XCTAssertEqual("Hello", CharacterSet.alphanumerics.nonEmpty.parse(&input))
    XCTAssertEqual(", world!", input)
  }

  func testNonEmptyFailure() {
    var input = " Hello, world!"[...]
    XCTAssertEqual(nil, CharacterSet.alphanumerics.nonEmpty.parse(&input))
    XCTAssertEqual(" Hello, world!", input)
  }
  
  func testAtLeastSuccess() {
    var input = "Hello, world!"[...]
    XCTAssertEqual("Hello", CharacterSet.alphanumerics.atLeast(1).parse(&input))
    XCTAssertEqual(", world!", input)
  }

  func testAtLeastFailure() {
    var input = " Hello, world!"[...]
    XCTAssertEqual(nil, CharacterSet.alphanumerics.atLeast(6).parse(&input))
    XCTAssertEqual(" Hello, world!", input)
  }
}
