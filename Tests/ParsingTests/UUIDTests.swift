import CustomDump
import Parsing
import XCTest

final class UUIDTests: XCTestCase {
  func testUUID() {
    let parser = UUID.parser(of: Substring.UTF8View.self)

    var input = "deadbeef-dead-beef-dead-beefdeadbeef Hello"[...].utf8
    XCTAssertNoDifference(UUID(uuidString: "deadbeef-dead-beef-dead-beefdeadbeef"), parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "DEADBEEF-DEAD-BEEF-DEAD-BEEFDEADBEEF Hello"[...].utf8
    XCTAssertNoDifference(UUID(uuidString: "deadbeef-dead-beef-dead-beefdeadbeef"), parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "DADBEEF-DEAD-BEEF-DEAD-BEEFDEADBEEF Hello"[...].utf8
    XCTAssertNoDifference(nil, parser.parse(&input))
    XCTAssertNoDifference("DADBEEF-DEAD-BEEF-DEAD-BEEFDEADBEEF Hello", String(input))
  }
}
