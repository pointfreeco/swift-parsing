import Parsing
import XCTest

final class DelimitedByTests: XCTestCase {
  func testSuccess() {
    var input = "(Hello,world), 42!"[...]
    XCTAssertEqual("Hello,world", DelimitedBy("(", ")").parse(&input))
    XCTAssertEqual(", 42!", input)
  }
  
  func testSuccessIsNested() {
    var input = "(Hel(l(o)),(world)), 42!"[...]
    XCTAssertEqual("Hel(l(o)),(world)", DelimitedBy("(", ")").parse(&input))
    XCTAssertEqual(", 42!", input)
  }
  
  func testSuccessSameDelimiters() {
    var input = "-Hello,world-, 42!"[...]
    XCTAssertEqual("Hello,world", DelimitedBy("-").parse(&input))
    XCTAssertEqual(", 42!", input)
  }
  
  func testSuccessSameDelimitersNested() {
    var input = "-Hello,-world--, 42!"[...]
    XCTAssertEqual("Hello,", DelimitedBy("-").parse(&input))
    XCTAssertEqual("world--, 42!", input)
  }
  
  func testSuccessStartIsEmpty() {
    var input = "(Hello,(world)), 42!"[...]
    XCTAssertEqual("(Hello,(world", DelimitedBy("", ")").parse(&input))
    XCTAssertEqual("), 42!", input)
  }
  
  func testSuccessEndIsEmpty() {
    var input = "(Hello,(world)), 42!"[...]
    XCTAssertEqual("", DelimitedBy("(", "").parse(&input))
    XCTAssertEqual("Hello,(world)), 42!", input)
  }
  
  func testSuccessStartAndEndAreEmpty() {
    var input = "(Hello,(world)), 42!"[...]
    XCTAssertEqual("", DelimitedBy("", "").parse(&input))
    XCTAssertEqual("(Hello,(world)), 42!", input)
  }
  
  func testSuccessIsEmptyStartAndEndAreEmpty() {
    var input = ""[...]
    XCTAssertEqual("", DelimitedBy("").parse(&input))
    XCTAssertEqual("", input)
  }
  
  func testFailureExceedingMaxLevel() {
    var input = "(Hello,(world)), 42!"[...]
    XCTAssertEqual(nil, DelimitedBy("(", ")", maxLevel: 1).parse(&input))
    XCTAssertEqual("(Hello,(world)), 42!", input)
  }
  
  func testFailureIsEmpty() {
    var input = ""[...]
    XCTAssertEqual(nil, DelimitedBy("(", ")").parse(&input))
    XCTAssertEqual("", input)
  }

  func testUTF8() {
    var input = "(Hello,(world)), 42!"[...].utf8
    XCTAssertEqual("Hello,(world)", DelimitedBy("(".utf8, ")".utf8).parse(&input).map(Substring.init))
    XCTAssertEqual(", 42!", Substring(input))
  }
}
