import Parsing
import XCTest

class NotTests: XCTestCase {
  func testNotUpstreamFails() throws {
    var input = """
      let foo = true
      let bar = false
      """[...]

    let uncommentedLine = Parse {
      Not { "//" }
      Prefix { $0 != "\n" }
      OneOf {
        "\n"
        End()
      }
    }

    XCTAssertEqual(try uncommentedLine.parse(&input), "let foo = true")
    XCTAssertEqual(input, "let bar = false")
  }

  func testNotUpstreamParses() throws {
    var input = """
      // a comment
      let foo = true
      """[...]

    let uncommentedLine = Parse {
      Not { "//" }
      Prefix { $0 != "\n" }
    }

    XCTAssertThrowsError(try uncommentedLine.parse(&input))
    XCTAssertEqual(
      input,
      """
      // a comment
      let foo = true
      """
    )
  }
}
