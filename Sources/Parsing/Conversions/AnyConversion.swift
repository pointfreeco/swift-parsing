public struct AnyConversion<Input, Output>: Conversion {
  @usableFromInline
  let _apply: (Input) -> Output?

  @usableFromInline
  let _unapply: (Output) -> Input?

  public init(
    apply: @escaping (Input) -> Output?,
    unapply: @escaping (Output) -> Input?
  ) {
    self._apply = apply
    self._unapply = unapply
  }

  public init<C>(_ conversion: C) where C: Conversion, C.Input == Input, C.Output == Output {
    self.init(apply: conversion.apply, unapply: conversion.unapply)
  }

  public func apply(_ input: Input) -> Output? {
    self._apply(input)
  }

  public func unapply(_ output: Output) -> Input? {
    self._unapply(output)
  }
}
