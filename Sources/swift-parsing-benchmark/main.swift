import Benchmark
import Parsing

private let string = Substring(repeating: "👨‍👨‍👧‍👧", count: 100)
private let other = Substring(repeating: "🇵🇷", count: 100)
private let combined = string + other

let appendableSuite = BenchmarkSuite(name: "Appendable") { suite in

  do {
    var first = ""[...]
    let second = other[...]
    suite.benchmark(
      name: "Substring",
      setUp: { first = string[...] },
      run: { first.append(contentsOf: second) },
      tearDown: {
//        precondition(first.first == combined.first)
      }
    )
  }
  do {
    var first = ""[...].unicodeScalars
    let second = other[...].unicodeScalars
    suite.benchmark(
      name: "Substring.UnicodeScalars",
      setUp: { first = string[...].unicodeScalars },
      run: { first.append(contentsOf: second) },
      tearDown: {
//        precondition(first.first == combined.unicodeScalars.first)
      }
    )
  }
  do {
    var first = ""[...].utf8
    let second = other[...].utf8
    suite.benchmark(
      name: "Substring.UTF8View",
      setUp: { first = string[...].utf8 },
      run: { first.append(contentsOf: second) },
      tearDown: {
//        precondition(first.first == combined.utf8.first)
      }
    )
  }
  do {
    var first = Array(""[...].utf8)[...]
    let second = Array(other[...].utf8)[...]
    suite.benchmark(
      name: "ArraySlice<UInt8>",
      setUp: { first = Array(string[...].utf8)[...] },
      run: { first.append(contentsOf: second) },
      tearDown: {
//        precondition(first.first == combined.utf8.first)
      }
    )
  }

}
//
//benchmark("Substring") {
//  var first = string[...]
//  let second = other[...]
//  first.append(contentsOf: second)
//  precondition(first.elementsEqual(combined))
//}
//
//benchmark("Substring.UnicodeScalarView") {
//  var first = string[...].unicodeScalars
//  let second = other[...].unicodeScalars
//  first.append(contentsOf: second)
//  precondition(first.elementsEqual(combined[...].unicodeScalars))
//}
//
//benchmark("Substring.UTF8View") {
//  var first = string[...].utf8
//  let second = other[...].utf8
//  first.append(contentsOf: second)
//  precondition(first.elementsEqual(combined[...].utf8))
//}


Benchmark.main(
  [
    defaultBenchmarkSuite,
    appendableSuite,
//    arithmeticSuite,
//    binaryDataSuite,
//    boolSuite,
//    colorSuite,
//    csvSuite,
//    dateSuite,
//    httpSuite,
//    jsonSuite,
//    numericsSuite,
//    prefixUpToSuite,
//    raceSuite,
//    readmeExampleSuite,
//    routingSuite,
//    stringAbstractionsSuite,
//    uuidSuite,
//    xcodeLogsSuite,
  ]
)
