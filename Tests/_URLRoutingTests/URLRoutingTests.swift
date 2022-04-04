import Parsing
import XCTest
import _URLRouting

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

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
      Field("page", Int.parser()).replaceError(with: 1)
    }

    var request = URLRequestData(string: "/")!
    let page = p.parse(&request)
    XCTAssertEqual(1, page)
    XCTAssertEqual([:], request.query)

    XCTAssertEqual(
      p.print(10),
      URLRequestData(query: ["page": ["10"]])
    )
    XCTAssertEqual(
      p.print(1),
      URLRequestData(query: [:])
    )
  }

  func testCookies() throws {
    struct Session: Equatable {
      var userId: Int
      var isAdmin: Bool
    }

    let p = Cookies /*(.destructure(Session.init(userId:isAdmin:)))*/ {
      Field("userId", Int.parser())
      Field("isAdmin", Bool.parser())
    }
    .map(.memberwise(Session.init(userId:isAdmin:)))

    var request = URLRequestData(headers: ["cookie": ["userId=42; isAdmin=true"]])
    XCTAssertEqual(
      Session(userId: 42, isAdmin: true),
      try p.parse(&request)
    )
    XCTAssertEqual(
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
    XCTAssertEqual(
      Session(userId: 42),
      try p.parse(&request)
    )
    XCTAssertEqual(
      URLRequestData(headers: ["cookie": [#"pf_session={"userId":42}"#]]),
      try p.print(Session(userId: 42))
    )
  }

  func testBaseURL() throws {
    enum AppRoute { case home, episodes }

    let router = OneOf {
      Route(AppRoute.home)
      Route(AppRoute.episodes) {
        Path { "episodes" }
      }
    }

    XCTAssertEqual(
      "https://api.pointfree.co/v1/episodes?token=deadbeef",
      URLRequest(
        data: try router
          .baseURL("https://api.pointfree.co/v1?token=deadbeef")
          .print(.episodes)
      )?.url?.absoluteString
    )
  }
}
