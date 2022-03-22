// NB: Deprecated after 0.8.0

extension Many {
  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
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
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.separator = separator()
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = nil
    self.minimum = minimum
    self.separator = separator()
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    into initialResult: Result,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = 0
    self.separator = separator()
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }
}

extension Many where Separator == Always<Input, Void>, Terminator == Always<Input, Void> {
  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.separator = .init(())
    self.terminator = .init(())
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = nil
    self.minimum = minimum
    self.separator = .init(())
    self.terminator = .init(())
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    into initialResult: Result,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = 0
    self.separator = .init(())
    self.terminator = .init(())
    self.updateAccumulatingResult = updateAccumulatingResult
  }
}

extension Many where Separator == Always<Input, Void> {
  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.separator = .init(())
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = nil
    self.minimum = minimum
    self.separator = .init(())
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    into initialResult: Result,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = 0
    self.separator = .init(())
    self.terminator = terminator()
    self.updateAccumulatingResult = updateAccumulatingResult
  }
}

extension Many where Terminator == Always<Input, Void> {
  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = minimum
    self.separator = separator()
    self.terminator = .init(())
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    into initialResult: Result,
    atLeast minimum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = nil
    self.minimum = minimum
    self.separator = separator()
    self.terminator = .init(())
    self.updateAccumulatingResult = updateAccumulatingResult
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    into initialResult: Result,
    atMost maximum: Int,
    _ updateAccumulatingResult: @escaping (inout Result, Element.Output) throws -> Void,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
    self.element = element()
    self.initialResult = initialResult
    self.maximum = maximum
    self.minimum = 0
    self.separator = separator()
    self.terminator = .init(())
    self.updateAccumulatingResult = updateAccumulatingResult
  }
}

extension Many where Result == [Element.Output] {
  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    atLeast minimum: Int,
    atMost maximum: Int,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.init(
      into: [],
      atLeast: minimum,
      atMost: maximum,
      { $0.append($1) },
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
  Terminator == Always<Input, Void>
{
  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    atLeast minimum: Int,
    atMost maximum: Int,
    @ParserBuilder element: () -> Element
  ) {
    self.init(
      into: [],
      atLeast: minimum,
      atMost: maximum,
      { $0.append($1) },
      element: element
    )
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    atLeast minimum: Int,
    @ParserBuilder element: () -> Element
  ) {
    self.init(
      into: [],
      atLeast: minimum,
      atMost: .max,
      { $0.append($1) },
      element: element
    )
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    atMost maximum: Int,
    @ParserBuilder element: () -> Element
  ) {
    self.init(
      into: [],
      atLeast: 0,
      atMost: maximum,
      { $0.append($1) },
      element: element
    )
  }
}

extension Many where Result == [Element.Output], Separator == Always<Input, Void> {
  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    atLeast minimum: Int,
    atMost maximum: Int,
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.init(
      into: [],
      atLeast: minimum,
      atMost: maximum,
      { $0.append($1) },
      element: element,
      terminator: terminator
    )
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    atLeast minimum: Int,
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.init(
      into: [],
      atLeast: minimum,
      atMost: .max,
      { $0.append($1) },
      element: element,
      terminator: terminator
    )
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    atMost maximum: Int,
    @ParserBuilder element: () -> Element,
    @ParserBuilder terminator: () -> Terminator
  ) {
    self.init(
      into: [],
      atLeast: 0,
      atMost: maximum,
      { $0.append($1) },
      element: element,
      terminator: terminator
    )
  }
}

extension Many where Result == [Element.Output], Terminator == Always<Input, Void> {
  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    atLeast minimum: Int,
    atMost maximum: Int,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
    self.init(
      into: [],
      atLeast: minimum,
      atMost: maximum,
      { $0.append($1) },
      element: element,
      separator: separator
    )
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    atLeast minimum: Int,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
    self.init(
      into: [],
      atLeast: minimum,
      atMost: .max,
      { $0.append($1) },
      element: element,
      separator: separator
    )
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    atMost maximum: Int,
    @ParserBuilder element: () -> Element,
    @ParserBuilder separator: () -> Separator
  ) {
    self.init(
      into: [],
      atLeast: 0,
      atMost: maximum,
      { $0.append($1) },
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

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
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

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @inlinable
  public init(
    minLength: Int,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.minimum = minLength
    self.maximum = nil
    self.predicate = predicate
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
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
  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @_disfavoredOverload
  @inlinable
  public init(
    minLength: Int,
    maxLength: Int?,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.init(minLength: minLength, maxLength: maxLength, while: predicate)
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @_disfavoredOverload
  @inlinable
  public init(
    minLength: Int,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.init(minLength: minLength, maxLength: nil, while: predicate)
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
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
  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @_disfavoredOverload
  @inlinable
  public init(
    minLength: Int,
    maxLength: Int?,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.init(minLength: minLength, maxLength: maxLength, while: predicate)
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
  @_disfavoredOverload
  @inlinable
  public init(
    minLength: Int,
    while predicate: @escaping (Input.Element) -> Bool
  ) {
    self.init(minLength: minLength, maxLength: nil, while: predicate)
  }

  @available(*, deprecated, message: "Use the initializer that takes a Length (Int or range expression), instead.")
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

@available(*, deprecated, renamed: "Parsers.Conditional")
public typealias Conditional = Parsers.Conditional
