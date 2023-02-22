import Foundation

extension Conversions {
  public struct Identity<Value>: Conversion {
    @inlinable
    public init() {
      self.init(internal: ())
    }
    
    @usableFromInline
    init(internal: Void) {}

    @inlinable
    @inline(__always)
    public func apply(_ input: Value) -> Value {
      input
    }

    @inlinable
    @inline(__always)
    public func unapply(_ output: Value) -> Value {
      output
    }
  }
}
