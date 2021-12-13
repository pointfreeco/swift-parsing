import Parsing
import XCTest

class EnvironmentTests: XCTestCase {
  func testEnvironmentWritingFusion() {
    let _: Parsers.EnvironmentKeyWritingParser<Prefix<Substring>> = Prefix { $0 != " " }
      .environment(\.skipSpaces, true)
      .environment(\.maximum, 10)
  }
}
