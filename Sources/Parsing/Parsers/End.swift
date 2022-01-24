/// A parser that succeeds if the input is empty, and fails otherwise.
///
/// Useful as a final parser in a long sequence of parsers to guarantee that all input has been
/// consumed.
///
/// ```swift
/// let parser = Parse {
///   Many {
///     Int.parser()
///   } separator: {
///     ","
///   }
///
///   End()  // All input should be consumed.
/// }
///
/// var input = "1,2,3"[...]
/// parser.parse(&input) // [1, 2, 3]
///
/// input = "1,2,3,hello"
/// parser.parse(&input) // nil
/// ```
public struct End<Input>: Parser where Input: Collection {
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout Input) -> Void? {
    guard input.isEmpty else { return nil }
    return ()
  }
}

extension End where Input == Substring {
  @_disfavoredOverload
  @inlinable
  public init() {}
}

extension End where Input == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init() {}
}

extension Parsers {
  public typealias End = Parsing.End  // NB: Convenience type alias for discovery
}
