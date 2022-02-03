public struct PathEnd: Parser {
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout URLRequestData) throws {
    guard input.path.isEmpty
    else { throw RoutingError() }
  }
}

extension PathEnd: Printer {
  @inlinable
  public func print(_ output: Void, to input: inout Input) {}
}
