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
/// try evens.parse("42")  // 42
///
/// try evens.parse("123")
/// // error: failed
/// //
/// ```
public struct Fail<Input, Output>: ParserPrinter {
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
      throw ParsingError.wrap(self.error, at: input)
    }
  }

  @inlinable
  public func print(_ output: Output, to input: inout Input) throws {
    switch self.error {
    case is PrintingError:
      throw self.error
    default:
      throw PrintingError()
    }
  }
}

extension Fail {
  @inlinable
  public init() {
    self.init(throwing: DefaultError())
  }

  @usableFromInline
  struct DefaultError: Error, CustomDebugStringConvertible {
    @usableFromInline
    init() {}

    @usableFromInline
    var debugDescription: String {
      "failed"
    }
  }
}

extension Parsers {
  public typealias Fail = Parsing.Fail  // NB: Convenience type alias for discovery
}
