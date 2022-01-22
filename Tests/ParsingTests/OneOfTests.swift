import Parsing
import XCTest

final class OneOfTests: XCTestCase {
  func testOneOfFirstSuccess() {
    var input = "New York, Hello!"[...]
    XCTAssertNoThrow(
      try OneOf {
        "New York"
        "Berlin"
      }
      .parse(&input)
    )
    XCTAssertEqual(", Hello!", Substring(input))
  }

  func testOneOfSecondSuccess() {
    var input = "Berlin, Hello!"[...]
    XCTAssertNoThrow(
      try OneOf {
        "New York"
        "Berlin"
      }
      .parse(&input)
    )
    XCTAssertEqual(", Hello!", Substring(input))
  }

  func testOneOfFailure() {
    var input = "London, Hello!"[...]
    XCTAssertThrowsError(
      try OneOf {
        "New York"
        "Berlin"
      }
      .parse(&input))
    XCTAssertEqual("London, Hello!", Substring(input))
  }

  func testOneOfManyFirstSuccess() {
    var input = "New York, Hello!"[...]
    XCTAssertNoThrow(
      try OneOf {
        for city in ["New York", "Berlin"] {
          city
        }
      }
      .parse(&input)
    )
    XCTAssertEqual(", Hello!", Substring(input))
  }

  func testOneOfManyLastSuccess() {
    var input = "Berlin, Hello!"[...]
    XCTAssertNoThrow(
      try OneOf {
        for city in ["New York", "Berlin"] {
          city
        }
      }
      .parse(&input)
    )
    XCTAssertEqual(", Hello!", Substring(input))
  }

  func testOneOfManyFailure() {
    var input = "London, Hello!"[...]
    XCTAssertThrowsError(
      try OneOf {
        "New York"
        "Berlin"
      }
      .parse(&input)
    )
    XCTAssertEqual("London, Hello!", Substring(input))
  }

  func testQuotedField() throws {
    let field = OneOf {
      Parse {
        "\""
        Prefix { $0 != "\"" }
        "\""
      }

      Prefix(1...) { $0 != "," }
    }

    try field.parse("")
  }

  func testUserParser() throws {
    let field = OneOf {
      Parse {
        "\""
        Prefix { $0 != "\"" }
        "\""
      }

      Prefix(1...) { $0 != "," }
    }

    let user = Parse {
      Int.parser()
      ","
      field
      ","
      Bool.parser()
    }

    try user.parse("123,,true")
  }
}
