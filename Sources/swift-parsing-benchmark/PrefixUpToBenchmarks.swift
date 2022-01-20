import Benchmark
import Foundation
import Parsing

let prefixUpToSuite = BenchmarkSuite(name: "PrefixUpTo") { suite in
  let str = String(repeating: ".", count: 10_000) + "Hello, world!"

  suite.benchmark("Parser") {
    var v = str[...].utf8
    let output = try PrefixUpTo("Hello".utf8).parse(&v)
    precondition(output.count == 10_000)
  }

  if #available(macOS 10.15, *) {
    let scanner = Scanner(string: str)
    suite.benchmark(
      name: "Scanner.scanUpToString",
      setUp: { scanner.currentIndex = str.startIndex },
      run: { precondition(scanner.scanUpToString("Hello")!.count == 10_000) }
    )
  }
}
