import Parsing
import XCTest

final class ConversionTests: XCTestCase {
  func testUnsafeBitCast() {
    struct One: Equatable { let a: Int }
    struct Two: Equatable { let a, b: Int }
    struct Three: Equatable { let a, b, c: Int }

    XCTAssertEqual(Conversion.unsafeBitCast(to: One.init).apply(1), .init(a: 1))
    XCTAssertEqual(Conversion.unsafeBitCast(to: One.init).unapply(.init(a: 1)), 1)
    XCTAssertEqual(Conversion.unsafeBitCast(to: Two.init).apply((1, 2)), .init(a: 1, b: 2))
    XCTAssert(Conversion.unsafeBitCast(to: Two.init).unapply(.init(a: 1, b: 2)) == (1, 2))

    XCTAssertEqual(
      Conversion.unsafeBitCast(to: Three.init).apply((1, 2, 3)),
      .init(a: 1, b: 2, c: 3)
    )
    XCTAssert(
      Conversion.unsafeBitCast(to: Three.init).unapply(.init(a: 1, b: 2, c: 3)) == (1, 2, 3)
    )
  }

  func testFailure() {
    var input = "Hello, world!"[...]
    XCTAssertNil(End().parse(&input))
    XCTAssertEqual("Hello, world!", input)
  }
}
