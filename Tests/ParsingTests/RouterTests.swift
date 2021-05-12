import Parsing
import XCTest

final class RouterTests: XCTestCase {
  func testRoute() {
    enum Route { case foo(Int?) }

    let p = Optional.parser(of: QueryItem("hello", Int.parser())).map(/Route.foo)

    XCTAssertEqual(p.print(.foo(1)), Request(query: [.init(name: "hello", value: "1")]))
    XCTAssertEqual(p.print(.foo(nil)), Request(query: []))
  }
}
