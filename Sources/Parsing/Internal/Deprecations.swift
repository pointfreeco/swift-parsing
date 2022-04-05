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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
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
    @ParserBuilder element: () -> Element
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
    @ParserBuilder element: () -> Element
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
    @ParserBuilder element: () -> Element
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  ) {
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  ) {
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  ) {
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
    @ParserBuilder element: () -> Element
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
    @ParserBuilder element: () -> Element
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
    @ParserBuilder element: () -> Element
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
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
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
    self.init(
      ...maximum,
      element: element,
      separator: separator
    )
  }
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
  public init(@ParserBuilder _ build: () -> SubstringParser) {
    self.substringParser = build()
    self.toSubstring = { Substring(decoding: $0, as: UTF8.self) }
    self.fromSubstring = { ArraySlice($0.utf8) }
  }
}

@available(*, deprecated, message: "Use 'From(.substring)' instead.")
extension FromSubstring where Input == Substring.UnicodeScalarView {
  @inlinable
  public init(@ParserBuilder _ build: () -> SubstringParser) {
    self.substringParser = build()
    self.toSubstring = Substring.init
    self.fromSubstring = \.unicodeScalars
  }
}

@available(*, deprecated, message: "Use 'From(.substring)' instead.")
extension FromSubstring where Input == Substring.UTF8View {
  @inlinable
  public init(@ParserBuilder _ build: () -> SubstringParser) {
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
  public init(@ParserBuilder _ build: () -> UnicodeScalarsParser) {
    self.unicodeScalarsParser = build()
    self.toUnicodeScalars = { Substring(decoding: $0, as: UTF8.self).unicodeScalars }
    self.fromUnicodeScalars = { ArraySlice(Substring($0).utf8) }
  }
}

@available(*, deprecated, message: "Use 'From(.unicodeScalars)' instead.")
extension FromUnicodeScalarView where Input == Substring {
  @inlinable
  public init(@ParserBuilder _ build: () -> UnicodeScalarsParser) {
    self.unicodeScalarsParser = build()
    self.toUnicodeScalars = \.unicodeScalars
    self.fromUnicodeScalars = Substring.init
  }
}

@available(*, deprecated, message: "Use 'From(.unicodeScalars)' instead.")
extension FromUnicodeScalarView where Input == Substring.UTF8View {
  @inlinable
  public init(@ParserBuilder _ build: () -> UnicodeScalarsParser) {
    self.unicodeScalarsParser = build()
    self.toUnicodeScalars = { Substring($0).unicodeScalars }
    self.fromUnicodeScalars = { Substring($0).utf8 }
  }
}

@available(*, deprecated, renamed: "Parsers.Conditional")
public typealias Conditional = Parsers.Conditional
