import Foundation

public protocol AppendableCollection: Collection {
  init()
  mutating func append<S: Sequence>(contentsOf elements: S) where S.Element == Element
}

extension AppendableCollection {
  @inlinable
  public init<S: Sequence>(_ elements: S) where S.Element == Element {
    var collection = Self()
    collection.append(contentsOf: elements)
    self = collection
  }
}

extension Array: AppendableCollection {}
extension ArraySlice: AppendableCollection {}
extension ContiguousArray: AppendableCollection {}
extension Data: AppendableCollection {}
extension Slice: AppendableCollection where Base: RangeReplaceableCollection {}
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
  public mutating func append<S: Sequence>(contentsOf elements: S) where S.Element == Element {
    var str = Substring(self)
    defer { self = str.utf8 }

    switch elements {
    case let elements as Substring.UTF8View:
      str.append(contentsOf: Substring(elements))
    default:
      str.append(contentsOf: Substring(decoding: Array(elements), as: UTF8.self))
    }
  }
}
