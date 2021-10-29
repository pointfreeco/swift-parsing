public protocol Printer {
  associatedtype Input
  associatedtype Output

  func print(_ output: Output) -> Input?
}
