//
//  Inverted.swift
//  swift-parsing
//
//  Created by Woodrow Melling on 10/28/24.
//

extension Conversions {
  public struct Inverted<C: Conversion>: Conversion {
    public var conversion: C

    @inlinable
    public init(_ conversion: C) {
      self.conversion = conversion
    }

    @inlinable
    @inline(__always)
    public func apply(_ input: C.Output) throws -> C.Input {
      try conversion.unapply(input)
    }

    @inlinable
    @inline(__always)
    public func unapply(_ output: C.Input) throws -> C.Output {
      try conversion.apply(output)
    }
  }
}

public extension Conversion {
  @inlinable
  @inline(__always)
  func inverted() -> Conversions.Inverted<Self> {
    Conversions.Inverted(self)
  }
}
