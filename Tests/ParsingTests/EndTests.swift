import CustomDump
import Parsing
import XCTest

final class EndTests: XCTestCase {
  func testSuccess() {
    var input = ""[...]
    XCTAssertNoThrow(try End().parse(&input))
    XCTAssertNoDifference("", input)
  }

  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertThrowsError(try End().parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello, world!
          | ^ expected end of input
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("Hello, world!", input)
  }

  func testPrintSuccess() {
    var input = ""[...]
    XCTAssertNoThrow(try End().print(into: &input))
    XCTAssertNoDifference(input, ""[...])
  }

  func testPrintFailure() {
    var input = "Hello, world!"[...]
    XCTAssertThrowsError(try End().print(into: &input))
    XCTAssertNoDifference(input, "Hello, world!"[...])
  }

  func testTrailingWhitespace() {
    XCTAssertThrowsError(try Int.parser().parse("123   ")) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:4
        1 | 123␣␣␣
          |    ^ expected end of input
        """,
        "\(error)"
      )
    }
  }

//  func testFoo() throws {
//    let quotedField = Parse {
//      "\""
//      Prefix { $0 != "\"" }
//      "\""
//    }
//    let field = OneOf {
//      quotedField
//      Prefix { $0 != "," }
//    }
//      .map(String.init)
//
//    try field.print("Blob, Esq.")
//  }
}
