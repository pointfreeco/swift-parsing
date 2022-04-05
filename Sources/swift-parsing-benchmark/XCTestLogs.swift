import Benchmark
import Parsing

/// This benchmark demonstrates how to build process a dump of Xcode test logs to transform them
/// in an array of test failures and passes.

let xcodeLogsSuite = BenchmarkSuite(name: "Xcode Logs") { suite in
  var output: [TestResult]!

  suite.benchmark("Parser") {
    var input = xcodeLogs[...]
    output = try testResultsUtf8.parse(&input)
  } tearDown: {
    precondition(output.count == 284)
  }
}

private let testCaseFinishedLine = Parse {
  Skip {
    PrefixThrough(" (".utf8)
  }
  Double.parser()
  " seconds).\n".utf8
}

private let testCaseStartedLine = Parse {
  Skip {
    PrefixUpTo("Test Case '-[".utf8)
  }
  PrefixThrough("\n".utf8)
    .map { line in Substring(line.split(separator: .init(ascii: " "))[3].dropLast(2)) }
}

private let fileName = Parse {
  "/".utf8
  PrefixThrough(".swift".utf8)
    .compactMap { $0.split(separator: .init(ascii: "/")).last.map(Substring.init) }
}

private let testCaseBody = Parse {
  fileName
  ":".utf8
  Int.parser()
  Skip {
    PrefixThrough("] : ".utf8)
  }
  Rest()
}

struct TestCaseBody: Parser {
  func parse(
    _ input: inout Substring
  ) throws -> (file: Substring, line: Int, message: Substring) {
    guard input.utf8.first == .init(ascii: "/")
    else { throw ParsingError() }

    var slashCount = 0
    let filePathPrefix = input.utf8.prefix { codeUnit in
      if codeUnit == .init(ascii: "/") {
        slashCount += 1
      }
      return slashCount != 3
    }

    input.utf8.removeFirst(filePathPrefix.count)
    do {
      var failure = Substring(try OneOf {
        PrefixUpTo(filePathPrefix)
        PrefixUpTo("Test Case '-[".utf8)
      }
      .parse(&input))

      failure.removeLast()  // trailing newline
      let output = try testCaseBody.parse(&failure)
      return output
    } catch {
      throw error
    }
  }
}

enum TestResult {
  case failed(
    failureMessage: Substring,
    file: Substring,
    line: Int,
    testName: Substring,
    time: Double
  )
  case passed(testName: Substring, time: Double)
}

private let testFailed = Parse {
  testCaseStartedLine
  Many { TestCaseBody() }
  testCaseFinishedLine
}
.map { testName, bodyData, time in
  bodyData.map { body in
    TestResult.failed(
      failureMessage: body.2,
      file: body.0,
      line: body.1,
      testName: testName,
      time: time
    )
  }
}
.filter { !$0.isEmpty }

private let testPassed = Parse {
  testCaseStartedLine.map(Substring.init)
  testCaseFinishedLine
}
.map { [TestResult.passed(testName: $0, time: $1)] }

private let testResult = OneOf {
  testFailed
  testPassed
}

let testResultsUtf8 = Many {
  testResult
}
.map { $0.flatMap { $0 } }
