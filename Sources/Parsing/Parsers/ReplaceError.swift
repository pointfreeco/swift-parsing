extension Parser {
  @inlinable
  public func replaceError(with output: Output) -> Parsers.ReplaceError<Self> {
    .init(output: output, upstream: self)
  }
}

extension Parsers {
  public struct ReplaceError<Upstream>: Parser where Upstream: Parser {
    @usableFromInline
    let output: Upstream.Output

    @usableFromInline
    let upstream: Upstream

    @usableFromInline
    init(output: Upstream.Output, upstream: Upstream) {
      self.output = output
      self.upstream = upstream
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) -> Upstream.Output {
      let original = input
      do {
        return try self.upstream.parse(&input)
      } catch {
        input = original
        return self.output
      }
    }
  }
}
