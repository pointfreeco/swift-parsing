import Foundation

/// A parser that attempts to run another parser as many times as specified, accumulating the result
/// of the outputs.
///
/// For example, given a comma-separated string of numbers, one could parse out an array of
/// integers:
///
/// ```swift
/// let intsParser = Many {
///   Int.parser()
/// } separator: {
///   ","
/// }
///
/// var input = "1,2,3"[...]
/// try intsParser.parse(&input)  // [1, 2, 3]
/// input                         // ""
/// ```
///
/// In addition to an element and separator parser, a "terminator" parser that is run after the element
/// parser has run as many times as possible. This can be useful for proving that the `Many` parser has
/// consumed everything you expect:
///
/// ```swift
/// let intsParser = Many {
///   Int.parser()
/// } separator: {
///   ","
/// } terminator: {
///   "---"
/// }
///
/// var input = "1,2,3---"[...]
/// try intsParser.parse(&input)  // [1, 2, 3]
/// input                         // ""
/// ```
///
/// The outputs of the element parser do not need to be accumulated in an array. More generally one can
/// specify a closure that customizes how outputs are accumulated, much like `Sequence.reduce(into:_)`. We
/// could, for example, sum the numbers as we parse them instead of accumulating each value in an array:
///
/// ```swift
/// let sumParser = Many(into: 0, +=) {
///   Int.parser()
/// } separator: {
///   ","
/// }
///
/// var input = "1,2,3"[...]
/// try sumParser.parse(&input)  // 6
/// input                        // ""
/// ```
///
/// This parser fails if the terminator parser fails. For example, if we required our comma-separated
/// integer parser to be terminated by `"---"`, but we parsed a list that contained a non-integer we would
/// get an error:
///
/// ```swift
/// let intsParser = Many {
///   Int.parser()
/// } separator: {
///   ","
/// } terminator: {
///   "---"
/// }
/// var input = "1,2,Hello---"[...]
/// try intsParser.parse(&input)
/// // error: unexpected input
/// //  --> input:1:5
/// // 1 | 1,2,Hello---
/// //   |     ^ expected integer
/// ```
public struct Many<
  Element: Parser, Result, Separator: Parser, Terminator: Parser, Printability
>: Parser
where
  Separator.Input == Element.Input,
  Terminator.Input == Element.Input
{
  public let element: Element
  public let initialResult: Result
  public let iterator: (Result) -> AnyIterator<Element.Output>
  public let maximum: Int
  public let minimum: Int
  public let separator: Separator
  public let terminator: Terminator
  public let updateAccumulatingResult: (inout Result, Element.Output) throws -> Void

  @inlinable
  public func parse(_ input: inout Element.Input) throws -> Result {
    var rest = input
    var previous = input
    var result = self.initialResult
    var count = 0
    var loopError: Error?
    while count < self.maximum {
      let output: Element.Output
      do {
        output = try self.element.parse(&input)
      } catch {
        loopError = error
        break
      }
      defer { previous = input }
      count += 1
      do {
        try self.updateAccumulatingResult(&result, output)
      } catch {
        throw ParsingError.failed(
          "",
          .init(
            originalInput: previous, remainingInput: input, debugDescription: "\(error)",
            underlyingError: error)
        )
      }
      rest = input
      do {
        _ = try self.separator.parse(&input)
      } catch {
        loopError = error
        break
      }
      if memcmp(&input, &previous, MemoryLayout<Element.Input>.size) == 0 {
        throw ParsingError.failed(
          "expected input to be consumed",
          .init(remainingInput: input, debugDescription: "infinite loop", underlyingError: nil)
        )
      }
    }
    input = rest
    do {
      _ = try self.terminator.parse(&input)
    } catch {
      if let loopError = loopError {
        throw ParsingError.manyFailed([loopError, error], at: input)
      } else {
        throw error
      }
    }
    guard count >= self.minimum else {
      let atLeast = self.minimum - count
      throw ParsingError.expectedInput(
        """
        \(atLeast) \(count == 0 ? "" : "more ")value\(atLeast == 1 ? "" : "s") of \
        "\(Element.Output.self)"
        """,
        at: rest
      )
    }
    return result
  }
}

