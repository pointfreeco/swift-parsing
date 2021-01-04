import Parsing
import XCTest

final class EnumTests: XCTestCase {
  enum Example: String, CaseIterable, CaseParsable {
    case one
    case two
  }

  func testSuccess() {
    var input = "one"[...]
    XCTAssertEqual(.one, Parsers.enumRawValue(in: Example.allCases).parse(&input))
    XCTAssertEqual("", input)
  }

  func testFailure() {
    var input = "one"[...]
    XCTAssertNil(Parsers.enumRawValue(in: [Example.two]).parse(&input))
    XCTAssertEqual("one", input)
  }

  func testCaseParsableWithSpecificCases() {
    var input = "one"[...]
    XCTAssertEqual(.one, Example.firstMatchingCase(in: [Example.one]).parse(&input))
    XCTAssertEqual("", input)
  }

  func testCaseParsableWithAllCases() {
    var input = "one"[...]
    XCTAssertEqual(.one, Example.firstMatchingCase.parse(&input))
    XCTAssertEqual("", input)
  }
}
