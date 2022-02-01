import Benchmark
import Foundation
import Parsing

let prefixUpToSuite = BenchmarkSuite(name: "PrefixUpTo") { suite in
  let str = String(repeating: ".", count: 10_000) + "Hello, world!"

  var output: Substring.UTF8View!
  suite.benchmark("Parser") {
    var input = str[...].utf8
    output = PrefixUpTo("Hello".utf8).parse(&input)
  } tearDown: {
    precondition(output.count == 10_000)
  }

  if #available(macOS 10.15, *) {
    var output: String!
    let scanner = Scanner(string: str)
    suite.benchmark("Scanner.scanUpToString") {
      output = scanner.scanUpToString("Hello")
    } setUp: {
      scanner.currentIndex = str.startIndex
    } tearDown: {
      precondition(output.count == 10_000)
    }
  }
}
