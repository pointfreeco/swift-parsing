/// A parser that consumes all ASCII whitespace from the beginning of the input.
///
/// - Note: This parser only consumes ASCII spaces (`" "`), newlines (`"\n"` and `"\r"`), and tabs
///   (`"\t"`). If you need richer support that covers all unicode whitespace, use a ``Prefix``
///   parser that operates on the `Substring` level with a predicate that consumes whitespace:
///
///   ```swift
///   Prefix { $0.isWhitespace }
///   ```
public struct ASCIIWhitespace<Input: Collection, Bytes: Collection>: Parser
where
  Input.SubSequence == Input,
  Bytes.Element == UTF8.CodeUnit
{
  @usableFromInline
  let toBytes: (Input) -> Bytes

  @inlinable
  public init() where Input.Element == UTF8.CodeUnit, Bytes == Input {
    self.toBytes = { $0 }
  }

  @inlinable
  public func parse(_ input: inout Input) -> Void? {
    let output = self.toBytes(input).prefix(while: { (byte: UTF8.CodeUnit) in
      byte == .init(ascii: " ")
        || byte == .init(ascii: "\n")
        || byte == .init(ascii: "\r")
        || byte == .init(ascii: "\t")
    })
    input.removeFirst(output.count)
    return ()
  }
}

extension ASCIIWhitespace where Input == Substring, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init() { self.toBytes = { $0.utf8 } }
}

extension ASCIIWhitespace where Input == Substring.UTF8View, Bytes == Input {
  @_disfavoredOverload
  @inlinable
  public init() { self.init() }
}

extension ASCIIWhitespace where Input == ArraySlice<UTF8.CodeUnit>, Bytes == Input {
  @_disfavoredOverload
  @inlinable
  public init() { self.init() }
}

extension Parsers {
  public typealias Whitespace = Parsing.ASCIIWhitespace  // NB: Convenience type alias for discovery
}
