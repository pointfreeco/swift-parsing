import Foundation

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
/// } separator: {
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
/// } separator: {
///   ","
/// }
/// var input = "1,2,3"[...]
/// let output = Many(Int.parser(), into: 0, separator: ",").parse(&input)
/// precondition(input == "")
/// precondition(output == 6)
/// ```
public struct Many<Element, Result, Separator, Terminator, Printability>: Parser
where
  Element: Parser,
  Separator: Parser,
  Terminator: Parser,
  Element.Input == Separator.Input,
  Element.Input == Terminator.Input
{
  public let element: Element
  public let initialResult: Result
  public let iterator: (Result) -> AnyIterator<Element.Output>
  public let maximum: Int
  public let minimum: Int
  public let separator: Separator
  public let terminator: Terminator
  public let updateAccumulatingResult: (inout Result, Element.Output) -> Void

  @inlinable
  public func parse(_ input: inout Element.Input) throws -> Result {
    var rest = input
    #if DEBUG
      var previous = input
    #endif
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
      #if DEBUG
        defer { previous = input }
      #endif
      count += 1
      self.updateAccumulatingResult(&result, output)
      rest = input
      do {
        _ = try self.separator.parse(&input)
      } catch {
        loopError = error
        break
      }
      #if DEBUG
        if memcmp(&input, &previous, MemoryLayout<Element.Input>.size) == 0 {
          var description = ""
          debugPrint(output, terminator: "", to: &description)
          breakpoint(
            """
            ---
            A "Many" parser succeeded in parsing a value of "\(Element.Output.self)" \
            (\(description)), but no input was consumed.

            This is considered a logic error that leads to an infinite loop, and is typically \
            introduced by parsers that always succeed, even though they don't consume any input. \
            This includes "Prefix" and "CharacterSet" parsers, which return an empty string when \
            their predicate immediately fails.

            To work around the problem, require that some input is consumed (for example, use \
            "Prefix(minLength: 1)"), or introduce a "separator" parser to "Many".
            ---
            """
          )
        }
      #endif
    }
    input = rest
    do {
      _ = try self.terminator.parse(&input)
    } catch {
      throw loopError ?? error
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
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
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
    let original = input
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
        input = original
        throw PrintingError()
      }
    }
    guard count >= self.minimum
    else {
      input = original
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
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
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
