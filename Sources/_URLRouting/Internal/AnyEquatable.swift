@usableFromInline
func isEqual(_ lhs: Any, _ rhs: Any) -> Bool {
  func open<LHS>(_: LHS.Type) -> Bool? {
    (Box<LHS>.self as? AnyEquatable.Type)?.isEqual(lhs, rhs)
  }
  return _openExistential(type(of: lhs), do: open) ?? false
}

private enum Box<T> {}

private protocol AnyEquatable {
  static func isEqual(_ lhs: Any, _ rhs: Any) -> Bool
}

extension Box: AnyEquatable where T: Equatable {
  fileprivate static func isEqual(_ lhs: Any, _ rhs: Any) -> Bool {
    lhs as? T == rhs as? T
  }
}
