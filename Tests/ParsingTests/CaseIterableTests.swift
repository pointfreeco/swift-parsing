import Parsing
import XCTest

final class CaseIterableTests: XCTestCase {
  func testCaseIterableParser() throws {
    enum Person: String, CaseIterable {
      case blob = "Blob"
      case blobJr = "Blob Jr"
    }

    struct People: Parser {
      var body: some Parser<Substring.UTF8View, [Person]> {
        Many {
          Person.parser()
        } separator: {
          ",".utf8
        } terminator: {
          End()
        }
      }
    }

    var input = "Blob,Blob Jr"[...].utf8
    XCTAssertEqual(try People().parse(&input), [.blob, .blobJr])

    input = "Blob Jr,Blob"[...].utf8
    XCTAssertEqual(try People().parse(&input), [.blobJr, .blob])

    input = "Blob,Mr Blob"[...].utf8
    XCTAssertThrowsError(try People().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:6
        1 | Blob,Mr Blob
          |      ^ expected "Blob Jr"
          |      ^ expected "Blob"

        error: unexpected input
         --> input:1:5
        1 | Blob,Mr Blob
          |     ^ expected end of input
        """,
        "\(error)"
      )
    }
  }
}
