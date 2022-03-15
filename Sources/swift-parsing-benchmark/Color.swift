import Benchmark
import Parsing

/// This benchmark demonstrates how to parse a hexadecimal color.
///
/// Compare to the Rust [example using nom](https://github.com/Geal/nom#example).
let colorSuite = BenchmarkSuite(name: "Color") { suite in
  struct Color: Equatable {
    let red, green, blue: UInt8
  }

  struct HexByte: ParserPrinter {
    func parse(_ input: inout Substring.UTF8View) throws -> UInt8 {
      let prefix = input.prefix(2)
      guard
        prefix.count == 2,
        let byte = UInt8(String(decoding: prefix, as: UTF8.self), radix: 16)
      else { throw ParsingError() }
      input.removeFirst(2)
      return byte
    }

    func print(_ output: UInt8, into input: inout Substring.UTF8View) {
      let byte = String(output, radix: 16)
      input.prepend(contentsOf: byte.count == 1 ? "0\(byte)".utf8 : "\(byte)".utf8)
    }
  }

  struct HexColor: ParserPrinter {
    var body: some ParserPrinter<Substring.UTF8View, Color> {
      ParsePrint(.memberwise(Color.init(red:green:blue:))) {
        "#".utf8
        HexByte()
        HexByte()
        HexByte()
      }
    }
  }

  let input = "#FF0000"
  let expected = Color(red: 0xFF, green: 0x00, blue: 0x00)
  var output: Color!

  suite.benchmark("Parser") {
    var input = input[...].utf8
    output = try HexColor().parse(&input)
  } tearDown: {
    precondition(output == expected)
    precondition(try! HexColor().print(output).elementsEqual("#ff0000".utf8) == true)
  }
}
