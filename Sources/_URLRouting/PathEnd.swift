public struct PathEnd: ParserPrinter {
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout URLRequestData) throws {
    try End().parse(input.path)
  }

  @inlinable
  public func print(_ output: (), into input: inout Input) {}
}
