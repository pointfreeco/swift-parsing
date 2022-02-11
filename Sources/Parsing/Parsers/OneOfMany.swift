extension Parsers {
  /// A parser that attempts to run a number of parsers till one succeeds.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually loop
  /// over each parser in a builder block:
  ///
  /// ```swift
  /// enum Role: String, CaseIterable {
  ///   case admin
  ///   case guest
  ///   case member
  /// }
  ///
  /// let roleParser = OneOf {
  ///   for role in Role.allCases {
  ///     status.rawValue.map { role }
  ///   }
  /// }
  /// ```
  public struct OneOfMany<Parsers: Parser>: Parser {
    public let parsers: [Parsers]

    @inlinable
    public init(_ parsers: [Parsers]) {
      self.parsers = parsers
    }

    @inlinable
    @inline(__always)
    public func parse(_ input: inout Parsers.Input) throws -> Parsers.Output {
      var errors: [Error] = []
      errors.reserveCapacity(self.parsers.count)
      for parser in self.parsers {
        do {
          var i = input
          let output = try parser.parse(&i)
          input = i
          return output
        } catch {
          errors.append(error)
        }
      }
      throw ParsingError.manyFailed(errors, at: input)
    }
  }
}
