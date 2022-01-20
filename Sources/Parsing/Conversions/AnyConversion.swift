public struct AnyConversion<Input, Output>: Conversion {
  @usableFromInline
  let _apply: (Input) throws -> Output

  @usableFromInline
  let _unapply: (Output) throws -> Input

  public init(
    apply: @escaping (Input) throws -> Output,
    unapply: @escaping (Output) throws -> Input
  ) {
    self._apply = apply
    self._unapply = unapply
  }

  public init<C>(_ conversion: C) where C: Conversion, C.Input == Input, C.Output == Output {
    self.init(apply: conversion.apply, unapply: conversion.unapply)
  }

  public func apply(_ input: Input) throws -> Output {
    try self._apply(input)
  }

  public func unapply(_ output: Output) throws -> Input {
    try self._unapply(output)
  }
}
