extension Array: Parser where Element: Equatable {
  @inlinable
  public func parse(_ input: inout ArraySlice<Element>) throws {
    guard input.starts(with: self) else {
      throw ParsingError.expectedInput(self.debugDescription, at: input)
    }
    input.removeFirst(self.count)
  }
}

extension Array: Printer {
  @inlinable
  public func print(_ output: (), into input: inout SubSequence) {
    input.prepend(contentsOf: self)
  }
}

extension String: ParserPrinter {
  public typealias Input = SubSequence
  public typealias Output = Void

  @inlinable
  public func parse(_ input: inout SubSequence) throws {
    guard input.starts(with: self) else {
      throw ParsingError.expectedInput(self.debugDescription, at: input)
    }
    input.removeFirst(self.count)
  }

  @inlinable
  public func print(_ output: (), into input: inout SubSequence) {
    input.prepend(contentsOf: self)
  }
}

extension String.UnicodeScalarView: ParserPrinter {
  public typealias Input = SubSequence
  public typealias Output = Void

  @inlinable
  public func parse(_ input: inout SubSequence) throws {
    guard input.starts(with: self) else {
      throw ParsingError.expectedInput(String(self).debugDescription, at: input)
    }
    input.removeFirst(self.count)
  }

  @inlinable
  public func print(_ output: (), into input: inout SubSequence) {
    input.prepend(contentsOf: self)
  }
}

extension String.UTF8View: ParserPrinter {
  public typealias Input = SubSequence
  public typealias Output = Void
  
  @inlinable
  public func parse(_ input: inout SubSequence) throws {
    guard input.starts(with: self) else {
      throw ParsingError.expectedInput(String(self).debugDescription, at: input)
    }
    input.removeFirst(self.count)
  }

  @inlinable
  public func print(_ output: (), into input: inout SubSequence) {
    input.prepend(contentsOf: self)
  }
}
