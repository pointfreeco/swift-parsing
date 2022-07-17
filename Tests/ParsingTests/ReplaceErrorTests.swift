import Parsing
import XCTest

final class ReplaceErrorTests: XCTestCase {
  func testBacktracks() {
    var input = "123"[...]
    XCTAssertEqual(
      0,
      Parse {
        Int.parser()
        "!"
      }.replaceError(with: 0).parse(&input))
    XCTAssertEqual("123", input)
  }
  
  func testCoalescingParser() {
    var input = "abc"[...]
    XCTAssertEqual(
      "default",
      Parse {
        PrefixUpTo("123") ?? "default"
      }.parse(&input))
    XCTAssertEqual("abc", input)
  }
  
  func testCoalescingNonNilOptionalParser() {
    var input = "abc"[...]
    let maybePrefix: PrefixUpTo<Substring>? = .init("123")
    XCTAssertEqual(
      "default",
      Parse {
        maybePrefix ?? "default"
      }.parse(&input))
    XCTAssertEqual("abc", input)
  }
  
  func testCoalescingNilOptionalParser() {
    var input = "abc"[...]
    let maybePrefix: PrefixUpTo<Substring>? = nil
    XCTAssertEqual(
      "default",
      Parse {
        maybePrefix ?? "default"
      }.parse(&input))
    XCTAssertEqual("abc", input)
  }
  
  func testCoalescingOptionallyParser() {
    var input = "abc"[...]
    XCTAssertEqual(
      "default",
      Parse {
        Optionally { PrefixUpTo("123") } ?? "default"
      }.parse(&input))
    XCTAssertEqual("abc", input)
  }
}
