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
public struct Newline<Input: Collection, Bytes: Collection>: Parser
where
  Input.SubSequence == Input,
  Bytes.Element == UTF8.CodeUnit
{
  @usableFromInline
  let toBytes: (Input) -> Bytes

  @inlinable
  public func parse(_ input: inout Input) throws {
    let bytes = self.toBytes(input)
    if bytes.first == .init(ascii: "\n") {
      input.removeFirst()
      return ()
    } else if bytes.first == .init(ascii: "\r"), bytes.dropFirst().first == .init(ascii: "\n") {
      input.removeFirst(2)
      return
    }
    throw ParsingError.expectedInput("newline", at: input)
  }
}

extension Newline where Bytes == Input {
  @inlinable
  public init()  {
    self.toBytes = { $0 }
  }
}

extension Newline where Input == Substring, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init() { self.toBytes = { $0.utf8 } }
}

extension Newline where Input == Substring.UTF8View, Bytes == Input {
  @_disfavoredOverload
  @inlinable
  public init() { self.init() }
}

extension Newline where Input == ArraySlice<UTF8.CodeUnit>, Bytes == Input {
  @_disfavoredOverload
  @inlinable
  public init() { self.init() }
}

extension Parsers {
  public typealias Newline = Parsing.Newline  // NB: Convenience type alias for discovery
}
