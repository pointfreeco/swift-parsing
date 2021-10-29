extension Array: Parser, Printer where Element: Equatable {
  @inlinable
  public func parse(_ input: inout ArraySlice<Element>) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
  }

  @inlinable
  public func print(_ output: ()) -> ArraySlice<Element>? {
    self[...]
  }
}

extension String: Parser, Printer {
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

extension String.UnicodeScalarView: Parser, Printer {
  @inlinable
  public func parse(_ input: inout Substring.UnicodeScalarView) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
  }

  @inlinable
  public func print(_ output: ()) -> Substring.UnicodeScalarView? {
    String(self)[...].unicodeScalars // TODO: best way to do this?
  }
}

extension String.UTF8View: Parser, Printer {
  @inlinable
  public func parse(_ input: inout Substring.UTF8View) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
  }

  @inlinable
  public func print(_ output: ()) -> Substring.UTF8View? {
    String(self)[...].utf8 // TODO: best way to do this?
  }
}
