/// Declares a type that can parse an `Input` value into an `Output` value.
///
/// A parser attempts to parse a nebulous piece of data, represented by the `Input` associated type,
/// into something more well-structured, represented by the `Output` associated type. The parser
/// implements the ``parse(_:)-76tcw`` method, which is handed an `inout Input`, and its job is to
/// turn this into an `Output` if possible, or throw an error if it cannot.
///
/// The argument of the ``parse(_:)-76tcw`` function is `inout` because a parser will usually
/// consume some of the input in order to produce an output. For example, we can use an
/// `Int.parser()` parser to extract an integer from the beginning of a substring and consume that
/// portion of the string:
///
/// ```swift
/// var input = "123 Hello world"[...]
///
/// try Int.parser().parse(&input)  // 123
/// input                           // " Hello world"
/// ```
///
/// The error thrown by the parsers shipped with this library is internal and so should be considered
/// opaque. To get a human-readable description of the error message you can stringify the error. For example,
/// the following `UInt8` parser fails to parse a string that would cause it to overflow:
///
/// ```swift
/// do {
///   var input = "1234 Hello"[...]
///   let number = try UInt8.parser().parse(&input))
/// } catch {
///   print(error)
///
///   // error: failed to process "UInt8"
///   //  --> input:1:1-4
///   // 1 | 1234 Hello
///   //   | ^^^^ overflowed 255
/// }
/// ```
///
/// # Backtracking
///
/// Parsers may consume input even if they throw an error, and you should not depend on a parser
/// restoring the input to the original value when failing. The process of restoring the input to the
/// original value is known as "backtracking". Backtracking can be handy when wanting to try many parsers
/// on the same input, and one usually does this by using the ``OneOf`` parser, which automatically backtracks
/// when one of its parsers fails.
///
/// By not requiring backtracking of each individual parser we can greatly simply the logic of parsers and we
/// can coalesce all backtracking logic into just a single parser, the ``OneOf`` parser. For example, the
/// `.flatMap` operator allows one to sequence two parsers where the second parser can use the output of the
/// first in order to customize its logic. If we required `.flatMap` to do its own backtracking we would be
/// forced to insert logic after each step of the sequence. By not requiring backtracking we can replace 12
/// lines of code with a single line of code:
///
/// ```swift
/// public func parse(_ input: inout Upstream.Input) -> NewParser.Output? {
///   // let original = input
///   // guard let newParser = self.upstream.parse(&input).map(self.transform)
///   // else {
///   //   input = original
///   //   return nil
///   // }
///   // guard let output = newParser.parse(&input)
///   // else {
///   //   input = original
///   //   return nil
///   // }
///   // return output
///   self.upstream.parse(&input).map(self.transform)?.parse(&input)
/// }
/// ```
///
/// If you really need backtracking capabilities then we recommend using the ``OneOf`` parser to control
/// backtracking.
@rethrows public protocol Parser {
  /// The kind of values this parser receives.
  associatedtype Input

  /// The kind of values parsed by this parser.
  associatedtype Output

  /// Attempts to parse a nebulous piece of data into something more well-structured.
  ///
  /// - Parameter input: A nebulous, mutable piece of data to be incrementally parsed.
  /// - Returns: A more well-structured value parsed from the given input.
  func parse(_ input: inout Input) throws -> Output
}

extension Parser {
  /// Attempts to parse a nebulous piece of data into something more well-structured.
  ///
  /// - Parameter input: A nebulous piece of data to be parsed.
  /// - Returns: A more well-structured value parsed from the given input.
  @inlinable
  public func parse(_ input: Input) rethrows -> Output {
    var input = input
    return try self.parse(&input)
  }

  /// Attempts to parse a nebulous collection of data into something more well-structured.
  ///
  /// - Parameter input: A nebulous collection of data to be parsed.
  /// - Returns: A more well-structured value parsed from the given input.
  @inlinable
  public func parse<C: Collection>(_ input: C) rethrows -> Output
  where Input == C.SubSequence {
    try self.parse(input[...])
  }

  /// Attempts to parse a nebulous collection of data into something more well-structured.
  ///
  /// - Parameter input: A nebulous collection of data to be parsed.
  /// - Returns: A more well-structured value parsed from the given input.
  @_disfavoredOverload
  @inlinable
  public func parse<S: StringProtocol>(_ input: S) rethrows -> Output
  where Input == S.SubSequence.UTF8View {
    try self.parse(input[...].utf8)
  }
}
