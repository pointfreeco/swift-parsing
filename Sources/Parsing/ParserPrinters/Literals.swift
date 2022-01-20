extension Array: Parser where Element: Equatable {
  @inlinable
  public func parse(_ input: inout ArraySlice<Element>) throws {
    guard input.starts(with: self) else { throw ParsingError() }
    input.removeFirst(self.count)
  }
}

extension Array: Printer {
  @inlinable
  public func print(_ output: Void) -> SubSequence? {
    self[...]
  }
}

extension String: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring) throws {
    guard input.starts(with: self) else { throw ParsingError() }
    input.removeFirst(self.count)
  }

  @inlinable
  public func print(_ output: ()) -> Substring? {
    self[...]
  }
}

extension String.UnicodeScalarView: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring.UnicodeScalarView) throws {
    guard input.starts(with: self) else { throw ParsingError() }
    input.removeFirst(self.count)
  }

  @inlinable
  public func print(_ output: ()) -> Substring.UnicodeScalarView? {
    String(self)[...].unicodeScalars
  }
}

extension String.UTF8View: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring.UTF8View) throws {
    guard input.starts(with: self) else { throw ParsingError() }
    input.removeFirst(self.count)
  }

  @inlinable
  public func print(_ output: ()) -> Substring.UTF8View? {
    String(self)[...].utf8
  }
}
