/// Declares a type that can incrementally "print" an `Output` value into an `Input` value.
///
/// Note: Printing is the reverse operation of parsing, so the `Input` is essentially built up in reverse.
/// As such, new values should be prepended to the front of the input. This allows parsers to check that
/// the already-printed values match what is expected for any given ``Parser``.
@rethrows public protocol Printer: Parser
where PrintInput == ParseOutput, PrintOutput == ParseInput {
  /// The type of values this printer prints.
  associatedtype PrintInput

  /// The type of values this printer prints into.
  associatedtype PrintOutput

  /// Attempts to print a well-structured piece of data into something more nebulous.
  ///
  /// - Parameters
  ///   - output: A well-structured value to be printed to the given input.
  ///   - input: A nebulous, mutable piece of data to be incrementally printed into.
  func print(_ input: PrintInput, into output: inout PrintOutput) throws
}

extension Printer where Input: EmptyInitializable {
  /// Attempts to print a well-structured piece of data to something more nebulous.
  ///
  /// - Parameter output: A well-structured piece of data to be printed.
  /// - Returns: A more nebulous value printed from the given output.
  @inlinable
  public func print(_ input: PrintInput) rethrows -> Input {
    var output = Input()
    try self.print(input, into: &output)
    return output
  }
}

extension Printer where Output == Void {
  /// Attempts to print into a nebulous piece of data.
  ///
  /// - Parameter input: A nebulous, mutable piece of data to be incrementally printed into.
  @inlinable
  public func print(into input: inout Input) rethrows {
    try self.print((), into: &input)
  }
}

extension Printer where Input: EmptyInitializable, Output == Void {
  /// Attempts to print a nebulous piece of data.
  ///
  /// - Returns: A nebulous value.
  @inlinable
  public func print() rethrows -> Input {
    try self.print(())
  }
}
