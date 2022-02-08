/// Declares a type that can parse an `Input` value into an `Output` value.
///
/// A parser attempts to parse a nebulous piece of data, represented by the `Input` associated type,
/// into something more well-structured, represented by the `Output` associated type. The parser
/// implements the ``parse(_:)-4u8o0`` method, which is handed an `inout Input`, and its job is to
/// turn this into an `Output` if possible, or otherwise return `nil` if it cannot, which represents
/// a parsing failure.
///
/// The argument of the ``parse(_:)-4u8o0`` function is `inout` because a parser will usually
/// consume some of the input in order to produce an output. For example, we can use an
/// `Int.parser()` parser to extract an integer from the beginning of a substring and consume that
/// portion of the string:
///
/// ```swift
/// var input = "123 Hello world"[...]
///
/// Int.parser().parse(&input) // 123
///
/// precondition(input == " Hello world")
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
public protocol Parser {
  /// The kind of values this parser receives.
  associatedtype Input

  /// The kind of values parsed by this parser.
  associatedtype Output

  /// Attempts to parse a nebulous piece of data into something more well-structured.
  ///
  /// - Parameter input: A nebulous piece of data to be parsed.
  /// - Returns: A more well-structured value parsed from the given input, or `nil`.
  func parse(_ input: inout Input) -> Output?
}

extension Parser {
  @inlinable
  public func parse<SuperSequence>(
    _ input: SuperSequence
  ) -> Output?
  where
    SuperSequence: Collection,
    SuperSequence.SubSequence == Input
  {
    var input = input[...]
    return self.parse(&input)
  }

  @inlinable
  public func parse<S: StringProtocol>(_ input: S) -> Output?
  where
    Input == S.SubSequence.UTF8View
  {
    var input = input[...].utf8
    return self.parse(&input)
  }

  @inlinable
  public func parse<S: StringProtocol>(_ input: S) -> Output?
  where
    Input == Slice<UnsafeBufferPointer<UTF8.CodeUnit>>
  {
    input.utf8
      .withContiguousStorageIfAvailable { input -> Output? in
        var input = input[...]
        return self.parse(&input)
      }?
      .flatMap { $0 }
  }

  @inlinable
  public func parse<C: Collection>(_ input: C) -> Output?
  where
    C.Element == UTF8.CodeUnit,
    Input == Slice<UnsafeBufferPointer<C.Element>>
  {
    input
      .withContiguousStorageIfAvailable { input -> Output? in
        var input = input[...]
        return self.parse(&input)
      }?
      .flatMap { $0 }
  }
}
