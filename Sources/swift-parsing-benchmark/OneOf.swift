import Benchmark
import Parsing

let oneOfSuite = BenchmarkSuite(name: "OneOf") { suite in
    enum Options {
        case one
        case two
        case three
    }
    
    let parser = OneOf {
        "one".map { Options.one }
        "two".map { Options.two }
        "three".map { Options.three }
    }
    
    var input: Substring!
    var expected: Options?
    var output: Options?
    
    suite.benchmark("one") {
        output = try parser.parse(&input)
    } setUp: {
        input = "one"[...]
        expected = .one
        output = nil
    } tearDown: {
        tearDown()
    }

    suite.benchmark("two") {
        output = try parser.parse(&input)
    } setUp: {
        input = "two"[...]
        expected = .two
        output = nil
    } tearDown: {
        tearDown()
    }

    suite.benchmark("three") {
        output = try parser.parse(&input)
    } setUp: {
        input = "three"[...]
        expected = .three
        output = nil
    } tearDown: {
        tearDown()
    }
    
    suite.benchmark("fails") {
        do {
            output = try parser.parse(&input)
        } catch {}
    } setUp: {
        input = "fails"[...]
        expected = nil
        output = nil
    } tearDown: {
        tearDown()
    }

    func tearDown() {
      precondition(output == expected)
    }
}
