import Benchmark
import Parsing

let mapSuite = BenchmarkSuite(name: "Map") { suite in
    do {
        let mapReturns = Always<Substring, Int>(42).map { $0 + 1 }
        let tryMapReturns = Always<Substring, Int>(42).tryMap { $0 + 1 }
        let tryMapReplaced = Always<Substring, Int>(42).tryMap { $0 + 1 }.replaceError(with: 0)

        var input = ""[...]
        var expected = 43
        var output: Int!

        suite.benchmark("Always map returns") {
            output = mapReturns.parse(&input)
        } setUp: {
            input = ""[...]
            expected = 43
        } tearDown: {
            tearDown()
        }

        suite.benchmark("Always tryMap returns") {
            output = try tryMapReturns.parse(&input)
        } setUp: {
            input = ""[...]
            expected = 43
        } tearDown: {
            tearDown()
        }

        suite.benchmark("Always tryMap replaced") {
            output = tryMapReplaced.parse(&input)
        } setUp: {
            input = ""[...]
            expected = 43
        } tearDown: {
            tearDown()
        }
        
        func tearDown() {
          precondition(output == expected)
        }
    }
    
    do {
        struct MyError: Error, Equatable {}
        
        let mapReturns = Int.parser(of: Substring.self).map { $0 + 1 }
        let tryMapReturns = Int.parser(of: Substring.self).tryMap { $0 + 1 }
        let mapReplaced = Int.parser(of: Substring.self).map { $0 + 1 }.replaceError(with: Int.max)
        let tryMapReplaced = Int.parser(of: Substring.self).tryMap { $0 + 1 }.replaceError(with: Int.max)
        
        var input: Substring!
        var expected: Int!
        var output: Int!
        
        suite.benchmark("Int map returns") {
            output = try mapReturns.parse(&input)
        } setUp: {
            input = "42"[...]
            expected = 43
        } tearDown: {
            tearDown()
        }
        
        suite.benchmark("Int tryMap returns") {
            output = try tryMapReturns.parse(&input)
        } setUp: {
            input = "42"[...]
            expected = 43
        } tearDown: {
            tearDown()
        }

        suite.benchmark("Int map replaced") {
            output = mapReplaced.parse(&input)
        } setUp: {
            input = "42"[...]
            expected = 43
        } tearDown: {
            tearDown()
        }
        
        suite.benchmark("Int tryMap replaced") {
            output = tryMapReplaced.parse(&input)
        } setUp: {
            input = "42"[...]
            expected = 43
        } tearDown: {
            tearDown()
        }

        func tearDown() {
          precondition(output == expected)
        }
    }
    
    do {
        struct MyError: Error, Equatable {}
        var input = ""[...]
        var expected = 43
        var output: Int!
        
        let tryMapThrows = Always<Substring, Int>(42).tryMap { _ -> Int in throw MyError() }
        let tryMapThrowsReplaced = Int.parser(of: Substring.self).tryMap { _ in throw MyError() }.replaceError(with: Int.max)
        
        var caught: MyError?
        suite.benchmark("Int tryMap throws") {
            do {
                output = try tryMapThrows.parse(&input)
            } catch {
                caught = error as? MyError
            }
        } setUp: {
            output = 0
            expected = 0
        } tearDown: {
            precondition(output == expected)
        }
        
        
        suite.benchmark("Int tryMap throws replaced") {
            output = tryMapThrowsReplaced.parse(&input)
        } setUp: {
            input = "42"[...]
            output = 0
            expected = Int.max
        } tearDown: {
            precondition(output == expected)
        }

    }
}
