import CustomDump
import Parsing
import XCTest

final class DoubleTests: XCTestCase {
  func testDouble() throws {
    let parser = Double.parser(of: Substring.UTF8View.self)

    var input = "123 Hello"[...].utf8
    XCTAssertNoDifference(123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123. Hello"[...].utf8
    XCTAssertNoDifference(123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123.123 Hello"[...].utf8
    XCTAssertNoDifference(123.123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123.123E2 Hello"[...].utf8
    XCTAssertNoDifference(123.123E2, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123.123E-2 Hello"[...].utf8
    XCTAssertNoDifference(123.123E-2, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123.123E+2 Hello"[...].utf8
    XCTAssertNoDifference(123.123E+2, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123E-2 Hello"[...].utf8
    XCTAssertNoDifference(123E-2, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123E+2 Hello"[...].utf8
    XCTAssertNoDifference(123E+2, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123E Hello"[...].utf8
    XCTAssertNoDifference(123, try parser.parse(&input))
    XCTAssertNoDifference("E Hello", String(input))

    input = "1234567890123456789012345678901234567890 Hello"[...].utf8
    XCTAssertNoDifference(
      1_234_567_890_123_456_846_996_462_118_072_609_669_120, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-123 Hello"[...].utf8
    XCTAssertNoDifference(-123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "+123 Hello"[...].utf8
    XCTAssertNoDifference(123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-.123 Hello"[...].utf8
    XCTAssertNoDifference(-0.123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello
          | ^ expected double
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("Hello", String(input))

    input = "- Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | - Hello
          | ^ expected double
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference(" Hello", String(input))

    input = "+ Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | + Hello
          | ^ expected double
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference(" Hello", String(input))

    input = "2837.5e-2 Hello"[...].utf8
    XCTAssertNoDifference(28.375, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "0x1c.6 Hello"[...].utf8
    XCTAssertNoDifference(28.375, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "0x1.c6p4 Hello"[...].utf8
    XCTAssertNoDifference(28.375, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "1.23e-9999 Hello"[...].utf8
    XCTAssertNoDifference(0, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-7.89e-7206 Hello"[...].utf8
    XCTAssertNoDifference(-0, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "1.23e17802 Hello"[...].utf8
    XCTAssertNoDifference(.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-7.89e7206 Hello"[...].utf8
    XCTAssertNoDifference(-.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "inf Hello"[...].utf8
    XCTAssertNoDifference(.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "+Inf Hello"[...].utf8
    XCTAssertNoDifference(.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-inF Hello"[...].utf8
    XCTAssertNoDifference(-.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "Infinity Hello"[...].utf8
    XCTAssertNoDifference(.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "+inFinity Hello"[...].utf8
    XCTAssertNoDifference(.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-iNfInItY Hello"[...].utf8
    XCTAssertNoDifference(-.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "nan Hello"[...].utf8
    var output = try parser.parse(&input)
    XCTAssert(output.isNaN)
    XCTAssertNoDifference(" Hello", String(input))

    input = "+NaN Hello"[...].utf8
    output = try parser.parse(&input)
    XCTAssert(output.isNaN)
    XCTAssertNoDifference(" Hello", String(input))

    input = "-nAn Hello"[...].utf8
    output = try parser.parse(&input)
    XCTAssert(output.isNaN)
    XCTAssertNoDifference(" Hello", String(input))
  }

  func testFloat() throws {
    let parser = Float.parser(of: Substring.UTF8View.self)

    var input = "123 Hello"[...].utf8
    XCTAssertNoDifference(123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123. Hello"[...].utf8
    XCTAssertNoDifference(123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123.123 Hello"[...].utf8
    XCTAssertNoDifference(123.123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123.123E2 Hello"[...].utf8
    XCTAssertNoDifference(123.123E2, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123.123E-2 Hello"[...].utf8
    XCTAssertNoDifference(123.123E-2, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123.123E+2 Hello"[...].utf8
    XCTAssertNoDifference(123.123E+2, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123E-2 Hello"[...].utf8
    XCTAssertNoDifference(123E-2, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123E+2 Hello"[...].utf8
    XCTAssertNoDifference(123E+2, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "123E Hello"[...].utf8
    XCTAssertNoDifference(123, try parser.parse(&input))
    XCTAssertNoDifference("E Hello", String(input))

    input = "1234567890123456789012345678901234567890 Hello"[...].utf8
    do {
      let parsed = try parser.parse(&input)
      XCTAssertNoDifference(Float.infinity, parsed)
      XCTAssertNoDifference(" Hello", String(input))
    } catch {
      XCTAssertNoDifference("1234567890123456789012345678901234567890 Hello", String(input))
    }

    input = "-123 Hello"[...].utf8
    XCTAssertNoDifference(-123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "+123 Hello"[...].utf8
    XCTAssertNoDifference(123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-.123 Hello"[...].utf8
    XCTAssertNoDifference(-0.123, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | Hello
          | ^ expected float
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference("Hello", String(input))

    input = "- Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | - Hello
          | ^ expected float
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference(" Hello", String(input))

    input = "+ Hello"[...].utf8
    XCTAssertThrowsError(try parser.parse(&input)) { error in
      XCTAssertNoDifference(
        """
        error: unexpected input
         --> input:1:1
        1 | + Hello
          | ^ expected float
        """,
        "\(error)"
      )
    }
    XCTAssertNoDifference(" Hello", String(input))

    input = "2837.5e-2 Hello"[...].utf8
    XCTAssertNoDifference(28.375, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "0x1c.6 Hello"[...].utf8
    XCTAssertNoDifference(28.375, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "0x1.c6p4 Hello"[...].utf8
    XCTAssertNoDifference(28.375, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "1.23e-9999 Hello"[...].utf8
    XCTAssertNoDifference(0, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-7.89e-7206 Hello"[...].utf8
    XCTAssertNoDifference(-0, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "1.23e17802 Hello"[...].utf8
    XCTAssertNoDifference(.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-7.89e7206 Hello"[...].utf8
    XCTAssertNoDifference(-.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "inf Hello"[...].utf8
    XCTAssertNoDifference(.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "+Inf Hello"[...].utf8
    XCTAssertNoDifference(.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-inF Hello"[...].utf8
    XCTAssertNoDifference(-.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "Infinity Hello"[...].utf8
    XCTAssertNoDifference(.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "+inFinity Hello"[...].utf8
    XCTAssertNoDifference(.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "-iNfInItY Hello"[...].utf8
    XCTAssertNoDifference(-.infinity, try parser.parse(&input))
    XCTAssertNoDifference(" Hello", String(input))

    input = "nan Hello"[...].utf8
    var output = try parser.parse(&input)
    XCTAssert(output.isNaN)
    XCTAssertNoDifference(" Hello", String(input))

    input = "+NaN Hello"[...].utf8
    output = try parser.parse(&input)
    XCTAssert(output.isNaN)
    XCTAssertNoDifference(" Hello", String(input))

    input = "-nAn Hello"[...].utf8
    output = try parser.parse(&input)
    XCTAssert(output.isNaN)
    XCTAssertNoDifference(" Hello", String(input))
  }

  #if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
    func testFloat80() throws {
      let parser = Float80.parser(of: Substring.UTF8View.self)

      var input = "123 Hello"[...].utf8
      XCTAssertNoDifference(123, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "123. Hello"[...].utf8
      XCTAssertNoDifference(123, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "123.123 Hello"[...].utf8
      XCTAssertNoDifference(123.123, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "123.123E2 Hello"[...].utf8
      XCTAssertNoDifference(123.123E2, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "123.123E-2 Hello"[...].utf8
      XCTAssertNoDifference(123.123E-2, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "123.123E+2 Hello"[...].utf8
      XCTAssertNoDifference(123.123E+2, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "123E-2 Hello"[...].utf8
      XCTAssertNoDifference(123E-2, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "123E+2 Hello"[...].utf8
      XCTAssertNoDifference(123E+2, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "123E Hello"[...].utf8
      XCTAssertNoDifference(123, try parser.parse(&input))
      XCTAssertNoDifference("E Hello", String(input))

      input = "1234567890123456789012345678901234567890 Hello"[...].utf8
      XCTAssertNoDifference(
        1_234_567_890_123_456_788_999_898_750_329_779_388_416,
        try parser.parse(&input)
      )
      XCTAssertNoDifference(" Hello", String(input))

      input = "-123 Hello"[...].utf8
      XCTAssertNoDifference(-123, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "+123 Hello"[...].utf8
      XCTAssertNoDifference(123, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "-.123 Hello"[...].utf8
      XCTAssertNoDifference(-0.123, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "Hello"[...].utf8
      XCTAssertThrowsError(try parser.parse(&input)) { error in
        XCTAssertNoDifference(
          """
          error: unexpected input
           --> input:1:1
          1 | Hello
            | ^ expected float80
          """,
          "\(error)"
        )
      }
      XCTAssertNoDifference("Hello", String(input))

      input = "- Hello"[...].utf8
      XCTAssertThrowsError(try parser.parse(&input)) { error in
        XCTAssertNoDifference(
          """
          error: unexpected input
           --> input:1:1
          1 | - Hello
            | ^ expected float80
          """,
          "\(error)"
        )
      }
      XCTAssertNoDifference(" Hello", String(input))

      input = "+ Hello"[...].utf8
      XCTAssertThrowsError(try parser.parse(&input)) { error in
        XCTAssertNoDifference(
          """
          error: unexpected input
           --> input:1:1
          1 | + Hello
            | ^ expected float80
          """,
          "\(error)"
        )
      }
      XCTAssertNoDifference(" Hello", String(input))

      input = "2837.5e-2 Hello"[...].utf8
      XCTAssertNoDifference(28.375, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "0x1c.6 Hello"[...].utf8
      XCTAssertNoDifference(28.375, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "0x1.c6p4 Hello"[...].utf8
      XCTAssertNoDifference(28.375, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "1.23e-9999 Hello"[...].utf8
      XCTAssertNoDifference(0, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "-7.89e-7206 Hello"[...].utf8
      XCTAssertNoDifference(-0, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "1.23e17802 Hello"[...].utf8
      XCTAssertNoDifference(.infinity, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "-7.89e7206 Hello"[...].utf8
      XCTAssertNoDifference(-.infinity, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "inf Hello"[...].utf8
      XCTAssertNoDifference(.infinity, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "+Inf Hello"[...].utf8
      XCTAssertNoDifference(.infinity, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "-inF Hello"[...].utf8
      XCTAssertNoDifference(-.infinity, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "Infinity Hello"[...].utf8
      XCTAssertNoDifference(.infinity, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "+inFinity Hello"[...].utf8
      XCTAssertNoDifference(.infinity, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "-iNfInItY Hello"[...].utf8
      XCTAssertNoDifference(-.infinity, try parser.parse(&input))
      XCTAssertNoDifference(" Hello", String(input))

      input = "nan Hello"[...].utf8
      var output = try parser.parse(&input)
      XCTAssert(output.isNaN)
      XCTAssertNoDifference(" Hello", String(input))

      input = "+NaN Hello"[...].utf8
      output = try parser.parse(&input)
      XCTAssert(output.isNaN)
      XCTAssertNoDifference(" Hello", String(input))

      input = "-nAn Hello"[...].utf8
      output = try parser.parse(&input)
      XCTAssert(output.isNaN)
      XCTAssertNoDifference(" Hello", String(input))
    }
  #endif
}
