import CustomDump
import Parsing
import XCTest

class NotTests: XCTestCase {
  func testNotUpstreamFails() {
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

    XCTAssertNoDifference(try uncommentedLine.parse(&input), "let foo = true")
    XCTAssertNoDifference(input, "let bar = false")
  }

  func testNotUpstreamParses() {
    var input = """
      // a comment
      let foo = true
      """[...]

    let uncommentedLine = Parse {
      Not { "//" }
      Prefix { $0 != "\n" }
    }

    XCTAssertThrowsError(try uncommentedLine.parse(&input))
    XCTAssertNoDifference(
      input,
      """
      // a comment
      let foo = true
      """
    )
  }
}
