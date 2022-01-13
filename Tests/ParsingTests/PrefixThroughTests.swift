import CustomDump
import Parsing
import XCTest

final class PrefixThroughTests: XCTestCase {
  func testSuccess() {
    var input = "Hello,world, 42!"[...]
    XCTAssertNoDifference("Hello,world, ", PrefixThrough(", ").parse(&input))
    XCTAssertNoDifference("42!", input)
  }

  func testSuccessIsEmpty() {
    var input = "Hello, world!"[...]
    XCTAssertNoDifference("", PrefixThrough("").parse(&input))
    XCTAssertNoDifference("Hello, world!", input)
  }

  func testFailureIsEmpty() {
    var input = ""[...]
    XCTAssertNoDifference(nil, PrefixThrough(", ").parse(&input))
    XCTAssertNoDifference("", input)
  }

  func testFailureNoMatch() {
    var input = "Hello world!"[...]
    XCTAssertNoDifference(nil, PrefixThrough(", ").parse(&input))
    XCTAssertNoDifference("Hello world!", input)
  }

  func testUTF8() {
    var input = "Hello,world, 42!"[...].utf8
    XCTAssertNoDifference("Hello,world, ", PrefixThrough(", ".utf8).parse(&input).map(Substring.init))
    XCTAssertNoDifference("42!", Substring(input))
  }
}
