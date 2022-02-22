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
  public func print(_ output: Void, to input: inout ArraySlice<Element>) {
    var newValue = self[...]
    newValue.append(contentsOf: self)
    input = newValue
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
  public func print(_ output: Void, to input: inout SubSequence) {
    var newInput = self[...]
    newInput.append(contentsOf: input)
    input = newInput
  }
}

extension String.UnicodeScalarView: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring.UnicodeScalarView) throws {
    guard input.starts(with: self) else {
      throw ParsingError.expectedInput(String(self).debugDescription, at: input)
    }
    input.removeFirst(self.count)
  }

  @inlinable
  public func print(_ output: Void, to input: inout SubSequence) {
    var newInput = SubSequence(self)
    newInput.append(contentsOf: input)
    input = newInput
  }
}

extension String.UTF8View: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring.UTF8View) throws {
    guard input.starts(with: self) else {
      throw ParsingError.expectedInput(String(self).debugDescription, at: input)
    }
    input.removeFirst(self.count)
  }

  @inlinable
  public func print(_ output: Void, to input: inout SubSequence) {
    input.prepend(contentsOf: self)
  }
}
