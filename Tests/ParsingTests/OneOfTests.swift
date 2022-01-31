@testable import Parsing
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
      .parse(&input)
    ) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:1
        1 | London, Hello!
          | ^ expected "New York"

        error: unexpected input
         --> input:1:1
        1 | London, Hello!
          | ^ expected "Berlin"
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
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
    ) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: unexpected input
         --> input:1:1
        1 | London, Hello!
          | ^ expected "New York"
          |   expected "Berlin"
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
    XCTAssertEqual("London, Hello!", Substring(input))
  }

  func testRanking() {
    XCTAssertThrowsError(
      try OneOf {
        Int.parser()
        Prefix(2).compactMap { _ in Int?.none }
      }
      .parse("Hello"[...].utf8)
    ) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: failed to process "Int" from "He"
         --> input:1:1-2
        1 | Hello
          | ^^

        error: unexpected input
         --> input:1:1
        1 | Hello
          | ^ expected integer
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
  }

  func testRanking_2() {
    XCTAssertThrowsError(
      try OneOf {
        Int.parser()
        Prefix(2).compactMap { _ in Int?.none }
      }
      .parse("Hello")
    ) { error in
      XCTAssertEqual(
        """
        error: multiple failures occurred

        error: failed to process "Int" from "He"
         --> input:1:1-2
        1 | Hello
          | ^^

        error: unexpected input
         --> input:1:1
        1 | Hello
          | ^ expected integer
        """,
        (error as? ParsingError)?.debugDescription ?? ""
      )
    }
  }
}
