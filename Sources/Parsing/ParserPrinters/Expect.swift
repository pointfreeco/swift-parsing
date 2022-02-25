/// A parser that succeeds if the given parser fails, and does not consume any input.
///
/// For example:
///
/// ```swift
/// let commentedLine = Parse {
///   Expect { "//" }
///   PrefixUpTo("\n")
/// }
/// ```
///
/// This will check the input start with `"//"`, and if it does, it will return the whole
/// input up to the first newline.
public struct Expect<Upstream: Parser>: ParserPrinter {
  public let upstream: Upstream

  /// Creates a parser that succeeds if the given parser fails, and does not consume any input.
  ///
  /// - Parameter build: A parser that causes this parser to fail if it succeeds, or succeed if it
  ///   fails.
  @inlinable
  public init(@ParserBuilder _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) throws {
    var i = input
    do {
      _ = try self.upstream.parse(&i)
    } catch {
      throw ParsingError.expectedInput("to be processed", from: input, to: i)
    }
  }

  @inlinable
  public func print(_ output: Void, to input: inout Upstream.Input) throws {
    do {
      var i = input
      _ = try upstream.parse(&i)
    } catch {
      throw PrintingError()
    }
  }
}
