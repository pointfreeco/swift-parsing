import Parsing
import XCTest

final class PrefixThroughTests: XCTestCase {
  func testSuccess() {
    var input = "Hello,world, 42!"[...]
    XCTAssertEqual("Hello,world, ", try PrefixThrough(", ").parse(&input))
    XCTAssertEqual("42!", input)
  }

  func testSuccessIsEmpty() {
    var input = "Hello, world!"[...]
    XCTAssertEqual("", try PrefixThrough("").parse(&input))
    XCTAssertEqual("Hello, world!", input)
  }

  func testFailureIsEmpty() {
    var input = ""[...]
    XCTAssertThrowsError(try PrefixThrough(", ").parse(&input))
    XCTAssertEqual("", input)
  }

  func testFailureNoMatch() {
    var input = "Hello world!"[...]
    XCTAssertThrowsError(try PrefixThrough(", ").parse(&input))
    XCTAssertEqual("Hello world!", input)
  }

  func testUTF8() {
    var input = "Hello,world, 42!"[...].utf8
    XCTAssertEqual("Hello,world, ", Substring(try PrefixThrough(", ".utf8).parse(&input)))
    XCTAssertEqual("42!", Substring(input))
  }

  func testPrint() {
    XCTAssertEqual("Hello,world, ", PrefixThrough(", ").print("Hello,world, "))
    XCTAssertNil(PrefixThrough(", ").print("Hello,world, 42!"))
    XCTAssertNil(PrefixThrough(", ").print("Hello,world, 42, "))
  }
}
