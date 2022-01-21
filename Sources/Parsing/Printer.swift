@rethrows public protocol Printer {
  associatedtype Input
  associatedtype Output
  func print(_ output: Output, to input: inout Input) throws
}

extension Printer where Input: AppendableCollection {
  @inlinable
  public func print(_ output: Output) rethrows -> Input {
    var input = Input()
    try self.print(output, to: &input)
    return input
  }
}

extension Printer where Output == Void {
  @inlinable
  public func print(to input: inout Input) rethrows {
    try self.print((), to: &input)
  }
}

extension Printer where Input: AppendableCollection, Output == Void {
  @inlinable
  public func print() rethrows -> Input {
    try self.print(())
  }
}
