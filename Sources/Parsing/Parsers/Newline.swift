/// A parser that consumes a single newline from the beginning of the input.
///
/// - Note: This parser only consumes a line feed (`"\n"`) or a carriage returns with line feed
///   (`"\r\n"`). If you need richer support that covers all unicode newline characters, use a
///   ``Prefix`` parser that operates on the `Substring` level with a predicate that consumes a
///   single newline:
///
///   ```swift
///   Prefix(1) { $0.isNewline }
///   ```
/// It will consume both line feeds (`"\n"`) and carriage returns with line feeds (`"\r\n"`).
public struct Newline<Input: Collection>: Parser
where
  Input.SubSequence == Input,
  Input.Element == UTF8.CodeUnit
{
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout Input) throws {
    if input.first == .init(ascii: "\n") {
      input.removeFirst()
    } else if input.first == .init(ascii: "\r"), input.dropFirst().first == .init(ascii: "\n") {
      input.removeFirst(2)
    } else {
      throw ParsingError.expectedInput(#""\n" or "\r\n""#, at: input)
    }
  }
}

extension Newline where Input == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init() { self.init() }
}

extension Parsers {
  public typealias Newline = Parsing.Newline  // NB: Convenience type alias for discovery
}
