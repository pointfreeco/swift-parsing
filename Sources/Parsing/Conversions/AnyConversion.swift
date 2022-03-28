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
///   .map(
///     AnyConversion(
///       apply: { Int(String($0)) },
///       unapply: { String($0)[...] {
///     )
///   )
///
/// // vs.
///
/// struct SubstringToInt: Conversion {
///   func apply(_ input: Substring) throws -> Int {
///     guard let int = Int(String(input)) else {
///       struct ConvertingError: Error {}
///       throw ConvertingError()
///     }
///     return int
///   }
///
///   func unapply(_ output: Int) -> Substring {
///     String(output)[...]
///   }
/// }
///
/// Prefix { $0.isNumber }
///   .map(SubstringToInt())
/// ```
///
/// If performance is a consideration of your parser-printer, you should avoid `AnyConversion` and
/// instead create custom types that conform to the ``Conversion`` protocol.
public struct AnyConversion<Input, Output>: Conversion {
  @usableFromInline
  let _apply: (Input) throws -> Output

  @usableFromInline
  let _unapply: (Output) throws -> Input

  /// Creates a conversion that wraps the given closures in its ``apply(_:)`` and ``unapply(_:)``
  /// methods.
  ///
  /// - Parameters:
  ///   - apply: A closure that attempts to convert an input into an output. `apply` is executed
  ///     each time the ``apply(_:)`` method is called on the resulting conversion.
  ///   - unapply: A closure that attempts to convert an output into an input. `unapply` is executed
  ///     each time the ``unapply(_:)`` method is called on the resulting conversion.
  @_disfavoredOverload
  @inlinable
  public init(
    apply: @escaping (Input) throws -> Output,
    unapply: @escaping (Output) throws -> Input
  ) {
    self._apply = apply
    self._unapply = unapply
  }

  /// Creates a conversion that wraps the given closures in its ``apply(_:)`` and ``unapply(_:)``
  /// methods, throwing an error when `nil` is returned.
  ///
  /// - Parameters:
  ///   - apply: A closure that attempts to convert an input into an output. `apply` is executed
  ///     each time the ``apply(_:)`` method is called on the resulting conversion. If the closure
  ///     returns `nil`, an error is thrown. Otherwise, the value is unwrapped.
  ///   - unapply: A closure that attempts to convert an output into an input. `unapply` is executed
  ///     each time the ``unapply(_:)`` method is called on the resulting conversion. If the closure
  ///     returns `nil`, an error is thrown. Otherwise, the value is unwrapped.
  @inlinable
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
  @inlinable
  public init<C: Conversion>(_ conversion: C) where C.Input == Input, C.Output == Output {
    self.init(apply: conversion.apply, unapply: conversion.unapply)
  }

  @inlinable
  public func apply(_ input: Input) throws -> Output {
    try self._apply(input)
  }

  @inlinable
  public func unapply(_ output: Output) throws -> Input {
    try self._unapply(output)
  }
}
