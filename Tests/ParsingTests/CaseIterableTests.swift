import Parsing
import XCTest

final class CaseIterableTests: XCTestCase {
  func testCaseIterableParser() throws {
    enum Person: String, CaseIterable, Equatable {
      case blob = "Blob"
      case blobJr = "Blob Jr"
    }

    let peopleParser = Many {
      Person.parser()
    } separator: {
      ",".utf8
    } terminator: {
      End()
    }

    var input = "Blob,Blob Jr"[...].utf8
    XCTAssertEqual(try peopleParser.parse(&input), [.blob, .blobJr])

    input = "Blob Jr,Blob"[...].utf8
    XCTAssertEqual(try peopleParser.parse(&input), [.blobJr, .blob])

    input = "Blob,Mr Blob"[...].utf8
    XCTAssertThrowsError(try peopleParser.parse(&input)) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:6
        1 | Blob,Mr Blob
          |      ^ expected case of "Person"

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
