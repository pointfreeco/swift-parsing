#if CasePaths
  public import CasePaths

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
    public static func `case`<Enum: CasePathable, Path: CasePath>(
      _ keyPath: KeyPath<Enum.AllCasePaths, Path>
    ) -> Self
    where Self == CasePathConversion<Enum, Path>, Path.Root == Enum {
      CasePathConversion(path: Enum.allCasePaths[keyPath: keyPath])
    }

    @inlinable
    public static func `case`<Values, Enum: CasePathable>(
      _ keyPath: CaseKeyPath<Enum, Values>
    ) -> Self where Self == AnyCasePath<Enum, Values> {
      AnyCasePath(keyPath)
    }

    @available(*, deprecated, message: "Use a 'CasePathable' case key path, instead")
    @inlinable
    public static func `case`<Values, Enum>(
      _ initializer: @escaping (Values) -> Enum
    ) -> Self where Self == AnyCasePath<Enum, Values> {
      /initializer
    }

    @available(*, deprecated, message: "Use a 'CasePathable' case key path, instead")
    @inlinable
    public static func `case`<Enum>(
      _ initializer: Enum
    ) -> Self where Self == AnyCasePath<Enum, Void> {
      /initializer
    }
  }

  public struct CasePathConversion<Enum: CasePathable, Path: CasePath>: Conversion
  where Path.Root == Enum {
    @usableFromInline
    let path: Path

    @inlinable
    init(path: Path) {
      self.path = path
    }

    @inlinable
    public func apply(_ input: Path.Value) -> Path.Root {
      path.embed(input)
    }

    @inlinable
    public func unapply(_ output: Path.Root) throws -> Path.Value {
      guard let value = path.extract(from: output)
      else {
        throw ConvertingError(
          """
          case: Failed to extract \(Path.Value.self) from \(output).
          """
        )
      }
      return value
    }
  }

  extension AnyCasePath: Conversion {
    @inlinable
    public func apply(_ input: Value) -> Root {
      self.embed(input)
    }

    @inlinable
    public func unapply(_ output: Root) throws -> Value {
      guard let value = self.extract(from: output)
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
#endif
