import Benchmark
import Parsing

/// This benchmark demonstrates how to build process a dump of Xcode test logs to transform them
/// in an array of test failures and passes.

let xcodeLogsSuite = BenchmarkSuite(name: "Xcode Logs") { suite in
  var output: [TestResult]!

  suite.benchmark("Parser") {
    var input = xcodeLogs[...].utf8
    output = try TestResults().parse(&input)
  } tearDown: {
    precondition(output.count == 284)
  }
}

private struct TestCaseFinishedLine: Parser {
  var body: some Parser<Substring.UTF8View, Double> {
    Skip {
      PrefixThrough(" (".utf8)
    }
    Double.parser()
    " seconds).\n".utf8
  }
}

private struct TestCaseStartedLine: Parser {
  var body: some Parser<Substring.UTF8View, Substring> {
    Skip {
      PrefixUpTo("Test Case '-[".utf8)
    }
    PrefixThrough("\n".utf8)
      .map { line in line.split(separator: .init(ascii: " "))[3].dropLast(2) }
      .map(Substring.init)
  }
}

private struct FileName: Parser {
  var body: some Parser<Substring.UTF8View, Substring> {
    "/".utf8
    PrefixThrough(".swift".utf8)
      .compactMap { $0.split(separator: .init(ascii: "/")).last }
      .map(Substring.init)
  }
}

private struct _TestCaseBody: Parser {
  var body: some Parser<Substring.UTF8View, (Substring, Int, Substring)> {
    FileName()
    ":".utf8
    Int.parser()
    Skip {
      PrefixThrough("] : ".utf8)
    }
    Rest().map(Substring.init)
  }
}

struct TestCaseBody: Parser {
  func parse(
    _ input: inout Substring.UTF8View
  ) throws -> (file: Substring, line: Int, message: Substring) {
    guard input.first == .init(ascii: "/")
    else { throw ParsingError() }

    var slashCount = 0
    let filePathPrefix = input.prefix { codeUnit in
      if codeUnit == .init(ascii: "/") {
        slashCount += 1
      }
      return slashCount != 3
    }

    input.removeFirst(filePathPrefix.count)
    do {
      var failure = try OneOf {
        PrefixUpTo(filePathPrefix)
        PrefixUpTo("Test Case '-[".utf8)
      }
      .parse(&input)

      failure.removeLast()  // trailing newline
      let output = try _TestCaseBody().parse(&failure)
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

private struct TestFailed: Parser {
  var body: some Parser<Substring.UTF8View, [TestResult]> {
    Parse { testName, bodyData, time in
      bodyData.map { body in
        TestResult.failed(
          failureMessage: body.2,
          file: body.0,
          line: body.1,
          testName: testName,
          time: time
        )
      }
    } with: {
      TestCaseStartedLine()
      Many(1...) { TestCaseBody() }
      TestCaseFinishedLine()
    }
  }
}

private struct TestPassed: Parser {
  var body: some Parser<Substring.UTF8View, [TestResult]> {
    Parse {
      [TestResult.passed(testName: $0, time: $1)]
    } with: {
      TestCaseStartedLine()
      TestCaseFinishedLine()
    }
  }
}

private struct TestResults: Parser {
  var body: some Parser<Substring.UTF8View, [TestResult]> {
    Many(into: [TestResult](), +=) {
      OneOf {
        TestFailed()
        TestPassed()
      }
    }
  }
}
