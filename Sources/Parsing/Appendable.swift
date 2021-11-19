import Foundation

public protocol Appendable {
  init()
  mutating func append(contentsOf other: Self)
}

public protocol AppendableCollection: Appendable {
  associatedtype Element
  mutating func append<S: Sequence>(contentsOf elements: S) where S.Element == Element
}

extension Array: AppendableCollection {}
extension ArraySlice: AppendableCollection {}
extension ContiguousArray: AppendableCollection {}
extension Data: AppendableCollection {}
extension Slice: Appendable, AppendableCollection where Base: RangeReplaceableCollection {}
extension String: AppendableCollection {}
extension String.UnicodeScalarView: AppendableCollection {}
extension Substring: AppendableCollection {}
extension Substring.UnicodeScalarView: AppendableCollection {}

extension Substring.UTF8View: AppendableCollection {
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

  @inlinable
  public mutating func append<S: Sequence>(contentsOf elements: S) where S.Element == Element {
    var str = Substring(self)
    str.append(contentsOf: Substring(decoding: Array(elements), as: UTF8.self))
    self = str.utf8
  }
}
