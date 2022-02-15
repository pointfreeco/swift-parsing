import Foundation

extension Conversion {
  /// A conversion from `Data` to the given codable type.
  ///
  /// See ``json(_:decoder:encoder:)-swift.method`` for a fluent version of this interface that
  /// transforms an existing conversion.
  ///
  /// - Parameters:
  ///   - type: A type that conforms to `Codable`.
  ///   - decoder: An optional JSON decoder.
  ///   - encoder: An optional JSON encoder.
  /// - Returns: A conversion from `Data` to the given codable type.
  @inlinable
  public static func json<Value>(
    _ type: Value.Type,
    decoder: JSONDecoder = .init(),
    encoder: JSONEncoder = .init()
  ) -> Self where Self == Conversions.JSON<Value> {
    .init(type, decoder: decoder, encoder: encoder)
  }

  /// Transforms this conversion to `Data` into a conversion to the given codable type.
  ///
  /// A fluent version of ``json(_:decoder:encoder:)-swift.type.method``. Equivalent to calling
  /// `Conversion.map(.json(Value.self)).
  ///
  /// - Parameters:
  ///   - type: A type that conforms to `Codable`.
  ///   - decoder: An optional JSON decoder.
  ///   - encoder: An optional JSON encoder.
  /// - Returns: A conversion from this conversion's input to the given codable type.
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
  /// A conversion from `Data` to some codable type.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/json(_:decoder:encoder:)-swift.type.method`` and ``Conversion/json(_:decoder:encoder:)-swift.method`` operations, which construct this type
  /// under the hood.
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
