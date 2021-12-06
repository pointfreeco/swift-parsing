import CustomDump
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

  func testHost() {
    let host = Host(PFHost.parser())
      .captureEnvironment(\.pfHost)

    let staging = host
      .environment(\.host, "staging.pointfree.co")

    var input = URLRequestData(string: "http://staging.pointfree.co/foo")!
    @ParserOutput var output = staging.parse(&input)

    XCTAssertNoDifference(
      staging.print(),
      .init(host: "staging.pointfree.co", path: [])
    )
    XCTAssertEqual(_output.host, "staging.pointfree.co")
  }
}

enum PFHost: String {
  case prod = "pointfree.co"
  case staging = "staging.pointfree.co"
  case localhost = "localhost:8080"
}

enum PFHostKey: EnvironmentKey {
  static var value = PFHost.localhost
}
extension EnvironmentValues {
  var pfHost: PFHost {
    get { self[PFHostKey.self] }
    set { self[PFHostKey.self] = newValue }
  }
}
