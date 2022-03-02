import CustomDump
import Parsing
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
    XCTAssertNoDifference(Substring(input), "Hello world")
  }

  func testSeparator() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertNoDifference(
      try Many {
        Int.parser()
      } separator: {
        ",".utf8
      }
      .parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertNoDifference(Substring(input), "")
  }

  func testTrailingSeparator() {
    var input = "1,2,3,4,5,"[...].utf8

    XCTAssertNoDifference(
      try Many {
        Int.parser()
      } separator: {
        ",".utf8
      }
      .parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertNoDifference(Substring(input), ",")
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
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:10
        1 | 1,2,3,4,5
          |          ^ expected 1 more value of "Int"
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference(Substring(input), "")

    input = "1,2,3,4,5"[...].utf8
    XCTAssertNoDifference(
      try Many(atLeast: 5) {
        Int.parser()
      } separator: {
        ",".utf8
      }
      .parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertNoDifference(Substring(input), "")
  }

  func testMaximum() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertNoDifference(
      try Many(atMost: 3) {
        Int.parser()
      } separator: {
        ",".utf8
      }
      .parse(&input),
      [1, 2, 3]
    )
    XCTAssertNoDifference(Substring(input), ",4,5")
  }

  func testReduce() {
    var input = "1,2,3,4,5"[...].utf8

    XCTAssertNoDifference(
      try Many(into: 0, +=) {
        Int.parser()
      } separator: {
        ",".utf8
      }
      .parse(&input),
      15
    )
    XCTAssertNoDifference(Substring(input), "")
  }

  func testEmptyComponents() {
    var input = "2001:db8::2:1"[...]
    XCTAssertNoDifference(
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
    XCTAssertNoDifference(
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
      XCTAssertNoDifference(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:3:11
        3 | 3,Blob Jr,tru
          |           ^ expected "true" or "false"

        error: unexpected input
         --> input:2:16
        2 | 2,Blob Sr,false
          |                ^ expected end of input
        """,
        "\(error)"
      )
    }
  }

  func testTerminatorFails() {
    let intsParser = Many {
      Int.parser()
    } separator: {
      ","
    } terminator: {
      "---"
    }

    var input = "1,2,3-"[...]
    XCTAssertThrowsError(try intsParser.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:6
        1 | 1,2,3-
          |      ^ expected ","
          |      ^ expected "---"
        """,
        "\(error)"
      )
    }
  }

  func testInfiniteLoop() {
    XCTAssertThrowsError(try Many { Prefix(while: \.isNumber) }.parse("Hello world!")) { error in
      XCTAssertNoDifference(
        """
        error: infinite loop
         --> input:1:1
        1 | Hello world!
          | ^ expected input to be consumed
        """,
        "\(error)"
      )
    }
  }

  func testThrowingAccumulator() {
    let parser = Many(into: [Int]()) { (xs, x) throws in
      struct UniqueIntegerError: Error {}
      guard !xs.contains(x)
      else { throw UniqueIntegerError() }
      xs.append(x)
    } element: {
      Int.parser()
    } separator: {
      ","
    }

    XCTAssertThrowsError(try parser.parse("1,2,3,1,2,3")) { error in
      XCTAssertNoDifference(
        """
        error: UniqueIntegerError()
         --> input:1:7
        1 | 1,2,3,1,2,3
          |       ^
        """,
        "\(error)"
      )
    }
  }
}
