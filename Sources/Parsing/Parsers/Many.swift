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
/// In addition to an element and separator parser, a "terminator" parser that is run after the
/// element parser has run as many times as possible. This can be useful for proving that the `Many`
/// parser has consumed everything you expect:
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
/// The outputs of the element parser do not need to be accumulated in an array. More generally one
/// can specify a closure that customizes how outputs are accumulated, much like
/// `Sequence.reduce(into:_)`. We could, for example, sum the numbers as we parse them instead of
/// accumulating each value in an array:
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
/// This parser fails if the terminator parser fails. For example, if we required our
/// comma-separated integer parser to be terminated by `"---"`, but we parsed a list that contained
/// a non-integer we would get an error:
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
public struct Many<Element: Parser, Result, Separator: Parser, Terminator: Parser>: Parser
where
  Separator.Input == Element.Input,
  Terminator.Input == Element.Input
{
  public let element: Element
  public let initialResult: Result
  public let maximum: Int?
  public let minimum: Int
  public let separator: Separator
  public let terminator: Terminator
  public let updateAccumulatingResult: (inout Result, Element.Output) throws -> Void

  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - length: A bounds that represents the minimum number of times to run this parser and
  ///     consider parsing to be successful, and maximum number of times to run this parser before
  ///     returning the output.
  ///   - initialResult: The value to use as the initial accumulating value.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the element parser.
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - separator: A parser that consumes input between each parsed output.
  ///   - terminator: A parser that consumes any leftover input.
  @inlinable
  public init<R: CountingRange>(
    _ length: R,
    into initialResult: Result,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = length.maximum
    self.minimum = length.minimum
    self.separator = separator()
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - initialResult: The value to use as the initial accumulating value.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the element parser.
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - separator: A parser that consumes input between each parsed output.
  ///   - terminator: A parser that consumes any leftover input.
  @inlinable
  public init(
    into initialResult: Result,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      0...,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      separator: separator,
      terminator: terminator
    )
  }

  @inlinable
  public func parse(_ input: inout Element.Input) throws -> Result {
    var rest = input
    var previous = input
    var result = self.initialResult
    var count = 0
    var loopError: Error?
    while self.maximum.map({ count < $0 }) ?? true {
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

extension Many where Separator == Always<Input, Void>, Terminator == Always<Input, Void> {
  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - length: A bounds that represents the minimum number of times to run this parser and
  ///     consider parsing to be successful, and maximum number of times to run this parser before
  ///     returning the output.
  ///   - initialResult: The value to use as the initial accumulating value.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the element parser.
  ///   - element: A parser to run multiple times to accumulate into a result.
  @inlinable
  public init<R: CountingRange>(
    _ length: R,
    into initialResult: Result,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = length.maximum
    self.minimum = length.minimum
    self.separator = .init(())
    self.terminator = .init(())
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - initialResult: The value to use as the initial accumulating value.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the element parser.
  ///   - element: A parser to run multiple times to accumulate into a result.
  @inlinable
  public init(
    into initialResult: Result,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element
  ) {
    self.init(0..., into: initialResult, updateAccumulatingResult, element: element)
  }
}

extension Many where Separator == Always<Input, Void> {
  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - length: A bounds that represents the minimum number of times to run this parser and
  ///     consider parsing to be successful, and maximum number of times to run this parser before
  ///     returning the output.
  ///   - initialResult: The value to use as the initial accumulating value.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the element parser.
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - terminator: A parser that consumes any leftover input.
  @inlinable
  public init<R: CountingRange>(
    _ length: R,
    into initialResult: Result,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = length.maximum
    self.minimum = length.minimum
    self.separator = .init(())
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - initialResult: The value to use as the initial accumulating value.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the element parser.
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - terminator: A parser that consumes any leftover input.
  @inlinable
  public init(
    into initialResult: Result,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      0...,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      terminator: terminator
    )
  }
}

extension Many where Terminator == Always<Input, Void> {
  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - length: A bounds that represents the minimum number of times to run this parser and
  ///     consider parsing to be successful, and maximum number of times to run this parser before
  ///     returning the output.
  ///   - initialResult: The value to use as the initial accumulating value.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the element parser.
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - separator: A parser that consumes input between each parsed output.
  @inlinable
  public init<R: CountingRange>(
    _ length: R,
    into initialResult: Result,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = length.maximum
    self.minimum = length.minimum
    self.separator = separator()
    self.terminator = .init(())
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - initialResult: The value to use as the initial accumulating value.
  ///   - updateAccumulatingResult: A closure that updates the accumulating result with each output
  ///     of the element parser.
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - separator: A parser that consumes input between each parsed output.
  @inlinable
  public init(
    into initialResult: Result,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator
  ) {
    self.init(
      0...,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      separator: separator
    )
  }
}

extension Many where Result == [Element.Output] {
  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - length: A bounds that represents the minimum number of times to run this parser and
  ///     consider parsing to be successful, and maximum number of times to run this parser before
  ///     returning the output.
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - separator: A parser that consumes input between each parsed output.
  ///   - terminator: A parser that consumes any leftover input.
  @inlinable
  public init<R: CountingRange>(
    _ length: R,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      length,
      into: [],
      { $0.append($1) },
      element: element,
      separator: separator,
      terminator: terminator
    )
  }

  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - separator: A parser that consumes input between each parsed output.
  ///   - terminator: A parser that consumes any leftover input.
  @inlinable
  public init(
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      0...,
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
  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - length: A bounds that represents the minimum number of times to run this parser and
  ///     consider parsing to be successful, and maximum number of times to run this parser before
  ///     returning the output.
  ///   - element: A parser to run multiple times to accumulate into a result.
  @inlinable
  public init<R: CountingRange>(
    _ length: R,
    @ParserBuilder<Input> element: () -> Element
  ) {
    self.init(
      length,
      into: [],
      { $0.append($1) },
      element: element
    )
  }

  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameter element: A parser to run multiple times to accumulate into a result.
  @inlinable
  public init(
    @ParserBuilder<Input> element: () -> Element
  ) {
    self.init(0..., element: element)
  }
}

extension Many where Result == [Element.Output], Separator == Always<Input, Void> {
  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - length: A bounds that represents the minimum number of times to run this parser and
  ///     consider parsing to be successful, and maximum number of times to run this parser before
  ///     returning the output.
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - terminator: A parser that consumes any leftover input.
  @inlinable
  public init<R: CountingRange>(
    _ length: R,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      length,
      into: [],
      { $0.append($1) },
      element: element,
      terminator: terminator
    )
  }

  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - terminator: A parser that consumes any leftover input.
  @inlinable
  public init(
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      0...,
      element: element,
      terminator: terminator
    )
  }
}

extension Many where Result == [Element.Output], Terminator == Always<Input, Void> {
  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - length: A bounds that represents the minimum number of times to run this parser and
  ///     consider parsing to be successful, and maximum number of times to run this parser before
  ///     returning the output.
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - separator: A parser that consumes input between each parsed output.
  @inlinable
  public init<R: CountingRange>(
    _ length: R,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator
  ) {
    self.init(
      length,
      into: [],
      { $0.append($1) },
      element: element,
      separator: separator
    )
  }

  /// Initializes a parser that attempts to run the given parser many times, accumulating the
  /// outputs into a result.
  ///
  /// - Parameters:
  ///   - element: A parser to run multiple times to accumulate into a result.
  ///   - separator: A parser that consumes input between each parsed output.
  @inlinable
  public init(
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator
  ) {
    self.init(
      0...,
      element: element,
      separator: separator
    )
  }
}

extension Parsers {
  public typealias Many = Parsing.Many  // NB: Convenience type alias for discovery
}
