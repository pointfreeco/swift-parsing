import Parsing
import XCTest

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *)
final class CheckTaskCancellationTests: XCTestCase {
  #if canImport(_Concurrency) && compiler(>=5.5.2)
  func testCheckClassCancellation() async throws {
    let parser = Many {
      CheckTaskCancellation()
      Digits(1)
    } separator: {
      ","
    }

    let count = 1_000_000

    let task = Task { () -> [Int] in 
      var values = Array(repeating: "1", count: count).joined(separator: ",")[...]
      return try parser.parse(&values)
    }
    // We let the task run for a little while before canceling it:
    try await Task.sleep(nanoseconds: NSEC_PER_SEC / 10)
    task.cancel()
    // The parser shouldn't have had the time to parse all the digits, and should have stopped
    // where it was was when the task was canceled:
    let result = try await task.value
    XCTAssert(result.count > 0)
    XCTAssert(result.count < count)
  }
  #endif
}
