public struct Method: Parser {
  @usableFromInline
  let name: String

  public static let get = OneOf {
    Self("HEAD")
    Self("GET")
  }

  public static let post = Self("POST")

  public static let put = Self("PUT")

  public static let patch = Self("PATCH")

  public static let delete = Self("DELETE")

  @inlinable
  public init(_ name: String) {
    self.name = name.uppercased()
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) throws {
    guard let method = input.method else { throw RoutingError() }
    try Parse {
      self.name
      End()
    }.parse(method)
    input.method = nil
  }
}

extension Method: Printer {
  @inlinable
  public func print(_ output: (), into input: inout URLRequestData) {
    input.method = self.name
  }
}
