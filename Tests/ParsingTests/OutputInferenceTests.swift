#if CasePaths
  import CasePaths
  import Parsing
  import XCTest

  @CasePathable
  private enum Outer: Equatable {
    case inner(Inner)
    case other
  }

  @CasePathable
  private enum Inner: Equatable {
    case a
    case b
  }

  final class OutputInferenceTests: XCTestCase {
    func testConversionInference() throws {
      struct InnerParser: ParserPrinter {
        var body: some ParserPrinter<Substring, Outer> {
          ParsePrint(.case(\.inner)) {
            OneOf {
              ParsePrint(.case(\.a)) { "a" }
              ParsePrint(.case(\.b)) { "b" }
            }
          }
        }
      }
      XCTAssertEqual(try InnerParser().parse("a"), .inner(.a))
      XCTAssertEqual(try InnerParser().print(.inner(.b)), "b")
    }

    func testOneOfInference() throws {
      struct OuterParser: ParserPrinter {
        var body: some ParserPrinter<Substring, Outer> {
          OneOf {
            ParsePrint(.case(\.inner)) {
              "inner:"
              OneOf {
                ParsePrint(.case(\.a)) { "a" }
                ParsePrint(.case(\.b)) { "b" }
              }
            }
            ParsePrint(.case(\.other)) { "other" }
          }
        }
      }
      XCTAssertEqual(try OuterParser().parse("inner:b"), .inner(.b))
      XCTAssertEqual(try OuterParser().parse("other"), .other)
      XCTAssertEqual(try OuterParser().print(.inner(.a)), "inner:a")
    }

    func testParsePrintInference() throws {
      struct OuterParser: ParserPrinter {
        var body: some ParserPrinter<Substring, Outer> {
          ParsePrint {
            OneOf {
              ParsePrint(.case(\.inner)) {
                OneOf {
                  ParsePrint(.case(\.a)) { "a" }
                  ParsePrint(.case(\.b)) { "b" }
                }
              }
              ParsePrint(.case(\.other)) { "other" }
            }
          }
        }
      }
      XCTAssertEqual(try OuterParser().parse("b"), .inner(.b))
      XCTAssertEqual(try OuterParser().print(.other), "other")
    }
  }
#endif
