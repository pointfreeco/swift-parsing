public struct Convert<Downstream>: Parser
where
  Downstream: Conversion,
  Downstream.Input: Collection,
  Downstream.Input.SubSequence == Downstream.Input
{
  public let conversion: Downstream

  @inlinable
  public init(_ conversion: Downstream) {
    self.conversion = conversion
  }

  @inlinable
  public func parse(_ input: inout Downstream.Input) rethrows -> Downstream.Output {
    let output = try self.conversion.apply(input)
    input = input[input.endIndex...]
    return output
  }
}

extension Convert: Printer where Downstream.Input: AppendableCollection {
  @inlinable
  public func print(_ output: Downstream.Output, to input: inout Downstream.Input) rethrows {
    input.append(contentsOf: try self.conversion.unapply(output))
  }
}
