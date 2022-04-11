import Parsing
import XCTest

final class MapTests: XCTestCase {
  func testSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertEqual("42", try Int.parser().map(String.init).parse(&input))
    XCTAssertEqual(" Hello, world!", Substring(input))
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

  func testConstantPrinting() {
    enum Person { case blob, blobJr, blobSr }
    XCTAssertThrowsError(
      try OneOf {
        "Blob Sr".map { Person.blobSr }
        "Blob".map { Person.blob }
      }
      .print(.blobJr)
    ) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: expected blob

        error: expected blobSr
        """,
        "\(error)"
      )
    }
  }
}
