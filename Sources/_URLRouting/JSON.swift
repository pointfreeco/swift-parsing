import Foundation

// FIXME: Should this be a `Conversion`?

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
  public func parse(_ input: inout Input) throws -> Value {
    let output = try self.decoder.decode(Value.self, from: Data(input))
    input = Input()
    return output
  }
}

extension JSON: Printer where Value: Encodable {
  @inlinable
  public func print(_ output: Value, to input: inout Input) throws {
    input.append(contentsOf: try self.encoder.encode(output))
  }
}

extension JSON where Input == ArraySlice<UTF8.CodeUnit> {
  @inlinable
  public init(
    _ type: Value.Type,
    decoder: JSONDecoder = .init(),
    encoder: JSONEncoder = .init()
  ) {
    self.decoder = decoder
    self.encoder = encoder
  }
}

extension JSON where Input == Substring.UTF8View {
  @inlinable
  public init(
    _ type: Value.Type,
    decoder: JSONDecoder = .init(),
    encoder: JSONEncoder = .init()
  ) {
    self.decoder = decoder
    self.encoder = encoder
  }
}
