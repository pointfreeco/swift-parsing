/// A type-erased ``Conversion``.
///
/// This conversion forwards its ``apply(_:)`` and ``unapply(_:)`` methods to an arbitrary
/// underlying conversion having the same `Input` and `Output` types, hiding the specifics of the
/// underlying ``Conversion``.
///
/// Use `AnyConversion` to wrap a parser whose type has details you don't want to expose across
/// API boundaries, such as different modules. When you use type erasure this way, you can change
/// the underlying conversion over time without affecting existing clients.
///
/// `AnyConversion` can also be useful for experimenting with ad hoc conversions in a lightweight
/// manner. One can avoid the upfront ceremony of defining a whole new type and instead create a
/// "conformance" inline by specifying the `apply` and `unapply` functions directly
///
/// ```swift
/// Prefix { $0.isNumber }
///   .map(.string)
///   .map(AnyConversion(apply: Int.init, unapply: String.init))
///
/// // vs.
///
/// struct StringToInt: Conversion {
///   func apply(_ input: Substring) throws -> Int {
///     guard let int = Int(Substring) else {
///       struct ConvertingError: Error {}
///       throw ConvertingError()
///     }
///     return int
///   }
///
///   func unapply(_ output: Int) -> String {
///     String(output)
///   }
/// }
///
/// Prefix { $0.isNumber }
///   .map(.string)
///   .map(StringToInt())
/// ```
///
/// If performance is a consideration of your parser-printer, you should avoid `AnyConversion` and
/// instead create custom types that conform to the ``Conversion`` protocol.
public struct AnyConversion<Input, Output>: Conversion {
  @usableFromInline
  let _apply: (Input) throws -> Output

  @usableFromInline
  let _unapply: (Output) throws -> Input

  @_disfavoredOverload
  public init(
    apply: @escaping (Input) throws -> Output,
    unapply: @escaping (Output) throws -> Input
  ) {
    self._apply = apply
    self._unapply = unapply
  }

  public init(
    apply: @escaping (Input) -> Output?,
    unapply: @escaping (Output) -> Input?
  ) {
    self._apply = {
      guard let value = apply($0)
      else { throw ConvertingError() }
      return value
    }
    self._unapply = {
      guard let value = unapply($0)
      else { throw ConvertingError() }
      return value
    }
  }

  /// Creates a type-erasing conversion to wrap the given conversion.
  ///
  /// - Parameter conversion: A conversion to wrap with a type eraser.
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
