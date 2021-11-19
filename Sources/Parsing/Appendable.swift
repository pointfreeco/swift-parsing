import Foundation

public protocol Appendable {
  init()
  mutating func append(contentsOf other: Self)
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

extension Substring.UTF8View: Appendable {
  @inlinable
  public init() {
    self = ""[...].utf8
  }

  @inlinable
  public mutating func append(contentsOf other: Substring.UTF8View) {
    var str = Substring(self)
    str.append(contentsOf: Substring(other))
    self = str.utf8
  }
}
