import Benchmark
import Foundation
import Parsing

/// This benchmarks the performance of `PrefixUntil` against `PrefixUpTo` for simple parsing.
let prefixUntilSuite = BenchmarkSuite(name: "PrefixUntil") { suite in
  let input = String(repeating: ".", count: 10_000) + "Hello, world!"

  do {
    var output: Substring!
    suite.benchmark("Parser: PrefixUpTo") {
      var input = input[...]
      output = try PrefixUpTo("Hello").parse(&input)
    } tearDown: {
      precondition(output.count == 10_000)
    }
  }

  do {
    var output: Substring!
    suite.benchmark("Parser: PrefixUntil - FastPath") {
      var input = input[...]
      output = try PrefixUntil("H") { "Hello" }.parse(&input)
    } tearDown: {
      precondition(output.count == 10_000)
    }
  }

  do {
    var output: Substring!
    suite.benchmark("Parser: PrefixUntil - SlowPath") {
      var input = input[...]
      output = try PrefixUntil { "Hello" }.parse(&input)
    } tearDown: {
      precondition(output.count == 10_000)
    }
  }
}
