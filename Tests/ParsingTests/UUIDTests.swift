import CustomDump
import Parsing
import XCTest

final class UUIDTests: XCTestCase {
  func testUUID() {
    let parser = UUID.parser(of: Substring.UTF8View.self)

    var input = "deadbeef-dead-beef-dead-beefdeadbeef Hello"[...].utf8
    XCTAssertNoDifference(
      UUID(uuidString: "deadbeef-dead-beef-dead-beefdeadbeef"),
      try parser.parse(&input)
    )
    XCTAssertNoDifference(" Hello", String(input))

    input = "DEADBEEF-DEAD-BEEF-DEAD-BEEFDEADBEEF Hello"[...].utf8
    XCTAssertNoDifference(
      UUID(uuidString: "deadbeef-dead-beef-dead-beefdeadbeef"), try parser.parse(&input)
    )
    XCTAssertNoDifference(" Hello", String(input))

    input = "DADBEEF-DEAD-BEEF-DEAD-BEEFDEADBEEF Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | DADBEEF-DEAD-BEEF-DEAD-BEEFDEADBEEF Hello
          | ^ expected UUID
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("DADBEEF-DEAD-BEEF-DEAD-BEEFDEADBEEF Hello", String(input))
  }
}
