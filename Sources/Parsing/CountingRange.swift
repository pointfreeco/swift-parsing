public protocol CountingRange {
  var minimum: Int { get }
  var maximum: Int? { get }
}

extension Int: CountingRange {
  public var minimum: Int { self }
  public var maximum: Int? { self }
}

extension ClosedRange: CountingRange where Bound == Int {
  public var minimum: Int { self.lowerBound }
  public var maximum: Int? { self.upperBound }
}

extension PartialRangeFrom: CountingRange where Bound == Int {
  public var minimum: Int { self.lowerBound }
  public var maximum: Int? { nil }
}

extension PartialRangeThrough: CountingRange where Bound == Int {
  public var minimum: Int { 0 }
  public var maximum: Int? { self.upperBound }
}
