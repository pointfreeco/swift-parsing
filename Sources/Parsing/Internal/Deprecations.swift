import Foundation

// NB: Deprecated after 0.11.0

extension Bool {
  @available(*, deprecated, message: "Delete 'of: Substring.self' to silence this warning.")
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> From<
    Conversions.SubstringToUTF8View, Substring.UTF8View, Parsers.BoolParser<Substring.UTF8View>
  > {
    From(.utf8) { Parsers.BoolParser<Substring.UTF8View>() }
  }
}

extension BinaryFloatingPoint where Self: LosslessStringConvertible {
  @_disfavoredOverload
  @available(*, deprecated, message: "Delete 'of: Substring.self' to silence this warning.")
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> From<
    Conversions.SubstringToUTF8View,
    Substring.UTF8View,
    Parsers.FloatParser<Substring.UTF8View, Self>
  > {
    From(.utf8) { Parsers.FloatParser<Substring.UTF8View, Self>() }
  }
}

extension FixedWidthInteger {
  @_disfavoredOverload
  @available(*, deprecated, message: "Delete 'of: Substring.self' to silence this warning.")
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self,
    radix: Int = 10
  ) -> From<
    Conversions.SubstringToUTF8View, Substring.UTF8View, Parsers.IntParser<Substring.UTF8View, Self>
  > {
    From(.utf8) { Parsers.IntParser<Substring.UTF8View, Self>(radix: radix) }
  }
}

extension UUID {
  @_disfavoredOverload
  @available(*, deprecated, message: "Delete 'of: Substring.self' to silence this warning.")
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> From<
    Conversions.SubstringToUTF8View, Substring.UTF8View, Parsers.UUIDParser<Substring.UTF8View>
  > {
    From(.utf8) { Parsers.UUIDParser<Substring.UTF8View>() }
  }
}

// NB: Deprecated after 0.8.0

extension Many where Printability == Never {
  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      minimum...maximum,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      separator: separator,
      terminator: terminator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      minimum...,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      separator: separator,
      terminator: terminator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      ...maximum,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      separator: separator,
      terminator: terminator
    )
  }
}

extension Many
where
  Separator == Always<Input, Void>,
  Terminator == Always<Input, Void>,
  Printability == Never
{
  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element
  ) {
    self.init(
      minimum...maximum,
      into: initialResult,
      updateAccumulatingResult,
      element: element
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element
  ) {
    self.init(
      minimum...,
      into: initialResult,
      updateAccumulatingResult,
      element: element
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element
  ) {
    self.init(
      ...maximum,
      into: initialResult,
      updateAccumulatingResult,
      element: element
    )
  }
}

extension Many where Separator == Always<Input, Void>, Printability == Never {
  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      minimum...maximum,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      terminator: terminator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      minimum...,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      terminator: terminator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      ...maximum,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      terminator: terminator
    )
  }
}

