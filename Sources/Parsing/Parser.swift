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
/// Parsers may eagerly consume input, even if they fail to parse a value, and it is typically not
/// necessary to implement additional logic to restore the input to its original state, a process
/// often called "backtracking". Instead, one can rely on the behavior of ``OneOf``, backtracks to
/// the input it starts with whenever one of its parsers fails.
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
