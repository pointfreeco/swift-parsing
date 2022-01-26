@testable import Parsing
import XCTest

class ManyTests: XCTestCase {
  func testNoSeparator() {
    var input = "         Hello world"[...].utf8
    XCTAssertNoThrow(
      try Many {
        " ".utf8
      }
      .parse(&input)
    )
    XCTAssertEqual(Substring(input), "Hello world")
  }

  func testSeparator() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      try Many {
        Int.parser()
      } separator: {
        ",".utf8
      }
      .parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testTrailingSeparator() {
    var input = "1,2,3,4,5,"[...].utf8

    XCTAssertEqual(
      try Many {
        Int.parser()
      } separator: {
        ",".utf8
      }
      .parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), ",")
  }

  func testMinimum() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertThrowsError(
      try Many(atLeast: 6) {
        Int.parser()
      } separator: {
        ",".utf8
      }
      .parse(&input)
    ) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:10
        1 | 1,2,3,4,5
          |          ^ expected 1 more value of "Int"
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual(Substring(input), "1,2,3,4,5")

    XCTAssertEqual(
      try Many(atLeast: 5) {
        Int.parser()
      } separator: {
        ",".utf8
      }
      .parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testMaximum() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      try Many(atMost: 3) {
        Int.parser()
      } separator: {
        ",".utf8
      }
      .parse(&input),
      [1, 2, 3]
    )
    XCTAssertEqual(Substring(input), ",4,5")
  }

  func testReduce() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      try Many(into: 0, +=) {
        Int.parser()
      } separator: {
        ",".utf8
      }
      .parse(&input),
      15
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testEmptyComponents() {
    var input = "2001:db8::2:1"[...]
    XCTAssertEqual(
      try Many {
        Prefix(while: \.isHexDigit)
      } separator: {
        ":"
      }
      .parse(&input),
      ["2001", "db8", "", "2", "1"]
    )
  }

  func testTerminator() {
    struct User: Equatable {
      var id: Int
      var name: String
      var isAdmin: Bool
    }

    let user = Parse(User.init) {
      Int.parser()
      ","
      Prefix { $0 != "," }.map(String.init)
      ","
      Bool.parser()
    }

    let users = Many {
      user
    } separator: {
      "\n"
    } terminator: {
      End()
    }

    var input = """
      1,Blob,true
      2,Blob Sr,false
      3,Blob Jr,true
      """[...]
    XCTAssertEqual(
      [
        User(id: 1, name: "Blob", isAdmin: true),
        User(id: 2, name: "Blob Sr", isAdmin: false),
        User(id: 3, name: "Blob Jr", isAdmin: true),
      ],
      try users.parse(&input)
    )

    input = """
      1,Blob,true
      2,Blob Sr,false
      3,Blob Jr,tru
      """
    XCTAssertThrowsError(try users.parse(&input)) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:3:11
        3 | 3,Blob Jr,tru
          |           ^ expected boolean
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
  }
}
