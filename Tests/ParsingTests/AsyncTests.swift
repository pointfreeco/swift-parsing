import Parsing
import XCTest

@available(macOS 12, iOS 15, *)
final class AsyncTests: XCTestCase {
  func testBasics() async throws {
    let xs = try await StartsWith<Substring>("<!DOCTYPE html>")
      .async
      .parse(URL(string: "https://www.pointfree.co/")!.lines)

    print(xs)
  }
}
