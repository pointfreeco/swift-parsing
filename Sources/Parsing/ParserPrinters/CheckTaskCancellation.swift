/// A trivial parser that fails if the parent task is canceled.
///
/// Parsing can be a long-running procedure. For this reason, you may want to abord the execution of
/// a parser if its parent task is canceled. When you compose parsers using a ``ParserBuilder``,
/// you can insert this trivial parser before a potentially time-consuming sequence of parsers to
/// abord processing it in any case the parent task is canceled, and free the current thread. For
/// example:
///
/// ```swift
/// let parser = Parser {
///   Many {
///     CheckTaskCancellation()
///     csvLineParser
///   }
/// }
/// ```
///
/// This parser's sole purpose is to stop processing if it is evaluated when the parent task is
/// canceled. It doesn't affect parsing or printing results.
///
/// - Throws: This parser throws a `CancellationError` if the parent task is canceled.
public struct CheckTaskCancellation<Input>: ParserPrinter {
  /// Construct a parser that runs the next parsers only if the parent task is not canceled.
  @inlinable
  public init() {}

  @inlinable
  func checkTaskCancellationIfNeeded() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
      #if canImport(_Concurrency) && compiler(>=5.5.2)
      try Task.checkCancellation()
      #endif
    }
  }

  @inlinable
  public func parse(_ input: inout Input) throws {
    try checkTaskCancellationIfNeeded()
  }
  @inlinable
  public func print(_ output: Void, into input: inout Input) throws {
    try checkTaskCancellationIfNeeded()
  }
}

extension CheckTaskCancellation where Input == Substring {
  @inlinable
  public init() {}
}

extension CheckTaskCancellation where Input == Substring.UTF8View {
  @inlinable
  public init() {}
}
