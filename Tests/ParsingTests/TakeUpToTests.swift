import Parsing
import XCTest

final class TakeUpToTests: XCTestCase {
  func testSimple() throws {
    let parser = TakeUpTo {
      "."
    }

    var input = "123.456"[...]
    XCTAssertEqual("123", try parser.parse(&input).0)
  }

  func testUnterminated() throws {
    let parser = TakeUpTo {
      "."
    }

    var input = "123456"[...]

    XCTAssertThrowsError(try parser.parse(&input))
  }

  func testTakeUpToString() throws {
    let parser = TakeUpTo {
      "456".map { 456 }
    }
    var input = "123456"[...]
    let output = try parser.parse(&input)
    XCTAssertEqual("123", output.0)
    XCTAssertEqual(456, output.1)
  }

  func testTakeSubstring() throws {
    let parser = TakeUpTo {
      "456".map { 456 }
    }
    var input = "123456"[...]
    let output = try parser.parse(&input)
    XCTAssertEqual("123", output.0)
    XCTAssertEqual(456, output.1)
    XCTAssertEqual("", input)
  }

  func testTakeUpToEnd() throws {
    let parser = TakeUpTo {
      End<Substring>()
    }

    var input = "123"[...]
    XCTAssertEqual("123", try parser.parse(&input).0)
    XCTAssertEqual("", input)
  }
}
