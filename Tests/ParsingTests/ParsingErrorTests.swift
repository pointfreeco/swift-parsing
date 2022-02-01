@testable import Parsing
import XCTest

class ParsingErrorTests: XCTestCase {
  func testUnknownInput() {
    struct MyInput {}
    struct MyOutput {}
    struct MyParser: Parser {
      func parse(_ input: inout MyInput) throws -> MyOutput {
        struct MyError: Error {}
        throw MyError()
      }
    }
    XCTAssertThrowsError(try Parse { MyParser(); MyParser() }.parse(MyInput())) { error in
      XCTAssertEqual(
        """
        error: MyError()
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
  }
}
