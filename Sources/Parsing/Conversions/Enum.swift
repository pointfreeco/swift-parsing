import CasePathsCore

extension Conversion {
  /// Converts the associated values of an enum case into the case, and an enum case into its
  /// associated values.
  ///
  /// Useful for transforming the output of a ``ParserPrinter`` into an enum:
  ///
  /// ```swift
  /// @CasePathable
  /// enum Expression {
  ///   case add(Int, Int)
  ///   ...
  /// }
  ///
  /// let add = ParsePrint(.case(\Expression.Cases.add)) {
  ///   Int.parser()
  ///   "+"
  ///   Int.parser()
  /// }
  /// try add.parse("1+2")  // Expression.add(1, 2)
  /// ```
  ///
  /// To transform the output of a ``ParserPrinter`` into a struct, see ``memberwise(_:)``.
  ///
  /// - Parameter embed: An embed function where `Values` directly maps to the memory
  ///   layout of `Enum`, for example the internal, default initializer that is automatically
  ///   synthesized for structs.
  /// - Returns: A conversion that can embed the associated values of an enum case into the case,
  ///   and extract the associated values from the case.
  @inlinable
  public static func `case`<Values, Enum>(
    _ keyPath: CaseKeyPath<Enum, Values>
  ) -> Self where Self == Conversions.EnumConversion<Enum, Values> {
    Self(casePath: AnyCasePath(keyPath))
  }

  /// A performance-optimized version of ``case(_:)``.
  @inlinable
  public static func `case`<Values, Enum: CasePathable>(
    _ keyPath: KeyPath<Enum.AllCasePaths, AnyCasePath<Enum, Values>>
  ) -> Self where Self == Conversions.EnumConversion<Enum, Values> {
    Self(casePath: Enum.allCasePaths[keyPath: keyPath])
  }
}

extension Conversions {
  public struct EnumConversion<Root, Value>: Conversion {
    @usableFromInline
    let casePath: AnyCasePath<Root, Value>

    @inlinable
    init(casePath: AnyCasePath<Root, Value>) {
      self.casePath = casePath
    }

    @inlinable
    public func apply(_ input: Value) -> Root {
      casePath.embed(input)
    }

    @inlinable
    public func unapply(_ output: Root) throws -> Value {
      guard let value = casePath.extract(from: output)
      else {
        throw ConvertingError(
          """
          case: Failed to extract \(Value.self) from \(output).
          """
        )
      }
      return value
    }
  }
}
