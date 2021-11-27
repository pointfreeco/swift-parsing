import Foundation

public struct JSON<Value: Decodable>: Parser {
  @usableFromInline
  let decoder: JSONDecoder

  @usableFromInline
  let encoder: JSONEncoder

  @inlinable
  public init(
    _ type: Value.Type,
    decoder: JSONDecoder = .init(),
    encoder: JSONEncoder = .init()
  ) {
    self.decoder = decoder
    self.encoder = encoder
  }

  @inlinable
  public func parse(_ input: inout ArraySlice<UInt8>) -> Value? {
    guard
      let output = try? self.decoder.decode(Value.self, from: Data(input))
    else { return nil }
    input = []
    return output
  }
}

extension JSON: Printer where Value: Encodable {
  @inlinable
  public func print(_ output: Value) -> ArraySlice<UInt8>? {
    guard
      let input = try? self.encoder.encode(output)
    else { return nil }
    return .init(input)
  }
}
