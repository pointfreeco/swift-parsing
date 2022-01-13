import CustomDump
import Parsing
import XCTest

final class SkipTests: XCTestCase {
  func testSkipFirstSuccess() {
    var input = "Hello, 42!"[...].utf8
    XCTAssertNoDifference(42, "Hello, ".utf8.take(Int.parser()).parse(&input))
    XCTAssertNoDifference("!", Substring(input))
  }

  func testSkipFirstFailedFirst() {
    var input = "Hello, 42!"[...].utf8
    XCTAssertNoDifference(nil, "Goodbye, ".utf8.take(Int.parser()).parse(&input))
    XCTAssertNoDifference("Hello, 42!", Substring(input))
  }

  func testSkipFirstFailedSecond() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNoDifference(nil, "Hello, ".utf8.take(Int.parser()).parse(&input))
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }

  func testSkipSecondSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertNoDifference(42, Int.parser().skip(" Hello, ".utf8).parse(&input))
    XCTAssertNoDifference("world!", Substring(input))
  }

  func testSkipSecondFailedFirst() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNoDifference(nil, Int.parser().skip(" Hello, ".utf8).parse(&input))
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }

  func testSkipSecondFailedSecond() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssertNoDifference(nil, Int.parser().skip(" Goodbye, ".utf8).parse(&input))
    XCTAssertNoDifference("42 Hello, world!", Substring(input))
  }

  func testSkipSuccess() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssert(try () == XCTUnwrap(Skip(Int.parser()).parse(&input)))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }

  func testSkipFailure() {
    var input = "Hello, world!"[...].utf8
    XCTAssertNil(Skip(Int.parser()).parse(&input))
    XCTAssertNoDifference("Hello, world!", Substring(input))
  }

  func testIgnoreOutput() {
    var input = "42 Hello, world!"[...].utf8
    XCTAssert(try () == XCTUnwrap(Int.parser().ignoreOutput().parse(&input)))
    XCTAssertNoDifference(" Hello, world!", Substring(input))
  }
}
