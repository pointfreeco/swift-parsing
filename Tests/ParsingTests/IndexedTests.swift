import Parsing
import XCTest

private struct Output: Equatable {
  var username: Substring
  var range: Range<String.Index>
}

final class IndexedTests: XCTestCase {
  func testStringHappyPath() throws {
    let input = "Hi @BlobJr; please call @BlobSr when you get a chance. Thanks."
    let parser: some Parser<Substring.UTF8View, [Output]> = Many {
      Skip {
        PrefixUpTo("@".utf8)
      }

      From(.substring) {
        Parse {
          "@"

          Prefix(while: { $0.isLetter || $0.isNumber })
        }
        .indexed()
      }
      .map(Output.init)
    } terminator: {
      Rest()
    }
    let usernames = try parser.parse(input)
    XCTAssertEqual(
      usernames,
      [
        Output(
          username: "BlobJr",
          range: input
            .index(input.startIndex, offsetBy: 3)..<input.index(input.startIndex, offsetBy: 10)
        ),
        Output(
          username: "BlobSr",
          range: input
            .index(input.startIndex, offsetBy: 24)..<input.index(input.startIndex, offsetBy: 31)
        )
      ]
    )
  }
}
