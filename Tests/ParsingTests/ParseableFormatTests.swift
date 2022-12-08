#if swift(>=5.7) && (os(iOS) || os(macOS) || os(tvOS) || os(watchOS))
  import Parsing
  import XCTest

  @available(iOS 16, macOS 13, tvOS 16, watchOS 9, *)
  final class ParseableFormatStyleTests: XCTestCase {
    func testFormatted() {
      let p = ParsePrint {
        "TOTAL: "
        Formatted(.currency(code: "USD"))
      }

      XCTAssertEqual(
        try p.parse("TOTAL: $42.42"),
        42.42
      )
      XCTAssertEqual(
        try p.print(42.42),
        "TOTAL: $42.42"
      )
    }
  }
#endif
