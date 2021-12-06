import Parsing
import XCTest

class SkipSpacesTests: XCTestCase {
  func testBasics() {
    var input = "123 Hello"[...]
    let output = Int.parser().skipSpaces().parse(&input)

    XCTAssertEqual(input, " Hello")
    XCTAssertEqual(output, 123)
  }

  func testMany1() {
    var input = " 1 2 3 4 5"[...]

    let output = Many(Int.parser())
      .skipSpaces()
      .parse(&input)

    XCTAssertEqual(input, "")
    XCTAssertEqual(output, [1, 2, 3, 4, 5])
  }

  func testMany2() {
    var input = " 1 2 3 4 5"[...]
    let output = Many(
      Int.parser()
        .skipSpaces()
    )
      .parse(&input)

    XCTAssertEqual(input, "")
    XCTAssertEqual(output, [1, 2, 3, 4, 5])
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

  func testFlatMap() {
    var input = "  124   true"[...]
    let output = Int.parser()
      .flatMap { version in
        version.isMultiple(of: 2)
        ? Conditional.first(Bool.parser())
        : Conditional.second(Fail())
      }
      .skipSpaces()
      .parse(&input)

    XCTAssertEqual(input, "")
    XCTAssertEqual(output, true)
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

  func testEnvironmentCapture() {

    @ParserOutput var output = Prefix()
      .count(5)
      .environment(\.userAgent)
      .parse("Hello world")

    XCTAssertEqual(output, "Hello")
    XCTAssertEqual(_output.userAgent, "Hello")
  }
}
