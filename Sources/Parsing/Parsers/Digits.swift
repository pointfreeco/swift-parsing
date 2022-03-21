public struct Digits<Input: Collection, Bytes: Collection>: Parser
where
  Input.SubSequence == Input,
  Bytes.Element == UTF8.CodeUnit,
  Bytes.SubSequence == Bytes
{
  @usableFromInline
  let maxLength: Int?

  @usableFromInline
  let minLength: Int

  @usableFromInline
  let toBytes: (Input) -> Bytes

  @usableFromInline
  let fromBytes: (Bytes) -> Input

  @usableFromInline
  init(
    minLength: Int,
    maxLength: Int?,
    toBytes: @escaping (Input) -> Bytes,
    fromBytes: @escaping (Bytes) -> Input
  ) {
    precondition(minLength >= 1, "Can't construct Digits with length < 1")
    self.minLength = minLength
    self.maxLength = maxLength
    self.toBytes = toBytes
    self.fromBytes = fromBytes
  }

  @inlinable
  public func parse(_ input: inout Input) throws -> Int {
    var bytes = self.toBytes(input)
    defer { input = self.fromBytes(bytes) }

    var prefix = self.maxLength.map(bytes.prefix) ?? bytes
    prefix = prefix.prefix(while: (.init(ascii: "0") ... .init(ascii: "9")).contains)
    let count = prefix.count

    guard prefix.count >= self.minLength
    else {
      throw ParsingError.expectedInput(
        """
        \(self.minLength == self.maxLength ? "" : "at least ")\(self.minLength) \
        digit\(self.minLength == 1 ? "" : "s")
        """,
        at: input
      )
    }

    guard let digits = Int(String(decoding: prefix, as: UTF8.self))
    else { throw ParsingError.expectedInput("digits", at: input) }

    bytes.removeFirst(count)
    return digits
  }
}

extension Digits where Input == Substring, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init(_ length: PartialRangeFrom<Int> = 1...) {
    self.init(
      minLength: length.lowerBound,
      maxLength: nil,
      toBytes: { $0.utf8 },
      fromBytes: Substring.init
    )
  }

  @_disfavoredOverload
  @inlinable
  public init(_ length: Int) {
    self.init(
      minLength: length,
      maxLength: length,
      toBytes: { $0.utf8 },
      fromBytes: Substring.init
    )
  }
}

extension Digits where Input == Substring.UTF8View, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init(_ length: PartialRangeFrom<Int> = 1...) {
    self.init(
      minLength: length.lowerBound,
      maxLength: nil,
      toBytes: { $0 },
      fromBytes: { $0 }
    )
  }

  @_disfavoredOverload
  @inlinable
  public init(_ length: Int) {
    self.init(
      minLength: length,
      maxLength: length,
      toBytes: { $0 },
      fromBytes: { $0 }
    )
  }
}
