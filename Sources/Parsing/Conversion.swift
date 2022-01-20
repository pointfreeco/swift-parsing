@rethrows public protocol Conversion {
  associatedtype Input
  associatedtype Output
  
  func apply(_ input: Input) throws -> Output
  func unapply(_ output: Output) throws -> Input
}
