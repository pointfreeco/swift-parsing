import Parsing
import XCTest

final class MapTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertEqual("42", try Int.parser().map(String.init).parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
  }
    
  func testFail() {
    enum MyError: String, Error, Equatable {
      case fails
    }
    
    var input = "42 Hello, world!"[...].utf8
    XCTAssertThrowsError(try Int.parser().map { _ in throw MyError.fails }.parse(&input)) { error in
      XCTAssertEqual(error as? MyError, MyError.fails)
    }
    XCTAssertEqual(Substring(input), " Hello, world!"[...])
  }

  func testOverloadArray() {
    let array = [1].map { "\($0)" }
    XCTAssert(type(of: array) == Array<String>.self)
  }

  func testOverloadString() {
    let array = "abc".map { "\($0)" }
    XCTAssert(type(of: array) == Array<String>.self)
  }

  func testOverloadUnicodeScalars() {
    let array = "abc".unicodeScalars.map { "\($0)" }
    XCTAssert(type(of: array) == Array<String>.self)
  }

  func testOverloadUTF8View() {
    let array = "abc".utf8.map { "\($0)" }
    XCTAssert(type(of: array) == Array<String>.self)
  }
}
