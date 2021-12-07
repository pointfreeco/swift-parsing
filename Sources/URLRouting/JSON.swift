import Foundation

public struct JSON<Input, Value>: Parser
where
  Input: AppendableCollection,
  Input.Element == UTF8.CodeUnit,
  Value: Decodable
{
  @usableFromInline
  let decoder: JSONDecoder

  @usableFromInline
  let encoder: JSONEncoder

  @inlinable
  public init(
    _ type: Value.Type,
    from inputType: Input.Type = Input.self,
    decoder: JSONDecoder = .init(),
    encoder: JSONEncoder = .init()
  ) {
    self.decoder = decoder
    self.encoder = encoder
  }

  @inlinable
  public func parse(_ input: inout Input) -> Value? {
    guard
      let output = try? self.decoder.decode(Value.self, from: Data(input))
    else { return nil }
    input = Input()
    return output
  }
}

extension JSON where Input == ArraySlice<UTF8.CodeUnit> {
  @inlinable
  public init(
    _ type: Value.Type,
    decoder: JSONDecoder = .init(),
    encoder: JSONEncoder = .init()
  ) {
    self.init(type, decoder: decoder, encoder: encoder)
  }
}

extension JSON where Input == Substring.UTF8View {
  @inlinable
  public init(
    _ type: Value.Type,
    decoder: JSONDecoder = .init(),
    encoder: JSONEncoder = .init()
  ) {
    self.init(type, decoder: decoder, encoder: encoder)
  }
}

extension JSON: Printer where Value: Encodable {
  @inlinable
  public func print(_ output: Value) -> Input? {
    guard
      let input = try? self.encoder.encode(output)
    else { return nil }
    return .init(input)
  }
}
