public struct PathEnd: Parser {
  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout URLRequestData) -> Void? {
    guard input.path.isEmpty
    else { return nil }
    return ()
  }
}

extension PathEnd: Printer {
  @inlinable
  public func print(_ output: Void) -> URLRequestData? {
    .init()
  }
}
