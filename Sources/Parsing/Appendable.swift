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
