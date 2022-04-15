public struct PathEnd: ParserPrinter {
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout URLRequestData) throws {
    try input.path.first.map { try End().parse($0) } ?? End().parse(input.path)
  }

  @inlinable
  public func print(_ output: (), into input: inout Input) throws {
    try End().print((), into: &input.path)
  }
}
