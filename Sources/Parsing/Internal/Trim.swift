@usableFromInline
@inline(__always)
func _trimSpacePrefix<Input>(_ input: inout Input) {
  if var stringInput = input as? Substring {
    stringInput.removeFirst(
      stringInput.prefix { $0 == " " }.count
    )
    input = unsafeBitCast(stringInput, to: Input.self)
  } else if var stringInput = input as? Substring.UnicodeScalarView {
    stringInput.removeFirst(
      stringInput.prefix { $0 == " " }.count
    )
    input = unsafeBitCast(stringInput, to: Input.self)
  } else if var stringInput = input as? Substring.UTF8View {
    stringInput.removeFirst(
      stringInput.prefix { $0 == .init(ascii: " ") }.count
    )
    input = unsafeBitCast(stringInput, to: Input.self)
  } else if var stringInput = input as? ArraySlice<UInt8> {
    stringInput.removeFirst(
      stringInput.prefix { $0 == .init(ascii: " ") }.count
    )
    input = unsafeBitCast(stringInput, to: Input.self)
  }
}
