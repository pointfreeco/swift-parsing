import Parsing
import URLRouting
import XCTest

class URLRoutingTests: XCTestCase {
  func testFormData() {
    let p = Body {
      FormData {
        Field("name", String.parser())
        Field("age", Int.parser())
      }
    }

    var request = URLRequestData(body: .init("name=Blob&age=42&debug=1".utf8))
    let (name, age) = p.parse(&request)!
    XCTAssertEqual("Blob", name)
    XCTAssertEqual(42, age)
    XCTAssertEqual("debug=1", request.body.map { String(decoding: $0, as: UTF8.self) })
  }

  func testHeaders() {
    let p = Headers {
      Field("X-Haha", String.parser())
    }

    var req = URLRequest(url: URL(string: "/")!)
    req.addValue("Hello", forHTTPHeaderField: "X-Haha")
    req.addValue("Blob", forHTTPHeaderField: "X-Haha")
    var request = URLRequestData(request: req)!

    let name = p.parse(&request)
    XCTAssertEqual("Hello", name)
    XCTAssertEqual(["X-Haha": ["Blob"]], request.headers)
  }

  func testPath() {
    let p = Path {
      "hello"
      "world"
    }
  }

  func testQuery() {
    let p = Query {
      Field("name", String.parser())
      Field("age", Int.parser())
    }

    var request = URLRequestData(string: "/?name=Blob&age=42&debug=1")!
    let (name, age) = p.parse(&request)!
    XCTAssertEqual("Blob", name)
    XCTAssertEqual(42, age)
    XCTAssertEqual(["debug": ["1"]], request.query)
  }
}
