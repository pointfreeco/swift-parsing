import Parsing
import XCTest

final class TakeTests: XCTestCase {
  func testIntAndVoid() throws {
    let parser: some Parser<Substring, (Int, Void)> = Take {
      Int.parser()
    } upTo: {
      "."
    }

    var input = "123.456"[...]
    XCTAssertEqual(123, try parser.parse(&input).0)
  }

  func testUnterminated() throws {
    let parser: some Parser<Substring, (Int, Void)> = Take {
      Int.parser()
    } upTo: {
      "."
    }

    var input = "123456"[...]

    XCTAssertThrowsError(try parser.parse(&input))
  }

  func testTakeStringAndInt() throws {
    let parser: some Parser<Substring, (String, Int)> = Take {
      Prefix(0...).map(.string)
    } upTo: {
      "456".map { 456 }
    }

    var input = "123456"[...]
    let output = try parser.parse(&input)
    XCTAssertEqual("123", output.0)
    XCTAssertEqual(456, output.1)
  }

  func testTakeUpToEnd() throws {
    let parser: some Parser<Substring, (Substring, ())> = Take {
      Prefix(0...)
    } upTo: {
      End<Substring>()
    }

    var input = "123"[...]
    XCTAssertEqual("123", try parser.parse(&input).0)
    XCTAssertEqual("", input)
  }

  func testTakeCantParseUpTo() throws {
    let parser: some Parser<Substring, (Int, ())> = Take {
      Int.parser()
    } upTo: {
      End<Substring>()
    }

    var input = "123abc"[...]
    XCTAssertThrowsError(try parser.parse(&input))
  }

  func testComplextInitMap() throws {
    enum Example: Equatable {
      case a
      case b
    }

    struct ComplexType: Equatable {
      let string: String
      let number: Int
      let example: Example?
    }

    let parser: some Parser<Substring, ComplexType> = Parse(ComplexType.init(string:number:example:)) {
      Take {
        Prefix(0...).map(.string)
      } upTo: {
        Int.parser()
      }
      Optionally {
        OneOf {
          "a".map { Example.a }
          "b".map { Example.b }
        }
      }
    }
    
    var input = "Hello1b"[...]
    XCTAssertEqual(ComplexType(string: "Hello", number: 1, example: .b), try parser.parse(&input))
    XCTAssertTrue(input.isEmpty)
  }
}
