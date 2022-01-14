public struct Conversion<Input, Output>: ParserPrinter {
  public let apply: (Input) -> Output
  public let unapply: (Output) -> Input

  @inlinable
  public init(
    apply: @escaping (Input) -> Output,
    unapply: @escaping (Output) -> Input
  ) {
    self.apply = apply
    self.unapply = unapply
  }

  @inlinable
  public func parse(_ input: inout Input) -> Output {
    self.apply(input)
  }

  @inlinable
  public func print(_ output: Output) -> Input? {
    self.unapply(output)
  }
}

public struct PartialConversion<Input, Output>: ParserPrinter {
  public let apply: (Input) throws -> Output
  public let unapply: (Output) throws -> Input

  @inlinable
  public init(
    apply: @escaping (Input) throws -> Output,
    unapply: @escaping (Output) throws -> Input
  ) {
    self.apply = apply
    self.unapply = unapply
  }

  @inlinable
  public func parse(_ input: inout Input) throws -> Output {
    try self.apply(input)
  }

  @inlinable
  public func print(_ output: Output) -> Input? {
    try? self.unapply(output)
  }
}
