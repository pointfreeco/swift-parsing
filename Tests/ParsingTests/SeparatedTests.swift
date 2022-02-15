import Parsing
import XCTest

final class SeparatedTests: XCTestCase {
  
  func testSeparated() throws {
    var input = "1,2,3,4"[...]
    let parser = Separated {
      Int.parser()
      Int.parser()
      Int.parser()
      Int.parser()
    } separator: {
      ","
    }
    let parsed = try parser.parse(&input)

    XCTAssertEqual(parsed.0, 1)
    XCTAssertEqual(parsed.1, 2)
    XCTAssertEqual(parsed.2, 3)
    XCTAssertEqual(parsed.3, 4)

    XCTAssertEqual("", input)
  }
  
  func testSeparatedFails()  {
    var input = "1,2,3;4"[...]
    let parser = Separated {
      Int.parser()
      Int.parser()
      Int.parser()
      Int.parser()
    } separator: {
      ","
    }

    XCTAssertThrowsError(try parser.parse(&input))
  }
  
  func testInitiatedSeparatedTerminated() throws {
    var input = "[1,2,3,4]"[...]
    let parser = Separated {
      Int.parser()
      Int.parser()
      Int.parser()
      Int.parser()
    } initiator: {
      "["
    } separator: {
      ","
    } terminator: {
      "]"
    }
    
    let parsed = try parser.parse(&input)

    XCTAssertEqual(parsed.0, 1)
    XCTAssertEqual(parsed.1, 2)
    XCTAssertEqual(parsed.2, 3)
    XCTAssertEqual(parsed.3, 4)

    XCTAssertEqual("", input)
  }
}
