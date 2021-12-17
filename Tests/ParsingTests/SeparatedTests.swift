import Parsing
import XCTest

final class SeparatedTests: XCTestCase {
  func testSeparated3() {
    let parser = Separated3(
      Int.parser(),
      CharacterSet.lowercaseLetters,
      Int.parser(),
      separator: ","
    )
    
    var input = "1,a,2,b,3,c,4,d,5,e,6,f"[...]
    let parsed = parser.parse(&input)
    XCTAssertEqual(1, parsed?.0)
    XCTAssertEqual("a", parsed?.1)
    XCTAssertEqual(2, parsed?.2)
    XCTAssertEqual(",b,3,c,4,d,5,e,6,f", input)
  }
  
  func testSeparated4() {
    let parser = Separated4(
      Int.parser(),
      CharacterSet.lowercaseLetters,
      Int.parser(),
      CharacterSet.lowercaseLetters,
      separator: ","
    )
    
    var input = "1,a,2,b,3,c,4,d,5,e,6,f"[...]
    let parsed = parser.parse(&input)
    XCTAssertEqual(1, parsed?.0)
    XCTAssertEqual("a", parsed?.1)
    XCTAssertEqual(2, parsed?.2)
    XCTAssertEqual("b", parsed?.3)
    XCTAssertEqual(",3,c,4,d,5,e,6,f", input)
  }
}
