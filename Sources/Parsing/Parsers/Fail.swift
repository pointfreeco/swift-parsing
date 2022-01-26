/// A parser that always fails, no matter the input.
///
/// Useful for conditionally causing parsing to fail when used with `Parser.flatMap`.
///
/// ```swift
/// let evens = Int.parser().flatMap {
///   if $0.isMultiple(of: 2) {
///     Always($0)
///   } else {
///     Fail()
///   }
/// }
///
/// evens.parse("42")  // 42
/// evens.parse("123") // nil
/// ```
public struct Fail<Input, Output>: Parser {
  @usableFromInline
  let error: Error

  @inlinable
  public init(throwing error: Error) {
    self.error = error
  }

  @inlinable
  public func parse(_ input: inout Input) throws -> Output {
    switch self.error {
    case is ParsingError:
      throw self.error
    default:
      throw ParsingError.failed(
        "",
        .init(
          remainingInput: input,
          debugDescription: "failed",
          underlyingError: self.error
        )
      )
    }
  }
}

extension Fail {
  @inlinable
  public init() {
    self.init(throwing: DefaultError())
  }

  @usableFromInline
  struct DefaultError: Error {
    @usableFromInline
    init() {}
  }
}

extension Parsers {
  public typealias Fail = Parsing.Fail  // NB: Convenience type alias for discovery
}
