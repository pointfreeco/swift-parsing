import Parsing
import XCTest

class ParserPrinterTests: XCTestCase {
  func testBasics() {
    let p = Parse {
      OneOf {
        "Hello"
        "Goodbye"
      }
      ", "
      Int.parser(of: Substring.self)
      "."
    }
    XCTAssertEqual(
      p.parse(
        """
        Hello, 42.
        """
      ),
      42
    )
    XCTAssertEqual(
      p.parse(
        """
        Goodbye, 42.
        """
      ),
      42
    )
    XCTAssertEqual(
      p.print(42),
      "Hello, 42."
    )
  }

  func testUUID() {
    let p = UUID.parser(of: Substring.self)
    
    XCTAssertEqual(
      p.parse("deadbeef-dead-beef-dead-beefdeadbeef"),
      UUID(uuidString: "deadbeef-dead-beef-dead-beefdeadbeef")!
    )

    XCTAssertEqual(
      p.print(UUID(uuidString: "deadbeef-dead-beef-dead-beefdeadbeef")!),
     "DEADBEEF-DEAD-BEEF-DEAD-BEEFDEADBEEF"
    )
  }

  func testRawRepresentable() {
    enum Ok: String, Equatable {
      case foo
      case bar
    }

    let p = String.parser(of: Substring.self).pipe { Ok.parser() }

    XCTAssertEqual(
      p.parse("foo"),
      .foo
    )

    XCTAssertEqual(
      p.print(.bar),
      "bar"
    )
  }
}
