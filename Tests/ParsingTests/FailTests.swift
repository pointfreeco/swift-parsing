import Parsing
import XCTest

final class FailTests: XCTestCase {
  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertThrowsError(try Fail<Substring, Int>().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: failed
         --> input:1:1
        1 | Hello, world!
          | ^
        """,
        "\(error)"
      )
    }
    XCTAssertEqual("Hello, world!", input)

    XCTAssertThrowsError(try Fail<Substring, Int>().print(42)) { error in
      XCTAssertEqual(
        """
        error: failed

        A failing parser-printer attempted to print:

        42
        """,
        "\(error)"
      )
    }
  }

  func testCustomError() {
    struct MyError: Error {}

    XCTAssertThrowsError(try Fail<Substring, Int>(throwing: MyError()).parse("Hello")) { error in
      XCTAssertEqual(
        """
        error: MyError()
         --> input:1:1
        1 | Hello
          | ^
        """,
        "\(error)"
      )
    }

    XCTAssertThrowsError(try Fail<Substring, Int>(throwing: MyError()).print(42)) { error in
      XCTAssertEqual(
        """
        error: MyError()

        A failing parser-printer attempted to print:

        42
        """,
        "\(error)"
      )
    }
  }
}
