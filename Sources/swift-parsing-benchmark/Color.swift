import Benchmark
import Parsing

private struct Color: Equatable {
  let red, green, blue: UInt8
}

private typealias Input = Slice<UnsafeBufferPointer<UInt8>>
private typealias Output = Color

private let hexPrimary = Prefix<Input>(2)
  .pipe(UInt8.parser(isSigned: false, radix: 16).skip(End()))

private let hexColor = StartsWith<Input>("#".utf8)
  .take(hexPrimary)
  .take(hexPrimary)
  .take(hexPrimary)
//  .map(Conversion.init(apply: Color.init, unapply: { ($0.red, $0.green, $0.blue)}))
//  .map(Conversion.unsafeBitCast(to: Color.init))
  .map(Color.init)

let colorSuite = BenchmarkSuite(name: "Color") { suite in
  let input = "#FF0000"
  let expected = Color(red: 0xFF, green: 0x00, blue: 0x00)
  var output: Output!

  suite.benchmark(
    name: "Parser",
    run: { output = hexColor.parse(input) },
    tearDown: { precondition(output == expected) }
  )
}
