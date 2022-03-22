public protocol Length {
  var minimum: Int { get }
  var maximum: Int? { get }
}

extension Int: Length {
  public var minimum: Int { self }
  public var maximum: Int? { self }
}

extension ClosedRange: Length where Bound == Int {
  public var minimum: Int { self.lowerBound }
  public var maximum: Int? { self.upperBound }
}

extension PartialRangeFrom: Length where Bound == Int {
  public var minimum: Int { self.lowerBound }
  public var maximum: Int? { nil }
}

extension PartialRangeThrough: Length where Bound == Int {
  public var minimum: Int { 0 }
  public var maximum: Int? { self.upperBound }
}
