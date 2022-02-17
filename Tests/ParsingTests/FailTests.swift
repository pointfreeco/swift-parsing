import CustomDump
import Parsing
import XCTest

final class FailTests: XCTestCase {
  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertThrowsError(try Fail<Substring, Int>().parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: failed
         --> input:1:1
        1 | Hello, world!
          | ^
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("Hello, world!", input)
  }

  func testCustomError() {
    struct MyError: Error {}

    XCTAssertThrowsError(try Fail<Substring, Int>(throwing: MyError()).parse("Hello")) { error in
      XCTAssertNoDifference(
        """
        error: MyError()
         --> input:1:1
        1 | Hello
          | ^
        """,
        "\(error)"
      )
    }
  }
}
