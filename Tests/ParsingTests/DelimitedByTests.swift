import Parsing
import XCTest

final class DelimitedByTests: XCTestCase {
  func testDelimited() throws {
    let commaDelimited = DelimitedBy(","[...], .escapedBy("\\"))
    
    var input = "1234,567"[...]
    let parsed = try commaDelimited.parse(&input)
    XCTAssertEqual(parsed, "1234")
    XCTAssertEqual(input, ",567")
  }
  
  func testDelimitedEscaped() throws {
    let commaDelimited = DelimitedBy(","[...], .escapedBy("\\"))

    var input = "1234\\,5\\,67,"[...]
    var parsed = try commaDelimited.parse(&input)
    XCTAssertEqual(parsed, "1234\\,5\\,67")
    XCTAssertEqual(input, ",")
    
    input = "67,1234\\,5\\,"[...]
    parsed = try commaDelimited.parse(&input)
    XCTAssertEqual(parsed, "67")
    XCTAssertEqual(input, ",1234\\,5\\,")
  }
  
  func testDelimitedEnclosed() throws {
    let commaDelimited = DelimitedBy(","[...], .enclosedBy("\""))

    var input = "\"1234,5,\",67"[...]
    var parsed = try commaDelimited.parse(&input)
    XCTAssertEqual(parsed, "\"1234,5,\"")
    XCTAssertEqual(input, ",67")
    
    input = "67,\"1234,5,\""[...]
    parsed = try commaDelimited.parse(&input)
    XCTAssertEqual(parsed, "67")
    XCTAssertEqual(input, ",\"1234,5,\"")
  }
  
  func testDelimitedEnclosedWithDifferentBoundaries() throws {
    let commaDelimited = DelimitedBy(","[...], .enclosedBetween("[", "]"))

    var input = "[1234,5,],67"[...]
    var parsed = try commaDelimited.parse(&input)
    XCTAssertEqual(parsed, "[1234,5,]")
    XCTAssertEqual(input, ",67")
    
    input = "67,[1234,5,]"[...]
    parsed = try commaDelimited.parse(&input)
    XCTAssertEqual(parsed, "67")
    XCTAssertEqual(input, ",[1234,5,]")
  }
}
