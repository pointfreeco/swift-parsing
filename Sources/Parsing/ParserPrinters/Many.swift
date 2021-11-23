/// A parser that attempts to run another parser as many times as specified, accumulating the result
/// of the outputs.
///
/// For example, given a comma-separated string of numbers, one could parse out an array of
/// integers:
///
/// ```swift
/// var input = "1,2,3"[...]
/// let output = Many {
///   Int.parser()
/// } separatedBy: {
///   ","
/// }.parse(&input)
/// precondition(input == "")
/// precondition(output == [1, 2, 3])
/// ```
///
/// The most general version of `Many` takes a closure that can customize how outputs accumulate,
/// much like `Sequence.reduce(into:_)`. We could, for example, sum the numbers as we parse them
/// instead of accumulating each value in an array:
///
/// ```
/// let sumParser = Many(into: 0, +=) {
///   Int.parser()
/// } separatedBy: {
///   ","
/// }
/// var input = "1,2,3"[...]
/// let output = Many(into: 0, +=) { Int.parser() } separatedBy: { "," }.parse(&input)
/// precondition(input == "")
/// precondition(output == 6)
/// ```
public struct Many<Upstream, Result, Separator>: Parser
where
  Upstream: Parser,
  Separator: Parser,
  Upstream.Input == Separator.Input
{
  public let initialResult: Result
  public let maximum: Int
  public let minimum: Int
  public let next: (inout Result) -> Upstream.Output?
  public let separator: Separator?
  public let updateAccumulatingResult: (inout Result, Upstream.Output) -> Void
  public let upstream: Upstream

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
  public init(
    _ upstream: Upstream,
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    separator: Separator,
    _ updateAccumulatingResult: @escaping (inout Result, Upstream.Output) -> Void,
    next: @escaping (inout Result) -> Upstream.Output? = { _ in nil }
  ) {
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.next = next
    self.separator = separator
    self.updateAccumulatingResult = updateAccumulatingResult
    self.upstream = upstream
  }

  @inlinable
  public init(
    into initialResult: Result,
    _ updateAccumulatingResult: @escaping (inout Result, Upstream.Output) -> Void,
    next: @escaping (inout Result) -> Upstream.Output? = { _ in nil },
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    @ParserBuilder forEach: () -> Upstream,
    @ParserBuilder separatedBy separator: () -> Separator
  ) {
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.next = next
    self.separator = separator()
    self.updateAccumulatingResult = updateAccumulatingResult
    self.upstream = forEach()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Result? {
    let original = input
    var rest = input
    var result = self.initialResult
    var count = 0
    while count < self.maximum, let output = self.upstream.parse(&input) {
      count += 1
      rest = input
      self.updateAccumulatingResult(&result, output)
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

extension Many where Result == [Upstream.Output], Separator == Always<Input, Void> {
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
    self.init(upstream, into: [], atLeast: minimum, atMost: maximum) {
      $0.append($1)
    } next: {
      $0.isEmpty ? nil : $0.removeFirst()
    }
  }

  @inlinable
  public init(
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    @ParserBuilder forEach: () -> Upstream
  ) {
    self.init(forEach(), into: [], atLeast: minimum, atMost: maximum) {
      $0.append($1)
    } next: {
      $0.isEmpty ? nil : $0.removeFirst()
    }
  }
}

extension Many where Result == [Upstream.Output] {
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
    self.init(upstream, into: [], atLeast: minimum, atMost: maximum, separator: separator) {
      $0.append($1)
    } next: {
      $0.isEmpty ? nil : $0.removeFirst()
    }
  }

  @inlinable
  public init(
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    @ParserBuilder forEach: () -> Upstream,
    @ParserBuilder separatedBy separator: () -> Separator
  ) {
    self.init(forEach(), into: [], atLeast: minimum, atMost: maximum, separator: separator()) {
      $0.append($1)
    } next: {
      $0.isEmpty ? nil : $0.removeFirst()
    }
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
  public init(
    _ upstream: Upstream,
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Upstream.Output) -> Void,
    next: @escaping (inout Result) -> Upstream.Output? = { _ in nil }
  ) {
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.next = next
    self.separator = nil
    self.updateAccumulatingResult = updateAccumulatingResult
    self.upstream = upstream
  }

  @inlinable
  public init(
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    into initialResult: Result,
    _ updateAccumulatingResult: @escaping (inout Result, Upstream.Output) -> Void,
    next: @escaping (inout Result) -> Upstream.Output? = { _ in nil },
    @ParserBuilder forEach: () -> Upstream
  ) {
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.next = next
    self.separator = nil
    self.updateAccumulatingResult = updateAccumulatingResult
    self.upstream = forEach()
  }
}

extension Many: Printer
where
  Upstream: Printer,
  Upstream.Input: Appendable,
  Separator: Printer,
  Separator.Output == Void
{
  public func print(_ output: Result) -> Upstream.Input? {
    var output = output
    var input = Upstream.Input()

    guard let firstInput = self.next(&output).flatMap(self.upstream.print)
    else { return self.minimum == 0 ? input : nil }

    input.append(contentsOf: firstInput)
    var count = 1

    while count < self.maximum, let element = self.next(&output) {
      guard let elementInput = self.upstream.print(element)
      else { break }

      if let separator = self.separator {
        guard let separatorInput = separator.print(())
        else { break }

        input.append(contentsOf: separatorInput)
      }
      input.append(contentsOf: elementInput)
      count += 1
    }

    guard count >= self.minimum else { return nil }
    return input
  }
}

extension Parsers {
  public typealias Many = Parsing.Many  // NB: Convenience type alias for discovery
}
