import Parsing
import XCTest

final class StreamTests: XCTestCase {
  func testBasics() {
    var stream = AnyIterator(
      sequence(state: 0) { state -> ArraySlice<UInt8>? in
        state += 1
        return state <= 20 ? ArraySlice("\(state)\n".utf8) : nil
      }
    )

    XCTAssertEqual(
      Array(
        try Stream {
          Int.parser(of: ArraySlice<UInt8>.self)
          Skip {
            Array("\n".utf8)
          }
        }
        .parse(&stream)
      ),
      Array(1...20)
    )
  }
}
