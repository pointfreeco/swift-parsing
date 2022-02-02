extension Parser {
  /// A parser that replaces its error with a provided output.
  ///
  /// ```swift
  /// var input = "123 Hello"[...]
  /// Int.parser().replaceError(with: 0).parse(input)  // 123
  /// input                                            // " Hello"
  ///
  /// input = "Hello"[...]
  /// Int.parser().replaceError(with: 0).parse(input)  // 0
  /// input                                            // "Hello"
  /// ```
  ///
  /// - Parameter output: An output to return should the upstream parser fail.
  /// - Returns: A parser that never fails.
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

extension Parsers.ReplaceError: Printer where Upstream: Printer {
  @inlinable
  public func print(_ output: Upstream.Output, to input: inout Upstream.Input) rethrows {
    let original = input
    // TODO: Is this implementation correct?
    do {
      try self.upstream.print(output, to: &input)
    } catch {
      input = original
      try self.upstream.print(self.output, to: &input)
    }
  }
}
