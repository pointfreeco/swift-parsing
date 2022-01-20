import Benchmark
import Parsing

private struct Color: Equatable {
  let red, green, blue: UInt8
}

struct HexByte<Input>: Parser
where Input: Collection, Input.SubSequence == Input, Input.Element == UInt8 {
  func parse(_ input: inout Input) -> UInt8? {
    let prefix = input.prefix(2)
    guard
      prefix.count == 2,
      let byte = UInt8(String(decoding: prefix, as: UTF8.self), radix: 16)
    else { return nil }
    input.removeFirst(2)
    return byte
  }
}

extension HexByte: Printer where Input: AppendableCollection {
  func print(_ output: UInt8) -> Input? {
    let byte = String(output, radix: 16)
    return byte.count == 1 ? Input("0\(byte)".utf8) : Input("\(byte)".utf8)
  }
}

extension HexByte where Input == Substring.UTF8View {
  init() {}
}

private let hexColor = Parse(Destructure(Color.init(red:green:blue:))) {
  "#".utf8
  HexByte()
  HexByte()
  HexByte()
}

let colorSuite = BenchmarkSuite(name: "Color") { suite in
  let input = "#FF0000"
  let expected = Color(red: 0xFF, green: 0x00, blue: 0x00)
  var output: Color!

  suite.benchmark(
    name: "Parser",
    run: { output = hexColor.parse(input) },
    tearDown: {
      precondition(output == expected)
      precondition(hexColor.print(output)?.elementsEqual("#ff0000".utf8) == true)
    }
  )
}