extension Many where Printability == Void {
  /// Initializes a parser that attempts to run the given parser at least and at most the given
  /// number of times, accumulating the outputs into a result with a given closure.
  ///
  /// - Parameters:
  ///   - initialResult: The value to use as the initial accumulating value.
  ///   - minimum: The minimum number of times to run this parser and consider parsing to be
  ///     successful.
  ///   - maximum: The maximum number of times to run this parser before returning the output.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the element parser.
  ///   - iterator: An iterator that can iterate over the elements used to build up a result.
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - separator: A parser that consumes input between each parsed output.
  ///   - terminator: TODO
  @inlinable
  public init<Iterator>(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
    iterator: @escaping (Result) -> Iterator,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  ) where Iterator: IteratorProtocol, Iterator.Element == Element.Output, Printability == Void {
    self.element = element()
    self.initialResult = initialResult
    self.iterator = { AnyIterator(iterator($0)) }
    self.maximum = maximum
    self.minimum = minimum
    self.separator = separator()
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }
}

extension Many where Printability == Never {
  /// Initializes a parser that attempts to run the given parser at least and at most the given
  /// number of times, accumulating the outputs into a result with a given closure.
  ///
  /// - Parameters:
  ///   - initialResult: The value to use as the initial accumulating value.
  ///   - minimum: The minimum number of times to run this parser and consider parsing to be
  ///     successful.
  ///   - maximum: The maximum number of times to run this parser before returning the output.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the element parser.
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - separator: A parser that consumes input between each parsed output.
  ///   - terminator: TODO
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  ) where Printability == Never {
    self.element = element()
    self.initialResult = initialResult
    self.iterator = { _ in fatalError() }
    self.maximum = maximum
    self.minimum = minimum
    self.separator = separator()
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }
}

extension Many: Printer
where
  Element: Printer,
  Separator: Printer,
  Separator.Output == Void,
  Terminator: Printer,
  Terminator.Output == Void,
  Printability == Void
{
  @inlinable
  public func print(_ output: Result, to input: inout Element.Input) throws {
    let iterator = self.iterator(output)
    guard let first = iterator.next() else {
      guard self.minimum == 0 else { throw PrintingError() }
      return
    }
    try self.element.print(first, to: &input)
    var count = 1
    while let element = iterator.next() {
      try self.separator.print(to: &input)
      try self.element.print(element, to: &input)
      count += 1
      guard count <= self.maximum
      else {
        throw PrintingError()
      }
    }
    guard count >= self.minimum
    else {
      throw PrintingError()
    }
    try self.terminator.print(to: &input)
  }
}

extension Many
where
  Separator == Always<Element.Input, Void>,
  Terminator == Always<Element.Input, Void>,
  Printability == Void
{
  /// Initializes a parser that attempts to run the given parser at least and at most the given
  /// number of times, accumulating the outputs into a result with a given closure.
  ///
  /// - Parameters:
  ///   - initialResult: The value to use as the initial accumulating value.
  ///   - minimum: The minimum number of times to run this parser and consider parsing to be
  ///     successful.
  ///   - maximum: The maximum number of times to run this parser before returning the output.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the element parser.
  ///   - iterator: An iterator that can iterate over the elements used to build up a result.
  ///   - element: A parser to run multiple times to accumulate into a result.
  @inlinable
  public init<Iterator>(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
    iterator: @escaping (Result) -> Iterator,
    @ParserBuilder element: () -> Element
  ) where Iterator: IteratorProtocol, Iterator.Element == Element.Output {
    self.init(
      into: initialResult,
      atLeast: minimum,
      atMost: maximum,
      updateAccumulatingResult,
      iterator: iterator,
      element: element,
      separator: { Always<Element.Input, Void>(()) },
      terminator: { Always<Element.Input, Void>(()) }
    )
  }
}

extension Many
where
  Separator == Always<Element.Input, Void>,
  Terminator == Always<Element.Input, Void>,
  Printability == Never
{
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
    @ParserBuilder element: () -> Element
  ) {
    self.init(
      into: initialResult,
      atLeast: minimum,
      atMost: maximum,
      updateAccumulatingResult,
      element: element,
      separator: { Always<Element.Input, Void>(()) },
      terminator: { Always<Element.Input, Void>(()) }
    )
  }
}

