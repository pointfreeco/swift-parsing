import Foundation

extension Double {
  /// A parser that consumes a double from the beginning of a collection of UTF-8 code units.
  ///
  /// ```swift
  /// var input = "123.45 Hello world"[...].utf8
  /// let output = Double.parser().parse(&input)
  /// precondition(output == 123.45)
  /// precondition(Substring(input) == " Hello world")
  /// ```
  ///
  /// - Parameter inputType: The collection type of UTF-8 code units to parse.
  /// - Returns: A parser that consumes a double from the beginning of a collection of UTF-8 code
  ///   units.
  @inlinable
  public static func parser<Input>(
    of inputType: Input.Type = Input.self
  ) -> Parsers.DoubleParser<Input> {
    .init()
  }

  /// A parser that consumes a double from the beginning of a substring's UTF-8 view.
  ///
  /// This overload is provided to allow the `Input` generic to be inferred when it is
  /// `Substring.UTF8View`.
  ///
  /// - Parameter inputType: The `Substring.UTF8View` type. This parameter is included to mirror the
  ///   interface that parses any collection of UTF-8 code units.
  /// - Returns: A parser that consumes a double from the beginning of a substring's UTF-8 view.
  @_disfavoredOverload
  @inlinable
  public static func parser(
    of inputType: Substring.UTF8View.Type = Substring.UTF8View.self
  ) -> Parsers.DoubleParser<Substring.UTF8View> {
    .init()
  }

  /// A parser that consumes a double from the beginning of a substring.
  ///
  /// This overload is provided to allow the `Input` generic to be inferred when it is `Substring`.
  ///
  /// - Parameter inputType: The `Substring` type. This parameter is included to mirror the
  ///   interface that parses any collection of UTF-8 code units.
  /// - Returns: A parser that consumes a double from the beginning of a substring.
  @_disfavoredOverload
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> Parsers.UTF8ViewToSubstring<Parsers.DoubleParser<Substring.UTF8View>> {
    .init(.init())
  }
}

extension Float {
  /// A parser that consumes a float from the beginning of a collection of UTF-8 code units.
  ///
  /// ```swift
  /// var input = "123.45 Hello world"[...].utf8
  /// let output = Float.parser().parse(&input)
  /// precondition(output == 123.45)
  /// precondition(Substring(input) == " Hello world")
  /// ```
  ///
  /// - Parameter inputType: The collection type of UTF-8 code units to parse.
  /// - Returns: A parser that consumes a float from the beginning of a collection of UTF-8 code
  ///   units.
  @inlinable
  public static func parser<Input>(
    of inputType: Input.Type = Input.self
  ) -> Parsers.FloatParser<Input> {
    .init()
  }

  /// A parser that consumes a float from the beginning of a substring's UTF-8 view.
  ///
  /// This overload is provided to allow the `Input` generic to be inferred when it is
  /// `Substring.UTF8View`.
  ///
  /// - Parameter inputType: The `Substring.UTF8View` type. This parameter is included to mirror the
  ///   interface that parses any collection of UTF-8 code units.
  /// - Returns: A parser that consumes a float from the beginning of a substring's UTF-8 view.
  @_disfavoredOverload
  @inlinable
  public static func parser(
    of inputType: Substring.UTF8View.Type = Substring.UTF8View.self
  ) -> Parsers.FloatParser<Substring.UTF8View> {
    .init()
  }

  /// A parser that consumes a float from the beginning of a substring.
  ///
  /// This overload is provided to allow the `Input` generic to be inferred when it is `Substring`.
  ///
  /// - Parameter inputType: The `Substring` type. This parameter is included to mirror the
  ///   interface that parses any collection of UTF-8 code units.
  /// - Returns: A parser that consumes a float from the beginning of a substring.
  @_disfavoredOverload
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> Parsers.UTF8ViewToSubstring<Parsers.FloatParser<Substring.UTF8View>> {
    .init(.init())
  }
}

