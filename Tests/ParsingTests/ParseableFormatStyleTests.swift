import Parsing
import XCTest

@available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
final class ParseableFormatStyleTests: XCTestCase {
  func testCurrency() {
    let parser = Rest<Substring>().map(.string.formatted(.currency(code: "USD")))

    XCTAssertEqual(try parser.parse("$10.00"), 10)
    XCTAssertEqual(try parser.print(10), "$10.00")
  }
}
