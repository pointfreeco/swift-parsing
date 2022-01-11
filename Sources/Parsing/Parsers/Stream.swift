/// A parser that can parse streams of input.
///
/// For example, the following parser can parse an integer followed by a newline from a collection
/// of UTF8 bytes:
///
/// ```swift
/// Parse {
///   Int.parser(of: ArraySlice<UInt8>.self)
///   StartsWith("\n".utf8)
/// }
/// ```
///
/// This parser can be transformed into one that processes an incoming stream of UTF8 bytes:
///
/// ```swift
/// Stream {
///   Parse {
///     Int.parser(of: ArraySlice<UInt8>.self)
///     StartsWith("\n".utf8)
///   }
/// }
/// ```
///
/// And then it can be used on a stream, such as values coming from standard in:
///
/// ```swift
/// var stdin = AnyIterator {
///   readLine().map { ArraySlice($0.utf8) }
/// }
///
/// newlineSeparatedIntegers
///   .parse(&stdin)
/// ```
public struct Stream<Upstream>: Parser
where
  Upstream: Parser,
  Upstream.Input: RangeReplaceableCollection
{
  public let upstream: Upstream

  @inlinable
  public init(@ParserBuilder build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout AnyIterator<Upstream.Input>) -> [Upstream.Output]? {
    var buffer = Upstream.Input()
    var outputs: Output = []
    while let chunk = input.next() {
      buffer.append(contentsOf: chunk)
      while let output = self.upstream.parse(&buffer) {
        outputs.append(output)
      }
    }
    return outputs
  }
}

extension Parsers {
  public typealias Stream = Parsing.Stream  // NB: Convenience type alias for discovery
}
