import Benchmark
import Foundation
import Parsing

let uuidSuite = BenchmarkSuite(name: "UUID") { suite in
  let input = "deadbeef-dead-beef-dead-beefdeadbeef"
  let expected = UUID(uuidString: "deadbeef-dead-beef-dead-beefdeadbeef")!
  var output: UUID!

  suite.benchmark("UUID.init") {
    output = UUID(uuidString: input)
  } tearDown: {
    precondition(output == expected)
  }

  suite.benchmark("UUIDParser") {
    var input = input[...].utf8
    output = UUID.parser().parse(&input)
  } tearDown: {
    precondition(output == expected)
  }
}