#if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
  extension Float80 {
    /// A parser that consumes an extended-precision, floating-point value from the beginning of a
    /// collection of UTF-8 code units.
    ///
    /// ```swift
    /// var input = "123.45 Hello world"[...].utf8
    /// let output = Float80.parser().parse(&input)
    /// precondition(output == 123.45)
    /// precondition(Substring(input) == " Hello world")
    /// ```
    ///
    /// - Parameter inputType: The collection type of UTF-8 code units to parse.
    /// - Returns: A parser that consumes an extended-precision, floating-point value from the
    ///   beginning of a collection of UTF-8 code units.
    @inlinable
    public static func parser<Input>(
      of inputType: Input.Type = Input.self
    ) -> Parsers.Float80Parser<Input> {
      .init()
    }

    /// A parser that consumes an extended-precision, floating-point value from the beginning of a
    /// substring's UTF-8 view.
    ///
    /// This overload is provided to allow the `Input` generic to be inferred when it is
    /// `Substring.UTF8View`.
    ///
    /// - Parameter inputType: The `Substring.UTF8View` type. This parameter is included to mirror
    ///   the interface that parses any collection of UTF-8 code units.
    /// - Returns: A parser that consumes an extended-precision, floating-point value from the
    ///   beginning of a substring's UTF-8 view.
    @_disfavoredOverload
    @inlinable
    public static func parser(
      of inputType: Substring.UTF8View.Type = Substring.UTF8View.self
    ) -> Parsers.Float80Parser<Substring.UTF8View> {
      .init()
    }

    /// A parser that consumes an extended-precision, floating-point value from the beginning of a
    /// substring.
    ///
    /// This overload is provided to allow the `Input` generic to be inferred when it is
    /// `Substring`.
    ///
    /// - Parameter inputType: The `Substring` type. This parameter is included to mirror the
    ///   interface that parses any collection of UTF-8 code units.
    /// - Returns: A parser that consumes an extended-precision, floating-point value from the
    ///   beginning of a substring.
    @_disfavoredOverload
    @inlinable
    public static func parser(
      of inputType: Substring.Type = Substring.self
    ) -> Parsers.UTF8ViewToSubstring<Parsers.Float80Parser<Substring.UTF8View>> {
      .init(.init())
    }
  }
#endif

extension Parsers {
  /// A parser that consumes a double from the beginning of a collection of UTF-8 code units.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// `Double.parser()`, which constructs this type.
  public struct DoubleParser<Input>: Parser
  where
    Input: Collection,
    Input.SubSequence == Input,
    Input.Element == UTF8.CodeUnit
  {
    @inlinable
    public init() {}

    @inlinable
    public func parse(_ input: inout Input) -> Double? {
      let original = input
      guard
        let s = input.parseFloat(),
        let n = Double(String(decoding: s, as: UTF8.self))
      else {
        input = original
        return nil
      }
      return n
    }
  }

  /// A parser that consumes a float from the beginning of a collection of UTF-8 code units.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// `Float.parser()`, which constructs this type.
  public struct FloatParser<Input>: Parser
  where
    Input: Collection,
    Input.SubSequence == Input,
    Input.Element == UTF8.CodeUnit
  {
    @inlinable
    public init() {}

    @inlinable
    public func parse(_ input: inout Input) -> Float? {
      let original = input
      guard
        let s = input.parseFloat(),
        let n = Float(String(decoding: s, as: UTF8.self))
      else {
        input = original
        return nil
      }
      return n
    }
  }

  #if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
    /// A parser that consumes a float from the beginning of a collection of UTF-8 code units.
    ///
    /// You will not typically need to interact with this type directly. Instead you will usually
    /// use `Float80.parser()`, which constructs this type.
    public struct Float80Parser<Input>: Parser
    where
      Input: Collection,
      Input.SubSequence == Input,
      Input.Element == UTF8.CodeUnit
    {
      @inlinable
      public init() {}

      @inlinable
      public func parse(_ input: inout Input) -> Float80? {
        let original = input
        guard
          let s = input.parseFloat(),
          let n = Float80(String(decoding: s, as: UTF8.self))
        else {
          input = original
          return nil
        }
        return n
      }
    }
  #endif
}

extension Parsers.DoubleParser: Printer where Input: AppendableCollection {
  public func print(_ output: Output) -> Input? {
    .init(String(output).utf8)
  }
}

extension Parsers.FloatParser: Printer where Input: AppendableCollection {
  public func print(_ output: Output) -> Input? {
    .init(String(output).utf8)
  }
}

#if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
  extension Parsers.Float80Parser: Printer where Input: AppendableCollection {
    public func print(_ output: Output) -> Input? {
      .init(String(output).utf8)
    }
  }
#endif

extension Collection where SubSequence == Self, Element == UTF8.CodeUnit {
  @inlinable
  @inline(__always)
  mutating func parseFloat() -> SubSequence? {
    let original = self
    if self.first == .init(ascii: "-") || self.first == .init(ascii: "+") {
      self.removeFirst()
    }
    while let c = self.first, (.init(ascii: "0") ... .init(ascii: "9")).contains(c) {
      self.removeFirst()
    }
    if self.first == .init(ascii: ".") {
      self.removeFirst()
      while let c = self.first, (.init(ascii: "0") ... .init(ascii: "9")).contains(c) {
        self.removeFirst()
      }
    }
    guard self.startIndex != original.startIndex else {
      self = original
      return nil
    }
    if self.first == .init(ascii: "e") || self.first == .init(ascii: "E") {
      if self.first == .init(ascii: "-") || self.first == .init(ascii: "+") {
        self.removeFirst()
      }
      while let c = self.first, (.init(ascii: "0") ... .init(ascii: "9")).contains(c) {
        self.removeFirst()
      }
    }
    return original[..<self.startIndex]
  }
}
