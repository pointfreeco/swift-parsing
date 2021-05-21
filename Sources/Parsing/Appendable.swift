import Foundation

public protocol Appendable {
  init()
  mutating func append(contentsOf other: Self)
}

extension Appendable {
  public static func + (lhs: Self, rhs: Self) -> Self {
    var lhs = lhs
    lhs.append(contentsOf: rhs)
    return lhs
  }
}

extension Array: Appendable {}
extension ArraySlice: Appendable {}
extension ContiguousArray: Appendable {}
extension Data: Appendable {}
extension Slice: Appendable where Base: RangeReplaceableCollection {}
extension String: Appendable {}
extension String.UnicodeScalarView: Appendable {}
extension Substring: Appendable {}
extension Substring.UnicodeScalarView: Appendable {}

extension Dictionary: Appendable where Value: Appendable {
  public mutating func append(contentsOf other: Self) {
    self.merge(other, uniquingKeysWith: +)
  }
}