extension Many where Separator == Always<Input, Void>, Printability == Void {
  @inlinable
  public init<Iterator>(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
    iterator: @escaping (Result) -> Iterator,
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
  ) where Iterator: IteratorProtocol, Iterator.Element == Element.Output {
    self.init(
      into: initialResult,
      atLeast: minimum,
      atMost: maximum,
      updateAccumulatingResult,
      iterator: iterator,
      element: element,
      separator: { Always<Element.Input, Void>(()) },
      terminator: terminator
    )
  }
}

extension Many where Separator == Always<Input, Void>, Printability == Never {
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.init(
      into: initialResult,
      atLeast: minimum,
      atMost: maximum,
      updateAccumulatingResult,
      element: element,
      separator: { Always<Element.Input, Void>(()) },
      terminator: terminator
    )
  }
}

extension Many where Terminator == Always<Input, Void>, Printability == Void {
  @inlinable
  public init<Iterator>(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
    iterator: @escaping (Result) -> Iterator,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) where Iterator: IteratorProtocol, Iterator.Element == Element.Output {
    self.init(
      into: initialResult,
      atLeast: minimum,
      atMost: maximum,
      updateAccumulatingResult,
      iterator: { AnyIterator(iterator($0)) },
      element: element,
      separator: separator,
      terminator: { Always<Input, Void>(()) }
    )
  }
}

extension Many where Terminator == Always<Input, Void>, Printability == Never {
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
    self.init(
      into: initialResult,
      atLeast: minimum,
      atMost: maximum,
      updateAccumulatingResult,
      element: element,
      separator: separator,
      terminator: { Always<Input, Void>(()) }
    )
  }
}

extension Many where Result == [Element.Output], Printability == Void {
  /// Initializes a parser that attempts to run the given parser at least and at most the given
  /// number of times, accumulating the outputs in an array.
  ///
  /// - Parameters:
  ///   - minimum: The minimum number of times to run this parser and consider parsing to be
  ///     successful.
  ///   - maximum: The maximum number of times to run this parser before returning the output.
  ///   - element: A parser to run multiple times to accumulate into an array.
  ///   - separator: A parser that consumes input between each parsed output.
  @inlinable
  public init(
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.init(
      into: [],
      atLeast: minimum,
      atMost: maximum,
      { $0.append($1) },
      iterator: { $0.makeIterator() },
      element: element,
      separator: separator,
      terminator: terminator
    )
  }
}

extension Many
where
  Result == [Element.Output],
  Separator == Always<Input, Void>,
  Terminator == Always<Input, Void>,
  Printability == Void
{
  /// Initializes a parser that attempts to run the given parser at least and at most the given
  /// number of times, accumulating the outputs in an array.
  ///
  /// - Parameters:
  ///   - minimum: The minimum number of times to run this parser and consider parsing to be
  ///     successful.
  ///   - maximum: The maximum number of times to run this parser before returning the output.
  ///   - element: A parser to run multiple times to accumulate into an array.
  @inlinable
  public init(
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    @ParserBuilder element: () -> Element
  ) {
    self.init(
      into: [],
      atLeast: minimum,
      atMost: maximum,
      { $0.append($1) },
      iterator: { $0.makeIterator() },
      element: element
    )
  }
}

extension Many
where
  Result == [Element.Output],
  Separator == Always<Input, Void>,
  Printability == Void
{
  @inlinable
  public init(
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.init(
      into: [],
      atLeast: minimum,
      atMost: maximum,
      { $0.append($1) },
      iterator: { $0.makeIterator() },
      element: element,
      terminator: terminator
    )
  }
}

extension Many
where
  Result == [Element.Output],
  Terminator == Always<Input, Void>,
  Printability == Void
{
  @inlinable
  public init(
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
    self.init(
      into: [],
      atLeast: minimum,
      atMost: maximum,
      { $0.append($1) },
      iterator: { $0.makeIterator() },
      element: element,
      separator: separator
    )
  }
}

extension Parsers {
  public typealias Many = Parsing.Many  // NB: Convenience type alias for discovery
}
