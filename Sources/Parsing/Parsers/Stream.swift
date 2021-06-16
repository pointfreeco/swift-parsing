extension Parser where Input: RangeReplaceableCollection {
  /// Transforms the receiver parser into one that can parse streams of input.
  ///
  /// For example, the following parser can parse an integer followed by a newline from a collection
  /// of UTF8 bytes:
  ///
  ///     Parsers.Integer<ArraySlice<UInt8>, Int>()
  ///       .skip(StartsWith("\n".utf8))
  ///
  /// This parser can be transformed into one that processes an incoming stream of UTF8 bytes:
  ///
  ///     let newlineSeparatedIntegers = Parsers.Integer<ArraySlice<UInt8>, Int>()
  ///       .skip(StartsWith("\n".utf8))
  ///       .stream
  ///
  /// And then it can be used on a stream, such as values coming from standard in:
  ///
  ///     var stdin = AnyIterator {
  ///       readLine().map { ArraySlice($0.utf8) }
  ///     }
  ///
  ///     newlineSeparatedIntegers
  ///       .parse(&stdin)
  ///
  @inlinable
  public var stream: Parsers.Stream<Self> {
    .init(upstream: self)
  }
}

extension Parsers {
  public struct Stream<Upstream>: Parser
  where
    Upstream: Parser,
    Upstream.Input: RangeReplaceableCollection
  {
    public let upstream: Upstream

    @inlinable
    public init(upstream: Upstream) {
      self.upstream = upstream
    }

    @inlinable
    public func parse(_ input: inout AnyIterator<Upstream.Input>) async -> [Upstream.Output]? {
      var buffer = Upstream.Input()
      var outputs: Output = []
      for chunk in input {
        buffer.append(contentsOf: chunk)
        while let output = await self.upstream.parse(&buffer) {
          outputs.append(output)
        }
      }
      return outputs
    }
  }
}


@available(iOS 15.0, *)
struct AsyncSequenceParser<Upstream, S: AsyncSequence>
where
  Upstream: Parser,
  Upstream.Input: RangeReplaceableCollection,
  S.Element == Upstream.Input.Element
{
  let upstream: Upstream

  func parse(_ input: inout S) async -> [Upstream.Output]? {
    do {
      var buffer = Upstream.Input()
      var outputs: [Upstream.Output] = []
      for try await chunk in input {
        buffer.append(chunk)

        while true {
          if let output = await self.upstream.parse(&buffer) {
            outputs.append(output)
          } else {
            break
          }
        }
      }
      return outputs
    } catch {
      return nil
    }
  }
}

import Dispatch
