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
///
/// var input = "1,2,3"[...]
/// try sumParser.parse(&input)  // 6
/// input                        // ""
/// ```
public struct Many<Element: Parser, Result, Separator: Parser, Terminator: Parser>: Parser
where
  Separator.Input == Element.Input,
  Terminator.Input == Element.Input
{
  public let element: Element
  public let initialResult: Result
  public let maximum: Int
  public let minimum: Int
  public let separator: Separator
  public let terminator: Terminator
  public let updateAccumulatingResult: (inout Result, Element.Output) -> Void

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
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.separator = separator()
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }

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

extension Many where Separator == Always<Input, Void>, Terminator == Always<Input, Void> {
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
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
    @ParserBuilder element: () -> Element
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.separator = .init(())
    self.terminator = .init(())
    self.updateAccumulatingResult = updateAccumulatingResult
  }
}

extension Many where Separator == Always<Input, Void> {
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.separator = .init(())
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }
}

extension Many where Terminator == Always<Input, Void> {
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int = 0,
    atMost maximum: Int = .max,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.separator = separator()
    self.terminator = .init(())
    self.updateAccumulatingResult = updateAccumulatingResult
  }
}

extension Many where Result == [Element.Output] {
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
  Terminator == Always<Input, Void>
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
      element: element
    )
  }
}

extension Many where Result == [Element.Output], Separator == Always<Input, Void> {
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
      element: element,
      terminator: terminator
    )
  }
}

extension Many where Result == [Element.Output], Terminator == Always<Input, Void> {
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
      element: element,
      separator: separator
    )
  }
}

extension Parsers {
  public typealias Many = Parsing.Many  // NB: Convenience type alias for discovery
}
