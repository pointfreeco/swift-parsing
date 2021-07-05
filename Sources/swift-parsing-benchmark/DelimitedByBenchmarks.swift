import Benchmark
import Foundation
import Parsing

//  name                                       time          std        iterations
//  ------------------------------------------------------------------------------
//  DelimitedBy.1-Level-DelimitedBy            166841.000 ns ±  17.58 %       7148
//  DelimitedBy.1-Level-DelimitedBy-MaxLevel-1  79969.000 ns ±  18.54 %      16657
//  DelimitedBy.1-Level-Composite               30869.000 ns ±  22.09 %      41878
//  DelimitedBy.SameDelimiter-DelimitedBy       18448.000 ns ±  22.99 %      70959
//  DelimitedBy.SameDelimiter-Composite         30881.000 ns ±  21.26 %      43653
//  DelimitedBy.Nested-DelimitedBy             167025.000 ns ±  15.00 %       7884
//  DelimitedBy.Nested-Ad-Hoc-Composite         40625.000 ns ±  17.86 %      31736

let delimitedBySuite = BenchmarkSuite(name: "DelimitedBy") { suite in
  let expectedNested = String(repeating: ".", count: 10_000) + "(Hello), world!"
  let strNested = "(" + expectedNested + ")"
  let expectedNestedCount = expectedNested.count

  let expected = String(repeating: ".", count: 10_000) + "Hello, world!"
  let str = "(" + expected + ")"
  let strSame = "|" + expected + "|"
  let expectedCount = expected.count

  suite.benchmark("1-Level-DelimitedBy") {
    var v = str[...].utf8
    precondition(DelimitedBy("(".utf8, ")".utf8).parse(&v)!.count == expectedCount)
  }
    
  suite.benchmark("1-Level-DelimitedBy-MaxLevel-1") {
    var v = str[...].utf8
    precondition(DelimitedBy("(".utf8, ")".utf8, maxLevel: 1).parse(&v)!.count == expectedCount)
  }
    
  suite.benchmark("1-Level-Composite") {
    var v = str[...].utf8
    let parser = Parsers
      .Skip(StartsWith("(".utf8))
      .take(PrefixUpTo(")".utf8))
      .skip(StartsWith(")".utf8))
    precondition(parser.parse(&v)!.count == expectedCount)
  }
  
  suite.benchmark("SameDelimiter-DelimitedBy") {
    var v = strSame[...].utf8
    precondition(DelimitedBy("|".utf8).parse(&v)!.count == expectedCount)
  }
  
  suite.benchmark("SameDelimiter-Composite") {
    var v = strSame[...].utf8
    let parser = Parsers
      .Skip(StartsWith("|".utf8))
      .take(PrefixUpTo("|".utf8))
      .skip(StartsWith("|".utf8))
    precondition(parser.parse(&v)!.count == expectedCount)
  }
  
  suite.benchmark("Nested-DelimitedBy") {
    var v = strNested[...].utf8
    precondition(DelimitedBy("(".utf8, ")".utf8).parse(&v)!.count == expectedNestedCount)
  }
  
  suite.benchmark("Nested-Ad-Hoc-Composite") {
    var v = strNested[...].utf8
    let parser = Parsers
      .Skip(StartsWith("(".utf8))
      .take(PrefixUpTo("(".utf8))
      .take(PrefixThrough(")".utf8))
      .take(PrefixUpTo(")".utf8))
      .skip(StartsWith(")".utf8))
      .map { [$0, $1, $2].joined() }
    precondition(parser.parse(&v)!.count == expectedNestedCount)
  }
}
