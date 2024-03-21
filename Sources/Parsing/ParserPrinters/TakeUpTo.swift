/// A parser that consumes a subsequence from the beginning of its input until the `terminator` `Parser`
/// matches. This provides a method of "lazy" (as opposed to "greedy") consumption of the input.
///
/// ```swift
/// let lineParser = TakeUpTo {
///   OneOf { "Park", "World" }
/// }
///
/// var input = "Jurrasic World"[...]
/// let parsed = try line.parse(&input) // ("Jurrasic ", "World")
/// ```
public struct TakeUpTo<Input: Collection, Upstream: Parser>: Parser
where Input.SubSequence == Input, Upstream.Input == Input
{
  public let terminator: Upstream
  
  @inlinable
  public init(
    _ terminator: Upstream
  ) {
    self.terminator = terminator
  }
  
  @inlinable
  public init(
    @ParserBuilder<Input> _ terminator: () -> Upstream
  ) {
    self.terminator = terminator()
  }

  @inlinable
  @inline(__always)
  public func parse(_ input: inout Input) throws -> (Input, Upstream.Output) {
    let original = input
    
    var currentIndex = input.startIndex
    while currentIndex <= input.endIndex {
      do {
        var test = input[currentIndex...]
        let result = try terminator.parse(&test)
        input = test
        return (original[..<currentIndex], result)
      } catch {
        // do nothing
      }
      guard currentIndex < input.endIndex else {
        break
      }
      currentIndex = input.index(after: currentIndex)
    }
    throw ParsingError.expectedInput("take up to \(formatValue(self.terminator))", at: input)
  }
}

extension TakeUpTo: ParserPrinter where Input: PrependableCollection, Upstream: ParserPrinter {
  @inlinable
  public func print(_ output: Output, into input: inout Input) throws {
    let (originalInput, terminatorOutput) = output
    try terminator.print(terminatorOutput, into: &input)
    input.prepend(contentsOf: originalInput)
  }
}

extension Parsers {
    public typealias TakeUpTo = Parsing.TakeUpTo  // NB: Convenience type alias for discovery
}
