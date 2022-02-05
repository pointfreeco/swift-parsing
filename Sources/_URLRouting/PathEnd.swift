public struct PathEnd: Parser {
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout URLRequestData) throws {
    try End().parse(input.path)
  }
}

extension PathEnd: Printer {
  @inlinable
  public func print(_ output: Void, to input: inout Input) {}
}
