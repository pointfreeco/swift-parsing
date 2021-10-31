import Parsing
import XCTest

final class URLRequestRouterTests: XCTestCase {
  func testPathLiteral() {
    var input = URLRequestData(url: .init(string: "/foo")!)!
    XCTAssertNotNil(Path("foo").parse(&input))
    XCTAssertEqual(input.path, [])
  }

  func testPathParser() {
    var input = URLRequestData(url: .init(string: "/42")!)!
    XCTAssertEqual(Path(Int.parser()).parse(&input), 42)
    XCTAssertEqual(input.path, [])
  }

  func testPathTrailingSlash() {
    var input = URLRequestData(url: .init(string: "/foo/")!)!
    XCTAssertNotNil(Path("foo").parse(&input))
    XCTAssertEqual(input.path, [])
  }

  func testQueryPathBasics() {
    var input = URLRequestData(url: .init(string: "?foo=bar")!)!
    XCTAssertEqual(Query("foo").parse(&input), "bar")
    XCTAssertEqual(input.query, [:])
  }

  func testQueryPathDefault() {
    var input = URLRequestData(url: .init(string: "?foo=bar")!)!
    XCTAssertEqual(Query("baz", default: "blob").parse(&input), "blob")
    XCTAssertEqual(input.query, ["foo":["bar"]])
  }

  func testQueryPathDuplicateName() {
    var input = URLRequestData(url: .init(string: "?foo=bar&foo=baz")!)!
    XCTAssertEqual(Query("foo").parse(&input), "bar")
    XCTAssertEqual(input.query, ["foo": ["baz"]])
  }

  // TODO: how to handle this?
  func testQueryPathNoValue() {
    var input = URLRequestData(url: .init(string: "?foo")!)!
    XCTAssertEqual(Query("foo").parse(&input), "")
    XCTAssertEqual(input.query, [:])
  }
}
