public protocol Conversion {
  associatedtype Input
  associatedtype Output
  
  func apply(_ input: Input) -> Output?
  func unapply(_ output: Output) -> Input?
}
