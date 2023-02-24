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
    XCTAssertEqual(Substring(input), "Hello world")
  }

  func testSeparator() {
    struct IntsParser: Parser {
      var body: some Parser<Substring.UTF8View, [Int]> {
        Many {
          Int.parser()
        } separator: {
          ",".utf8
        }
      }
    }

    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      try IntsParser().parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testTrailingSeparator() {
    struct IntsParser: Parser {
      var body: some Parser<Substring.UTF8View, [Int]> {
        Many {
          Int.parser()
        } separator: {
          ",".utf8
        }
      }
    }

    var input = "1,2,3,4,5,"[...].utf8

    XCTAssertEqual(
      try IntsParser().parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), ",")
  }

  func testMinimum() {
    struct SixOrMoreInts: ParserPrinter {
      var body: some ParserPrinter<Substring.UTF8View, [Int]> {
        Many(6...) {
          Int.parser()
        } separator: {
          ",".utf8
        }
      }
    }

    var input = "1,2,3,4,5"[...].utf8

    XCTAssertThrowsError(
      try SixOrMoreInts().parse(&input)
    ) { error in
      XCTAssertEqual(
        """
        error: unexpected input
         --> input:1:10
        1 | 1,2,3,4,5
          |          ^ expected 1 more value of "Int"
        """,
        "\(error)"
      )
    }
    XCTAssertEqual(Substring(input), "")

    XCTAssertThrowsError(
      try SixOrMoreInts().print([1, 2, 3, 4, 5])
    ) { error in
      XCTAssertEqual(
        """
        error: round-trip expectation failed

        A "Many" parser that requires at least 6 values of Int was given only 5 values to print.
        """,
        "\(error)"
      )
    }

    struct FiveOrMoreInts: Parser {
      var body: some Parser<Substring.UTF8View, [Int]> {
        Many(5...) {
          Int.parser()
        } separator: {
          ",".utf8
        }
      }
    }

    input = "1,2,3,4,5"[...].utf8
    XCTAssertEqual(
      try FiveOrMoreInts().parse(&input),
      [1, 2, 3, 4, 5]
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testMaximum() {
    struct AtMostThreeInts: ParserPrinter {
      var body: some ParserPrinter<Substring.UTF8View, [Int]> {
        Many(...3) {
          Int.parser()
        } separator: {
          ",".utf8
        }
      }
    }

    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      try AtMostThreeInts().parse(&input),
      [1, 2, 3]
    )
    XCTAssertEqual(Substring(input), ",4,5")

    XCTAssertThrowsError(
      try AtMostThreeInts().print([1, 2, 3, 4, 5])
    ) { error in
      XCTAssertEqual(
        """
        error: round-trip expectation failed

        A "Many" parser that parses at most 3 values of Int was given more values than it could \
        have parsed.
        """,
        "\(error)"
      )
    }
  }

  func testReduce() {
    struct SumParser: Parser {
      var body: some Parser<Substring.UTF8View, Int> {
        Many(into: 0, +=) {
          Int.parser()
        } separator: {
          ",".utf8
        }
      }
    }

    var input = "1,2,3,4,5"[...].utf8

    XCTAssertEqual(
      try SumParser().parse(&input),
      15
    )
    XCTAssertEqual(Substring(input), "")
  }

  func testEmptyComponents() {
    struct MACAddressParser: Parser {
      var body: some Parser<Substring, [Substring]> {
        Many {
          Prefix(while: \.isHexDigit)
        } separator: {
          ":"
        }
      }
    }

    var input = "2001:db8::2:1"[...]
    XCTAssertEqual(
      try MACAddressParser().parse(&input),
      ["2001", "db8", "", "2", "1"]
    )
  }

  func testTerminator() {
    struct User: Equatable {
      var id: Int
      var name: String
      var isAdmin: Bool
    }

    struct UserParser: Parser {
      var body: some Parser<Substring, User> {
        Parse(input: Substring.self, User.init) {
          Int.parser()
          ","
          Prefix { $0 != "," }.map(String.init)
          ","
          Bool.parser()
        }
      }
    }

    struct UsersParser: Parser {
      var body: some Parser<Substring, [User]> {
        Many {
          UserParser()
        } separator: {
          "\n"
        } terminator: {
          End()
        }
      }
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
      try UsersParser().parse(&input)
    )

    input = """
      1,Blob,true
      2,Blob Sr,false
      3,Blob Jr,tru
      """
    XCTAssertThrowsError(try UsersParser().parse(&input)) { error in
      XCTAssertEqual(
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
    struct IntsParser: Parser {
      var body: some Parser<Substring, [Int]> {
        Many {
          Int.parser()
        } separator: {
          ","
        } terminator: {
          "---"
        }
      }
    }

    var input = "1,2,3-"[...]
    XCTAssertThrowsError(try IntsParser().parse(&input)) { error in
      XCTAssertEqual(
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
    struct ParserWithInfiniteLoop: Parser {
      var body: some Parser<Substring, [Substring]> {
        Many { Prefix(while: \.isNumber) }
      }
    }

    XCTAssertThrowsError(try ParserWithInfiniteLoop().parse("Hello world!")) { error in
      XCTAssertEqual(
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
    let parser: some Parser<Substring, [Int]> = Many(into: [Int]()) { (xs, x) throws in
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
      XCTAssertEqual(
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
