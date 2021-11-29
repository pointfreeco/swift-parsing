public struct Method: Parser {
  @usableFromInline
  let name: String

  public static let get = OneOf {
    Self("GET")
    Self("HEAD")
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
  public func parse(_ input: inout URLRequestData) -> Void? {
    guard input.method?.uppercased() == self.name else { return nil }
    return ()
  }
}

extension Method: Printer {
  @inlinable
  public func print(_ output: Void) -> URLRequestData? {
    .init(method: self.name)
  }
}
