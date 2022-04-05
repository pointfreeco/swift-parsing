extension Array: Parser, ParserPrinter where Element: Equatable {
  @inlinable
  public func parse(_ input: inout ArraySlice<Element>) throws {
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

extension String: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring) throws {
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
  @inlinable
  public func parse(_ input: inout Substring) throws {
    guard input.unicodeScalars.starts(with: self) else {
      throw ParsingError.expectedInput(String(self).debugDescription, at: input)
    }
    input.unicodeScalars.removeFirst(self.count)
  }

  @inlinable
  public func print(_ output: (), into input: inout Substring) {
    input.prepend(contentsOf: String(self))
  }
}

extension String.UTF8View: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring) throws {
    guard input.utf8.starts(with: self) else {
      throw ParsingError.expectedInput(String(self).debugDescription, at: input)
    }
    input.utf8.removeFirst(self.count)
  }

  @inlinable
  public func print(_ output: (), into input: inout Substring) {
    input.prepend(contentsOf: String(self))
  }
}
