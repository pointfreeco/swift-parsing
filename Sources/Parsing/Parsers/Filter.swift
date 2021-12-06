extension Parser {
  /// Returns a parser that filters output from this parser when its output does not satisfy the
  /// given predicate.
  ///
  /// This method is similar to `Sequence.filter` in the Swift standard library, as well as
  /// `Publisher.filter` in the Combine framework.
  ///
  /// - Parameter predicate: A closure that takes an output from this parser and returns a Boolean
  ///   value indicating whether the output should be returned.
  /// - Returns: A parser that filters its output.
  @_disfavoredOverload
  @inlinable
  public func filter(_ predicate: @escaping (Output) -> Bool) -> Parsers.Filter<Self> {
    .init(upstream: self, predicate: predicate)
  }
}

extension Parsers {
  /// A parser that filters the output of an upstream parser when it does not satisfy a predicate.
  ///
  /// Returned from the ``Parser/filter(_:)`` method.
  public struct Filter<Upstream>: Parser where Upstream: Parser {
    public let upstream: Upstream
    public let predicate: (Upstream.Output) -> Bool

    @inlinable
    public init(upstream: Upstream, predicate: @escaping (Upstream.Output) -> Bool) {
      self.upstream = upstream
      self.predicate = predicate
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
      let original = input
      guard
        let output = self.upstream.parse(&input),
        self.predicate(output)
      else {
        input = original
        return nil
      }
      return output
    }
  }
}

extension Parser where Output: Collection {
  /// Transforms the receiver parser of a `Collection` into one that fails when the output is empty.
  @inlinable
  public var nonEmpty: Parsers.Filter<Self> {
    filter{ !$0.isEmpty }
  }
}

extension Parser where Output: RandomAccessCollection {
  /// Transforms the receiver parser of a `Collection` into one that require a minimum number of
  /// elements to be parsed.
  /// - Parameter n: The minimum number of elements to be parsed in order to succeed.
  /// - Returns: A parser of a `Collection` that succeeds only if a minimum number of
  /// elements are parsed, and fails otherwise.
  ///
  /// - Complexity: O(1)
  @inlinable
  public func atLeast(_ n: Int) -> Parsers.Filter<Self> {
    filter { $0.count >= n }
  }
}

extension Parser where Output: Collection {
  /// Transforms the receiver parser of a `Collection` into one that require a minimum number of
  /// elements to be parsed.
  /// - Parameter n: The minimum number of elements to be parsed in order to succeed.
  /// - Returns: A parser of a `Collection` that succeeds only if a minimum number of
  /// elements are parsed, and fails otherwise.
  ///
  /// - Complexity: O(n)
  @inlinable
  public func atLeast(_ n: Int) -> Parsers.Filter<Self> {
    filter { $0.count >= n }
  }
}