extension Many where Terminator == Always<Input, Void>, Printability == Never {
  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator
  ) where Element.Input == Input, Separator.Input == Input {
    self.init(
      minimum...maximum,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      separator: separator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator
  ) where Element.Input == Input, Separator.Input == Input {
    self.init(
      minimum...,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      separator: separator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    into initialResult: Result,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator
  ) where Element.Input == Input, Separator.Input == Input {
    self.init(
      ...maximum,
      into: initialResult,
      updateAccumulatingResult,
      element: element,
      separator: separator
    )
  }
}

extension Many where Result == [Element.Output], Printability == Void {
  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atLeast minimum: Int,
    atMost maximum: Int,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) where Element.Input == Input, Separator.Input == Input, Terminator.Input == Input {
    self.init(
      minimum...maximum,
      element: element,
      separator: separator,
      terminator: terminator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atLeast minimum: Int,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) where Element.Input == Input, Separator.Input == Input, Terminator.Input == Input {
    self.init(
      minimum...,
      element: element,
      separator: separator,
      terminator: terminator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atMost maximum: Int,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) where Element.Input == Input, Separator.Input == Input, Terminator.Input == Input {
    self.init(
      ...maximum,
      element: element,
      separator: separator,
      terminator: terminator
    )
  }
}

extension Many
where
  Result == [Element.Output],
  Separator == Always<Input, Void>,
  Terminator == Always<Input, Void>,
  Printability == Void
{
  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atLeast minimum: Int,
    atMost maximum: Int,
    @ParserBuilder<Input> element: () -> Element
  ) {
    self.init(
      minimum...maximum,
      element: element
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atLeast minimum: Int,
    @ParserBuilder<Input> element: () -> Element
  ) {
    self.init(
      minimum...,
      element: element
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atMost maximum: Int,
    @ParserBuilder<Input> element: () -> Element
  ) {
    self.init(
      ...maximum,
      element: element
    )
  }
}

extension Many
where
  Result == [Element.Output],
  Separator == Always<Input, Void>,
  Printability == Void
{
  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atLeast minimum: Int,
    atMost maximum: Int,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      minimum...maximum,
      element: element,
      terminator: terminator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atLeast minimum: Int,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      minimum...,
      element: element,
      terminator: terminator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atMost maximum: Int,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> terminator: () -> Terminator
  ) {
    self.init(
      ...maximum,
      element: element,
      terminator: terminator
    )
  }
}

extension Many
where
  Result == [Element.Output],
  Terminator == Always<Input, Void>,
  Printability == Void
{
  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atLeast minimum: Int,
    atMost maximum: Int,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator
  ) where Element.Input == Input, Separator.Input == Input {
    self.init(
      minimum...maximum,
      element: element,
      separator: separator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atLeast minimum: Int,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator
  ) where Element.Input == Input, Separator.Input == Input {
    self.init(
      minimum...,
      element: element,
      separator: separator
    )
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    atMost maximum: Int,
    @ParserBuilder<Input> element: () -> Element,
    @ParserBuilder<Input> separator: () -> Separator
  ) where Element.Input == Input, Separator.Input == Input {
    self.init(
      ...maximum,
      element: element,
      separator: separator
    )
  }
}

@available(*, deprecated, message: "Use 'Whitespace(1, .vertical)' instead")
public struct Newline<InputToBytes: Conversion>: Parser
where
  InputToBytes.Input: Collection,
  InputToBytes.Input.SubSequence == InputToBytes.Input,
  InputToBytes.Output: Collection,
  InputToBytes.Output.Element == UTF8.CodeUnit,
  InputToBytes.Output.SubSequence == InputToBytes.Output
{
  @usableFromInline
  let inputToBytes: InputToBytes

  @inlinable
  public func parse(_ input: inout InputToBytes.Input) throws {
    var bytes = try self.inputToBytes.apply(input)
    if bytes.first == .init(ascii: "\n") {
      bytes.removeFirst()
    } else if bytes.first == .init(ascii: "\r"), bytes.dropFirst().first == .init(ascii: "\n") {
      bytes.removeFirst(2)
    } else {
      throw ParsingError.expectedInput(#""\n" or "\r\n""#, at: input)
    }
    input = try self.inputToBytes.unapply(bytes)
  }
}

@available(*, deprecated, message: "Use 'Whitespace(1, .vertical)' instead")
extension Newline: ParserPrinter
where InputToBytes.Input: PrependableCollection, InputToBytes.Output: PrependableCollection {
  @inlinable
  public func print(_ output: (), into input: inout Input) rethrows {
    input.prepend(contentsOf: try self.inputToBytes.unapply(.init("\n".utf8)))
  }
}

@available(*, deprecated, message: "Use 'Whitespace(1, .vertical)' instead")
extension Newline {
  @inlinable
  public init<C>() where InputToBytes == Conversions.Identity<C> {
    self.inputToBytes = .init()
  }
}

@available(*, deprecated, message: "Use 'Whitespace(1, .vertical)' instead")
extension Newline where InputToBytes == Conversions.SubstringToUTF8View {
  @_disfavoredOverload
  @inlinable
  public init() {
    self.inputToBytes = .init()
  }
}

@available(*, deprecated, message: "Use 'Whitespace(1, .vertical)' instead")
extension Newline where InputToBytes == Conversions.Identity<Substring.UTF8View> {
  @_disfavoredOverload
  @inlinable
  public init() { self.init() }
}

extension Parsers {
  @available(*, deprecated, message: "Use 'Whitespace(1, .vertical)' instead")
  public typealias Newline = Parsing.Newline  // NB: Convenience type alias for discovery
}

extension Prefix {
  @available(*, deprecated, renamed: "minimum")
  public var minLength: Int { self.minimum }

  @available(*, deprecated, renamed: "maximum")
  public var maxLength: Int? { self.maximum }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    minLength: Int,
    maxLength: Int?,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.minimum = minLength
    self.maximum = maxLength
    self.predicate = predicate
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    minLength: Int,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.minimum = minLength
    self.maximum = nil
    self.predicate = predicate
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @inlinable
  public init(
    maxLength: Int,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.minimum = 0
    self.maximum = maxLength
    self.predicate = predicate
  }
}

extension Prefix where Input == Substring {
  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @_disfavoredOverload
  @inlinable
  public init(
    minLength: Int,
    maxLength: Int?,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.init(minLength: minLength, maxLength: maxLength, while: predicate)
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @_disfavoredOverload
  @inlinable
  public init(
    minLength: Int,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.init(minLength: minLength, maxLength: nil, while: predicate)
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @_disfavoredOverload
  @inlinable
  public init(
    maxLength: Int?,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.init(minLength: 0, maxLength: maxLength, while: predicate)
  }
}

extension Prefix where Input == Substring.UTF8View {
  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @_disfavoredOverload
  @inlinable
  public init(
    minLength: Int,
    maxLength: Int?,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.init(minLength: minLength, maxLength: maxLength, while: predicate)
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @_disfavoredOverload
  @inlinable
  public init(
    minLength: Int,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.init(minLength: minLength, maxLength: nil, while: predicate)
  }

  @available(
    *, deprecated,
    message: "Use the initializer that takes a Length (Int or range expression), instead."
  )
  @_disfavoredOverload
  @inlinable
  public init(
    maxLength: Int?,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.init(minLength: 0, maxLength: maxLength, while: predicate)
  }
}

// NB: Deprecated after 0.6.0

@available(*, deprecated, message: "Use 'From(.substring)' instead.")
public struct FromSubstring<Input, SubstringParser: Parser>: Parser
where SubstringParser.Input == Substring {
  public let substringParser: SubstringParser
  public let toSubstring: (Input) -> Substring
  public let fromSubstring: (Substring) -> Input

  @inlinable
  public func parse(_ input: inout Input) rethrows -> SubstringParser.Output {
    var substring = self.toSubstring(input)
    defer { input = self.fromSubstring(substring) }
    return try self.substringParser.parse(&substring)
  }
}

@available(*, deprecated, message: "Use 'From(.substring)' instead.")
extension FromSubstring where Input == ArraySlice<UInt8> {
  @inlinable
  public init(@ParserBuilder<Substring> _ build: () -> SubstringParser) {
    self.substringParser = build()
    self.toSubstring = { Substring(decoding: $0, as: UTF8.self) }
    self.fromSubstring = { ArraySlice($0.utf8) }
  }
}

@available(*, deprecated, message: "Use 'From(.substring)' instead.")
extension FromSubstring where Input == Substring.UnicodeScalarView {
  @inlinable
  public init(@ParserBuilder<Substring> _ build: () -> SubstringParser) {
    self.substringParser = build()
    self.toSubstring = Substring.init
    self.fromSubstring = \.unicodeScalars
  }
}

@available(*, deprecated, message: "Use 'From(.substring)' instead.")
extension FromSubstring where Input == Substring.UTF8View {
  @inlinable
  public init(@ParserBuilder<Substring> _ build: () -> SubstringParser) {
    self.substringParser = build()
    self.toSubstring = Substring.init
    self.fromSubstring = \.utf8
  }
}

@available(*, deprecated, message: "Use 'From(.unicodeScalars)' instead.")
public struct FromUnicodeScalarView<Input, UnicodeScalarsParser: Parser>: Parser
where UnicodeScalarsParser.Input == Substring.UnicodeScalarView {
  public let unicodeScalarsParser: UnicodeScalarsParser
  public let toUnicodeScalars: (Input) -> Substring.UnicodeScalarView
  public let fromUnicodeScalars: (Substring.UnicodeScalarView) -> Input

  @inlinable
  public func parse(_ input: inout Input) rethrows -> UnicodeScalarsParser.Output {
    var unicodeScalars = self.toUnicodeScalars(input)
    defer { input = self.fromUnicodeScalars(unicodeScalars) }
    return try self.unicodeScalarsParser.parse(&unicodeScalars)
  }
}

@available(*, deprecated, message: "Use 'From(.unicodeScalars)' instead.")
extension FromUnicodeScalarView where Input == ArraySlice<UInt8> {
  @inlinable
  public init(@ParserBuilder<Substring.UnicodeScalarView> _ build: () -> UnicodeScalarsParser) {
    self.unicodeScalarsParser = build()
    self.toUnicodeScalars = { Substring(decoding: $0, as: UTF8.self).unicodeScalars }
    self.fromUnicodeScalars = { ArraySlice(Substring($0).utf8) }
  }
}

@available(*, deprecated, message: "Use 'From(.unicodeScalars)' instead.")
extension FromUnicodeScalarView where Input == Substring {
  @inlinable
  public init(@ParserBuilder<Substring.UnicodeScalarView> _ build: () -> UnicodeScalarsParser) {
    self.unicodeScalarsParser = build()
    self.toUnicodeScalars = \.unicodeScalars
    self.fromUnicodeScalars = Substring.init
  }
}

@available(*, deprecated, message: "Use 'From(.unicodeScalars)' instead.")
extension FromUnicodeScalarView where Input == Substring.UTF8View {
  @inlinable
  public init(@ParserBuilder<Substring.UnicodeScalarView> _ build: () -> UnicodeScalarsParser) {
    self.unicodeScalarsParser = build()
    self.toUnicodeScalars = { Substring($0).unicodeScalars }
    self.fromUnicodeScalars = { Substring($0).utf8 }
  }
}

@available(*, deprecated, message: "Use 'From(.utf8)' instead.")
public struct FromUTF8View<Input, UTF8Parser: Parser>: Parser
where UTF8Parser.Input == Substring.UTF8View {
  public let utf8Parser: UTF8Parser
  public let toUTF8: (Input) -> Substring.UTF8View
  public let fromUTF8: (Substring.UTF8View) -> Input

  @inlinable
  public func parse(_ input: inout Input) rethrows -> UTF8Parser.Output {
    var utf8 = self.toUTF8(input)
    defer { input = self.fromUTF8(utf8) }
    return try self.utf8Parser.parse(&utf8)
  }
}

@available(*, deprecated, message: "Use 'From(.utf8)' instead.")
extension FromUTF8View where Input == Substring {
  @inlinable
  public init(@ParserBuilder<Substring.UTF8View> _ build: () -> UTF8Parser) {
    self.utf8Parser = build()
    self.toUTF8 = \.utf8
    self.fromUTF8 = Substring.init
  }
}

@available(*, deprecated, message: "Use 'From(.utf8)' instead.")
extension FromUTF8View where Input == Substring.UnicodeScalarView {
  @inlinable
  public init(@ParserBuilder<Substring.UTF8View> _ build: () -> UTF8Parser) {
    self.utf8Parser = build()
    self.toUTF8 = { Substring($0).utf8 }
    self.fromUTF8 = { Substring($0).unicodeScalars }
  }
}

@available(*, deprecated, renamed: "Parsers.Conditional")
public typealias Conditional = Parsers.Conditional
