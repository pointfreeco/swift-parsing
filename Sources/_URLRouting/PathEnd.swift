public struct PathEnd: ParserPrinter {
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout URLRequestData) throws {
    guard var first = input.path.first else { return }
    try End().parse(&first)
  }

  @inlinable
  public func print(_ output: (), into input: inout Input) throws {
    guard var first = input.path.first else { return }
    try End().print((), into: &first)
  }
}
