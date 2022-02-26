import Benchmark
import Parsing

//let first = OneOf {
//  Parse { Int.parser(); "-"; Int.parser() } // 1️⃣
//  Parse { Int.parser(); "/"; Int.parser() } // 2️⃣
//}
//benchmark("First") {
//  precondition(try! first.parse("100/200") == (100, 200))
//}
//let second = Parse {
//  Int.parser()
//  OneOf { "-"; "/" }
//  Int.parser()
//}
//benchmark("Second") {
//  precondition(try! second.parse("100/200") == (100, 200))
//}

func foo(_ input: inout String) {
  input.removeFirst(500)
}

var str = String(repeating: "👩‍👩‍👧‍👧", count: 1_000)
benchmark("String.removeFirst") {
  var str = str
  foo(&str)
}
benchmark("Substring.removeFirst") {
  var str = str[...]
  str.removeFirst(500)
}

Benchmark.main(
  [
    defaultBenchmarkSuite,
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
