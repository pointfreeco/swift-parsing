/// A parser that succeeds if the input is empty, and fails otherwise.
///
/// Useful as a final parser in a long sequence of parsers to guarantee that all input has been
/// consumed, especially as ``Many``'s terminal parser.
///
/// This parser will fail if there are input elements that have not been consumed:
///
/// ```swift
/// input = "Hello, Blob!!"
/// try parser.parse(&input)
/// // error: unexpected input
/// //  --> input:1:13
/// // 1 | Hello, Blob!!
/// //   |             ^ expected end of input
/// ```
///
/// > Note: This parser is automatically inserted when you invoke the non-incremental
/// > ``Parser/parse(_:)-6h1d0`` and ``Parser/parse(_:)-2wzcq`` methods.
public struct End<Input: Sequence>: ParserPrinter, Sendable {
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout Input) throws {
    var iterator = input.makeIterator()
    guard iterator.next() == nil else {
      throw ParsingError.expectedInput("end of input", at: input)
    }
  }

  @inlinable
  public func print(_ output: (), into input: inout Input) throws {
    var iterator = input.makeIterator()
    guard iterator.next() == nil else {
      let description = describe(input).map { "\n\n\($0.debugDescription)" } ?? ""
      throw PrintingError.failed(
        summary: """
          round-trip expectation failed

          An "End" parser-printer expected no more input, but more was printed.\(description)

          During a round-trip, the "End" parser-printer would have failed to parse at this \
          remaining input.
          """,
        input: input
      )
    }
  }
}

extension Parsers {
  public typealias End = Parsing.End  // NB: Convenience type alias for discovery
}
