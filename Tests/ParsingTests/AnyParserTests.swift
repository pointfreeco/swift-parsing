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
    XCTAssertEqual(", world!", input)

    XCTAssertNil(parser.parse(&input))
    XCTAssertEqual(", world!", input)
  }

  func testParserInitializer() {
    let parser = AnyParser(StartsWith<Substring>("Hello"))

    var input = "Hello, world!"[...]
    XCTAssertNotNil(parser.parse(&input))
    XCTAssertEqual(", world!", input)

    XCTAssertNil(parser.parse(&input))
    XCTAssertEqual(", world!", input)
  }

  func testParserEraseToAnyParser() {
    let parser = StartsWith<Substring>("Hello").eraseToAnyParser()

    var input = "Hello, world!"[...]
    XCTAssertNotNil(parser.parse(&input))
    XCTAssertEqual(", world!", input)

    XCTAssertNil(parser.parse(&input))
    XCTAssertEqual(", world!", input)
  }

  func testAnyParserEraseToAnyParser() {
    let parser = StartsWith<Substring>("Hello").eraseToAnyParser().eraseToAnyParser()

    var input = "Hello, world!"[...]
    XCTAssertNotNil(parser.parse(&input))
    XCTAssertEqual(", world!", input)

    XCTAssertNil(parser.parse(&input))
    XCTAssertEqual(", world!", input)
  }
}
