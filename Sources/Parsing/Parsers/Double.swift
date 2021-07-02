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

  /// A parser that consumes a double from the beginning of a substring.
  ///
  /// ```swift
  /// var input = "123.45 Hello world"[...]
  /// let output = Double.parser().parse(&input)
  /// precondition(output == 123.45)
  /// precondition(input == " Hello world")
  /// ```
  ///
  /// - Parameter inputType: The substring type. This parameter is included to mirror the interface
  ///   that parses UTF-8 code units.
  /// - Returns: A parser that consumes a double from the beginning of a substring.
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> Parsers.SubstringDoubleParser {
    .init()
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

  /// A parser that consumes a float from the beginning of a substring.
  ///
  /// ```swift
  /// var input = "123.45 Hello world"[...]
  /// let output = Float.parser().parse(&input)
  /// precondition(output == 123.45)
  /// precondition(input == " Hello world")
  /// ```
  ///
  /// - Parameter inputType: The substring type. This parameter is included to mirror the interface
  ///   that parses UTF-8 code units.
  /// - Returns: A parser that consumes a float from the beginning of a substring.
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> Parsers.SubstringFloatParser {
    .init()
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
    /// substring.
    ///
    /// ```swift
    /// var input = "123.45 Hello world"[...]
    /// let output = Float80.parser().parse(&input)
    /// precondition(output == 123.45)
    /// precondition(input == " Hello world")
    /// ```
    ///
    /// - Parameter inputType: The substring type. This parameter is included to mirror the interface
    ///   that parses UTF-8 code units.
    /// - Returns: A parser that consumes an extended-precision, floating-point value from the
    ///   beginning of a substring.
    @inlinable
    public static func parser(
      of inputType: Substring.Type = Substring.self
    ) -> Parsers.SubstringFloat80Parser {
      .init()
    }
  }
#endif

extension Parsers {
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

  public struct SubstringDoubleParser: Parser {
    public let parser = Double.parser(of: Substring.UTF8View.self)

    @inlinable
    public init() {}

    @inlinable
    public func parse(_ input: inout Substring) -> Double? {
      self.parser.parse(&input.utf8)
    }
  }

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

  public struct SubstringFloatParser: Parser {
    public let parser = Float.parser(of: Substring.UTF8View.self)

    @inlinable
    public init() {}

    @inlinable
    public func parse(_ input: inout Substring) -> Float? {
      self.parser.parse(&input.utf8)
    }
  }

  #if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
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

    public struct SubstringFloat80Parser: Parser {
      public let parser = Float80.parser(of: Substring.UTF8View.self)

      @inlinable
      public init() {}

      @inlinable
      public func parse(_ input: inout Substring) -> Float80? {
        self.parser.parse(&input.utf8)
      }
    }
  #endif
}

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

#if os(Windows)
  @usableFromInline
  let cLocale: locale_t? = _create_locale(LC_ALL, "C")
#else
  @usableFromInline
  let cLocale: locale_t? = nil
#endif
