import Parsing
import XCTest

final class CaseIterableRawRepresentableTests: XCTestCase {
  func testParserStringRawValue() throws {
    enum Person: String, CaseIterable {
      case blob = "Blob"
      case blobJr = "Blob Jr"
    }

    let peopleParser = Parse(input: Substring.UTF8View.self) {
      Many {
        Person.parser()
      } separator: {
        ",".utf8
      } terminator: {
        End()
      }
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

  func testParserIntRawValue() throws {
    enum Person: Int, CaseIterable {
      case blob = 4
      case blobJr = 42
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

    var input = "4,42"[...].utf8
    XCTAssertEqual(try People().parse(&input), [.blob, .blobJr])

    input = "42,4"[...].utf8
    XCTAssertEqual(try People().parse(&input), [.blobJr, .blob])

    input = "42,100"[...].utf8
    XCTAssertThrowsError(try People().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:4
        1 | 42,100
          |    ^ expected "42"
          |    ^ expected "4"

        error: unexpected input
         --> input:1:3
        1 | 42,100
          |   ^ expected end of input
        """,
        "\(error)"
      )
    }
  }

  func testParserNegativeIntRawValue() throws {
    enum Person: Int, CaseIterable {
      case blob = -4
      case blobJr = -42
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

    var input = "-4,-42"[...].utf8
    XCTAssertEqual(try People().parse(&input), [.blob, .blobJr])

    input = "-42,-4"[...].utf8
    XCTAssertEqual(try People().parse(&input), [.blobJr, .blob])

    input = "-42,-100"[...].utf8
    XCTAssertThrowsError(try People().parse(&input)) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:5
        1 | -42,-100
          |     ^ expected "-42"
          |     ^ expected "-4"

        error: unexpected input
         --> input:1:4
        1 | -42,-100
          |    ^ expected end of input
        """,
        "\(error)"
      )
    }
  }
}
