import Parsing
import XCTest

class SkipSpacesTests: XCTestCase {
  func testBasics() {
    var input = "123 Hello"[...]
    let output = Int.parser().skipSpaces().parse(&input)

    XCTAssertEqual(input, " Hello")
    XCTAssertEqual(output, 123)
  }

  func testLazy() {
    var input = "   123"[...]
    let output = Lazy { Int.parser() }.skipSpaces()
      .parse(&input)

    XCTAssertEqual(input, "")
    XCTAssertEqual(output, 123)
  }

  func testOrElse() {
    var input = "   123"[...]
    let output = Int.parser()
      .orElse(Int.parser())
      .skipSpaces()
      .parse(&input)

    XCTAssertEqual(input, "")
    XCTAssertEqual(output, 123)
  }

  func testTake() {
    var input = "  123   true"[...]
    let output = Int.parser()
      .take(Bool.parser())
      .skipSpaces()
      .parse(&input)

    XCTAssertEqual(input, "")
    XCTAssertEqual(output?.0, 123)
    XCTAssertEqual(output?.1, true)
  }

  func testPipe() {
    var input = "   12 34"[...]
    let output = Prefix()
      .count(5)
      .pipe(
        Int.parser()
          .take(Int.parser())
      )
      .skipSpaces()
      .parse(&input)

    XCTAssertEqual(input, "")
    XCTAssertEqual(output?.0, 12)
    XCTAssertEqual(output?.1, 34)
  }

  func testScanner() {
    let scanner = Scanner(string: " 123 true 123 ")
    scanner.charactersToBeSkipped = .whitespaces
    let int = scanner.scanInt()

    XCTAssertEqual(int, 123)
  }
}
