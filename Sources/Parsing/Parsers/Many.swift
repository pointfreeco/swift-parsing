/// A parser that attempts to run another parser as many times as specified, accumulating the result
/// of the outputs.
///
/// For example, given a comma-separated string of numbers, one could parse out an array of
/// integers:
///
/// ```swift
/// var input = "1,2,3"[...]
/// let output = Many(Int.parser(), separator: ",").parse(&input)
/// precondition(input == "")
/// precondition(output == [1, 2, 3])
/// ```
///
/// The most general version of `Many` takes a closure that can customize how outputs accumulate,
/// much like `Sequence.reduce(into:_)`. We could, for example, sum the numbers as we parse them
/// instead of accumulating each value in an array:
///
/// ```
/// let sumParser = Many(
///   Int.parser(of: Substring.self),
///   into: 0,
///   separator: StartsWith(","),
///   +=
/// )
/// var input = "1,2,3"[...]
/// let output = Many(Int.parser(), into: 0, separator: ",").parse(&input)
/// precondition(input == "")
/// precondition(output == 6)
/// ```
public struct Many<Upstream, Separator, Accumulator>: Parser
where
  Upstream: Parser,
  Separator: Parser,
  Accumulator: AccumulationStrategy,
  Upstream.Input == Separator.Input,
  Accumulator.Element == Upstream.Output
{
  public let accumulator: Accumulator
  public let initialResult: Accumulator.Result
  public let maximum: Int
  public let minimum: Int
  public let separator: Separator?
  public let upstream: Upstream

  @inlinable
  public init(
    _ upstream: Upstream,
    into initialResult: Accumulator.Result,
    accumulator: Accumulator,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    separator: Separator
  ) {
    self.accumulator = accumulator
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.separator = separator
    self.upstream = upstream
  }

  /// Initializes a parser that attempts to run the given parser at least and at most the given
  /// number of times, accumulating the outputs into a result with a given closure.
  ///
  /// - Parameters:
  ///   - upstream: Another parser.
  ///   - minimum: The minimum number of times to run this parser and consider parsing to be
  ///     successful.
  ///   - maximum: The maximum number of times to run this parser before returning the output.
  ///   - separator: A parser that consumes input between each parsed output.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the upstream parser.
  @inlinable
  public init<Result>(
    _ upstream: Upstream,
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    separator: Separator,
    _ updateAccumulatingResult: @escaping (inout Result, Upstream.Output) -> Void
  ) where Accumulator == AnyAccumulator<Result, Upstream.Output> {
    self.init(
      upstream,
      into: initialResult,
      accumulator: .init(updateAccumulatingResult),
      atLeast: minimum,
      atMost: maximum,
      separator: separator
    )
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Accumulator.Result? {
    let original = input
    var rest = input
    var result = self.initialResult
    var count = 0
    while count < self.maximum, let output = self.upstream.parse(&input) {
      count += 1
      rest = input
      self.accumulator.update(accumulating: &result, output)
      if self.separator != nil, self.separator?.parse(&input) == nil {
        guard count >= self.minimum else {
          input = original
          return nil
        }
        return result
      }
    }
    input = rest
    guard count >= self.minimum else {
      input = original
      return nil
    }
    return result
  }
}

extension Many
where
  Accumulator == CollectionAccumulator<[Upstream.Output]>,
  Separator == Always<Input, Void>
{
  /// Initializes a parser that attempts to run the given parser at least and at most the given
  /// number of times, accumulating the outputs in an array.
  ///
  /// - Parameters:
  ///   - upstream: Another parser.
  ///   - minimum: The minimum number of times to run this parser and consider parsing to be
  ///     successful.
  ///   - maximum: The maximum number of times to run this parser before returning the output.
  @inlinable
  public init(
    _ upstream: Upstream,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max
  ) {
    self.accumulator = .init()
    self.initialResult = []
    self.maximum = maximum
    self.minimum = minimum
    self.separator = nil
    self.upstream = upstream
  }
}

extension Many
where
  Accumulator == CollectionAccumulator<[Upstream.Output]>
{
  /// Initializes a parser that attempts to run the given parser at least and at most the given
  /// number of times, accumulating the outputs in an array.
  ///
  /// - Parameters:
  ///   - upstream: Another parser.
  ///   - minimum: The minimum number of times to run this parser and consider parsing to be
  ///     successful.
  ///   - maximum: The maximum number of times to run this parser before returning the output.
  ///   - separator: A parser that consumes input between each parsed output.
  @inlinable
  public init(
    _ upstream: Upstream,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    separator: Separator
  ) {
    self.init(
      upstream,
      into: [],
      accumulator: .init(),
      atLeast: minimum,
      atMost: maximum,
      separator: separator
    )
  }
}

extension Many where Separator == Always<Input, Void> {

  /// Initializes a parser that attempts to run the given parser at least and at most the given
  /// number of times, accumulating the outputs into a result with a given closure.
  ///
  /// - Parameters:
  ///   - upstream: Another parser.
  ///   - minimum: The minimum number of times to run this parser and consider parsing to be
  ///     successful.
  ///   - maximum: The maximum number of times to run this parser before returning the output.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the upstream parser.
  @inlinable
  public init<Result>(
    _ upstream: Upstream,
    into initialResult: Accumulator.Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Accumulator.Result, Upstream.Output) -> Void
  ) where Accumulator == AnyAccumulator<Result, Upstream.Output> {
    self.accumulator = .init(updateAccumulatingResult)
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.separator = nil
    self.upstream = upstream
  }
}

extension Many: Decodable
where
  Upstream: Decodable,
  Accumulator: Decodable,
  Accumulator.Result: Decodable,
  Separator: Decodable {}

extension Many: Encodable
where
  Upstream: Encodable,
  Accumulator: Encodable,
  Accumulator.Result: Encodable,
  Separator: Encodable {}

extension Many: Equatable
where
  Upstream: Equatable,
  Accumulator: Equatable,
  Accumulator.Result: Equatable,
  Separator: Equatable {}

extension Many: Hashable
where
  Upstream: Hashable,
  Accumulator: Hashable,
  Accumulator.Result: Hashable,
  Separator: Hashable {}

extension Parsers {
  public typealias Many = Parsing.Many  // NB: Convenience type alias for discovery
}

public protocol AccumulationStrategy {
  associatedtype Result
  associatedtype Element

  func update(accumulating result: inout Result, _ element: Element)
}

public struct AnyAccumulator<Result, Element>: AccumulationStrategy {
  public let updateAccumulatingResult: (inout Result, Element) -> Void

  @inlinable
  public init(_ updateAccumulatingResult: @escaping (inout Result, Element) -> Void) {
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  @inlinable
  public func update(accumulating result: inout Result, _ element: Element) {
    self.updateAccumulatingResult(&result, element)
  }
}

public struct CollectionAccumulator<Result>: AccumulationStrategy, Codable, Hashable
where
  Result: RangeReplaceableCollection
{
  @inlinable
  public init() {}

  @inlinable
  public func update(accumulating result: inout Result, _ element: Result.Element) {
    result.append(element)
  }
}
