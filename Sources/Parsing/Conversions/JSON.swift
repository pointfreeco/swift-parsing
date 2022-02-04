import Foundation

extension Conversion {
  @inlinable
  public static func json<Value>(
    _ type: Value.Type,
    decoder: JSONDecoder = .init(),
    encoder: JSONEncoder = .init()
  ) -> Self where Self == Conversions.JSON<Value> {
    .init(type, decoder: decoder, encoder: encoder)
  }

  @inlinable
  public func json<Value>(
    _ type: Value.Type,
    decoder: JSONDecoder = .init(),
    encoder: JSONEncoder = .init()
  ) -> Conversions.Map<Self, Conversions.JSON<Value>> {
    self.map(.json(type, decoder: decoder, encoder: encoder))
  }
}

extension Conversions {
  public struct JSON<Value>: Conversion  // FIXME: Should this be generic over `Input`?
  where
    Value: Codable  // FIXME: Can/should we support types that are simply `Decodable`?
  {
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
    public func apply(_ input: Data) throws -> Value {
      try self.decoder.decode(Value.self, from: input)
    }

    @inlinable
    public func unapply(_ output: Value) throws -> Data {
      try self.encoder.encode(output)
    }
  }
}
