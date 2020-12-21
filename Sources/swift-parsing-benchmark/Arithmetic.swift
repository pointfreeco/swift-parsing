import Benchmark
import Parsing

private var expr: AnyParser<Substring.UTF8View, Int> {
  Lazy { term }.chainl1(
    symbol("+").take(Always(+))
      .orElse(symbol("-").take(Always(-)))
  )
  .eraseToAnyParser()
}

private var term: AnyParser<Substring.UTF8View, Int> {
  factor.chainl1(
    symbol("*").take(Always(*))
      .orElse(symbol("/").take(Always(/)))
  )
  .eraseToAnyParser()
}

private let factor = symbol("(").take(Lazy { expr }).skip(symbol(")"))
  .orElse(natural)

private let natural = Skip(Whitespace<Substring.UTF8View>()).take(Int.parser()).skip(Whitespace())

private let symbol = { (symbol: String) in
  Skip(Whitespace<Substring.UTF8View>()).skip(StartsWith(symbol.utf8)).skip(Whitespace())
}

private func fix<A, B>(_ f: @escaping (@escaping (A) -> B) -> (A) -> B) -> (A) -> B {
  return { f(fix(f))($0) }
}

extension Parser {
  fileprivate func chainl1<P>(_ op: P) -> AnyParser<Input, Output>
  where P: Parser, P.Input == Input, P.Output == (Output, Output) -> Output {
    self.flatMap { x in
      fix { recur in
        { x in
          op.flatMap { f in
            self.flatMap { y in
              recur(f(x, y))
                .eraseToAnyParser()
            }
          }
          .orElse(Always(x))
          .eraseToAnyParser()
        }
      }(x)
    }
    .eraseToAnyParser()
  }
}

let arithmeticSuite = BenchmarkSuite(name: "Arithmetic") { suite in
  let arithmetic = "1 + 2 * 3 / 4 - 5"

  suite.benchmark("Parser") {
    var a = arithmetic[...].utf8
    precondition(expr.parse(&a) == -3)
  }
}
