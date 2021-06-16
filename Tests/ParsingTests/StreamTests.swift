@testable import Parsing
import XCTest

final class StreamTests: XCTestCase {
  func testBasics() async throws {
    var stream = AnyIterator(
      sequence(state: 0) { state -> ArraySlice<UInt8>? in
        state += 1
        return state <= 20 ? ArraySlice("\(state)\n".utf8) : nil
      }
    )

    let _output = await Int.parser(of: ArraySlice<UInt8>.self)
      .skip(StartsWith("\n".utf8))
      .stream
      .parse(&stream)
    let output = try XCTUnwrap(
      _output
    )

    XCTAssertEqual(Array(output), Array(1...20))
  }

  @available(iOS 15.0, *)
  func testAsync() async throws {
    var lines = URL(string: "https://pointfreeco-blog.s3.amazonaws.com/numbers.txt")!.lines.map { Substring($0) }

    for try await line in lines {
      print(line == String(""))
    }

    AsyncSequenceParser(upstream: Int.parser(of: Substring.self))
      .parse(&lines)
  }
}
