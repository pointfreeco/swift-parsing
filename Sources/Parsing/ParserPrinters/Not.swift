/// A parser that succeeds if the given parser fails, and does not consume any input.
///
/// For example, to parse a line from an input that does not start with "//" one can do:
///
/// ```swift
/// let uncommentedLine = Parse {
///   Not { "//" }
///   PrefixUpTo("\n")
/// }
///
/// try uncommentedLine.parse("let x = 1") // ✅ "let x = 1"
///
/// try uncommentedLine.parse("// let x = 1") // ❌
/// // error: unexpected input
/// //  --> input:1:1-2
/// // 1 | // let x = 1
/// //   | ^^ expected not to be processed
/// ```
public struct Not<Input, Upstream: Parser>: ParserPrinter where Upstream.Input == Input {
  public let upstream: Upstream

  /// Creates a parser that succeeds if the given parser fails, and does not consume any input.
  ///
  /// - Parameter build: A parser that causes this parser to fail if it succeeds, or succeed if it
  ///   fails.
  @inlinable
  public init(@ParserBuilder<Input> _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) throws {
    let original = input
    do {
      _ = try self.upstream.parse(&input)
    } catch {
      input = original
      return
    }
    throw ParsingError.expectedInput("not to be processed", from: original, to: input)
  }

  @inlinable
  public func print(_ output: (), into input: inout Upstream.Input) throws {
    do {
      _ = try self.upstream.parse(&input)
    } catch {
      return
    }
    throw PrintingError.failed(
      summary: """
        round-trip expectation failed

        A "Not" parser-printer was handed a value to print that it would have failed to parse.
        """,
      input: input
    )
  }
}

extension Not: Sendable where Upstream: Sendable { }
