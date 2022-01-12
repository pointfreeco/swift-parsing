extension Array: Parser where Element: Equatable {
  @inlinable
  public func parse(_ input: inout ArraySlice<Element>) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
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
  public func parse(_ input: inout Substring) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
  }

  @inlinable
  public func print(_ output: ()) -> Substring? {
    self[...]
  }
}

extension String.UnicodeScalarView: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring.UnicodeScalarView) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
  }

  @inlinable
  public func print(_ output: ()) -> Substring.UnicodeScalarView? {
    String(self)[...].unicodeScalars
  }
}

extension String.UTF8View: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring.UTF8View) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
  }

  @inlinable
  public func print(_ output: ()) -> Substring.UTF8View? {
    String(self)[...].utf8
  }
}
