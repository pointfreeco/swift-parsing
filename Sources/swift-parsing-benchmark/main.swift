import Benchmark
import Parsing

let first = OneOf {
  Parse { Int.parser(); "-"; Int.parser() } // 1️⃣
  Parse { Int.parser(); "/"; Int.parser() } // 2️⃣
}
benchmark("First") {
  precondition(try! first.parse("100/200") == (100, 200))
}
let second = Parse {
  Int.parser()
  OneOf { "-"; "/" }
  Int.parser()
}
benchmark("Second") {
  precondition(try! second.parse("100/200") == (100, 200))
}

//Substring.UnicodeScalarView.Element

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
