import CustomDump
import Parsing
import XCTest
import _URLRouting

class URLRoutingTests: XCTestCase {
  func testFormData() throws {
    let p = Body {
      FormData {
        Field("name", Parse(.string))
        Field("age", Int.parser())
      }
    }

    var request = URLRequestData(body: .init("name=Blob&age=42&debug=1".utf8))
    let (name, age) = try p.parse(&request)
    XCTAssertEqual("Blob", name)
    XCTAssertEqual(42, age)
    XCTAssertEqual("debug=1", request.body.map { String(decoding: $0, as: UTF8.self) })
  }

  func testHeaders() throws {
    let p = Headers {
      Field("X-Haha", Parse(.string))
    }

    var req = URLRequest(url: URL(string: "/")!)
    req.addValue("Hello", forHTTPHeaderField: "X-Haha")
    req.addValue("Blob", forHTTPHeaderField: "X-Haha")
    var request = URLRequestData(request: req)!

    let name = try p.parse(&request)
    XCTAssertEqual("Hello", name)
    XCTAssertEqual(["X-Haha": ["Blob"]], request.headers)
  }

  func testPath() {
    let p = Path {
      "hello"
      "world"
    }
  }

  func testQuery() throws {
    let p = Query {
      Field("name", Parse(.string))
      Field("age", Int.parser())
    }

    var request = URLRequestData(string: "/?name=Blob&age=42&debug=1")!
    let (name, age) = try p.parse(&request)
    XCTAssertEqual("Blob", name)
    XCTAssertEqual(42, age)
    XCTAssertEqual(["debug": ["1"]], request.query)
  }

  func testQueryDefault() throws {
    let p = Query {
      Field("page", Int.parser(), default: 1)
    }

    var request = URLRequestData(string: "/")!
    let page = try p.parse(&request)
    XCTAssertEqual(1, page)
    XCTAssertEqual([:], request.query)

    XCTAssertNoDifference(
      try p.print(10),
      URLRequestData(query: ["page": ["10"]])
    )
    XCTAssertNoDifference(
      try p.print(1),
      URLRequestData(query: [:])
    )
  }

  func testQueryDefault2() throws {
    let p = Query {
      Field("page", Int.parser()).replaceError(with: 1)
    }

    var request = URLRequestData(string: "/")!
    let page = p.parse(&request)
    XCTAssertEqual(1, page)
    XCTAssertEqual([:], request.query)

    XCTAssertNoDifference(
      p.print(10),
      URLRequestData(query: ["page": ["10"]])
    )
    XCTAssertNoDifference(
      p.print(1),
      URLRequestData(query: [:])
    )
  }

  func testCookies() throws {
    struct Session: Equatable {
      var userId: Int
      var isAdmin: Bool
    }

    let p = Cookies/*(.destructure(Session.init(userId:isAdmin:)))*/ {
      Field("userId", Int.parser())
      Field("isAdmin", Bool.parser())
    }
    .map(.destructure(Session.init(userId:isAdmin:)))

    var request = URLRequestData(headers: ["cookie": ["userId=42; isAdmin=true"]])
    XCTAssertNoDifference(
      Session(userId: 42, isAdmin: true),
      try p.parse(&request)
    )
    XCTAssertNoDifference(
      URLRequestData(headers: ["cookie": ["isAdmin=true; userId=42"]]),
      try p.print(Session(userId: 42, isAdmin: true))
    )
  }

  func testJSONCookies() {
    struct Session: Codable, Equatable {
      var userId: Int
    }

    let p = Cookies {
      Field("pf_session", Parse(.utf8.data.json(Session.self)))
    }

    var request = URLRequestData(headers: ["cookie": [#"pf_session={"userId":42}; foo=bar"#]])
    XCTAssertNoDifference(
      Session(userId: 42),
      try p.parse(&request)
    )
    XCTAssertNoDifference(
      URLRequestData(headers: ["cookie": [#"pf_session={"userId":42}"#]]),
      try p.print(Session(userId: 42))
    )
  }

//  func testHost() {
//    let host = Host(PFHost.parser(rawValue: String.parser()))
//      .captureEnvironment(\.pfHost)
//
//    let staging = host
//      .environment(\.host, "staging.pointfree.co")
//
//    var input = URLRequestData(string: "http://staging.pointfree.co/foo")!
//    @ParserOutput var output = staging.parse(&input)
//
//    XCTAssertNoDifference(
//      staging.print(),
//      .init(host: "staging.pointfree.co", path: [])
//    )
//    XCTAssertEqual(_output.host, "staging.pointfree.co")
//  }
}

//enum PFHost: String {
//  case prod = "pointfree.co"
//  case staging = "staging.pointfree.co"
//  case localhost = "localhost:8080"
//}
//
//enum PFHostKey: EnvironmentKey {
//  static var value = PFHost.localhost
//}
//
//extension EnvironmentValues {
//  var pfHost: PFHost {
//    get { self[PFHostKey.self] }
//    set { self[PFHostKey.self] = newValue }
//  }
//}
