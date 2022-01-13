import CustomDump
import Parsing
import XCTest

final class AnyParserTests: XCTestCase {
  func testClosureInitializer() {
    let parser = AnyParser<Substring, Void> { input in
      guard input.starts(with: "Hello") else { return nil }
      input.removeFirst(5)
      return ()
    }

    var input = "Hello, world!"[...]
    XCTAssertNotNil(parser.parse(&input))
    XCTAssertNoDifference(", world!", input)

    XCTAssertNil(parser.parse(&input))
    XCTAssertNoDifference(", world!", input)
  }

  func testParserInitializer() {
    let parser = AnyParser("Hello")

    var input = "Hello, world!"[...]
    XCTAssertNotNil(parser.parse(&input))
    XCTAssertNoDifference(", world!", input)

    XCTAssertNil(parser.parse(&input))
    XCTAssertNoDifference(", world!", input)
  }

  func testParserEraseToAnyParser() {
    let parser = "Hello".eraseToAnyParser()

    var input = "Hello, world!"[...]
    XCTAssertNotNil(parser.parse(&input))
    XCTAssertNoDifference(", world!", input)

    XCTAssertNil(parser.parse(&input))
    XCTAssertNoDifference(", world!", input)
  }

  func testAnyParserEraseToAnyParser() {
    let parser = "Hello".eraseToAnyParser().eraseToAnyParser()

    var input = "Hello, world!"[...]
    XCTAssertNotNil(parser.parse(&input))
    XCTAssertNoDifference(", world!", input)

    XCTAssertNil(parser.parse(&input))
    XCTAssertNoDifference(", world!", input)
  }
}
