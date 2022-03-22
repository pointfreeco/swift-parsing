public struct Digits<Input: Collection, Bytes: Collection>: Parser
where
  Input.SubSequence == Input,
  Bytes.Element == UTF8.CodeUnit,
  Bytes.SubSequence == Bytes
{
  @usableFromInline
  let maximum: Int?

  @usableFromInline
  let minimum: Int

  @usableFromInline
  let toBytes: (Input) -> Bytes

  @usableFromInline
  let fromBytes: (Bytes) -> Input

  @usableFromInline
  init<L: Length>(
    length: L,
    toBytes: @escaping (Input) -> Bytes,
    fromBytes: @escaping (Bytes) -> Input
  ) {
    precondition(length.minimum >= 1, "Can't construct Digits with length < 1")
    self.minimum = length.minimum
    self.maximum = length.maximum
    self.toBytes = toBytes
    self.fromBytes = fromBytes
  }

  @inlinable
  public func parse(_ input: inout Input) throws -> Int {
    var bytes = self.toBytes(input)
    defer { input = self.fromBytes(bytes) }

    var prefix = self.maximum.map(bytes.prefix) ?? bytes
    prefix = prefix.prefix(while: (.init(ascii: "0") ... .init(ascii: "9")).contains)
    let count = prefix.count

    guard prefix.count >= self.minimum
    else {
      throw ParsingError.expectedInput(
        """
        \(self.minimum == self.maximum ? "" : "at least ")\(self.minimum) \
        digit\(self.minimum == 1 ? "" : "s")
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
  public init() {
    self.init(1...)
  }

  @_disfavoredOverload
  @inlinable
  public init<L: Length>(_ length: L) {
    self.init(
      length: length,
      toBytes: { $0.utf8 },
      fromBytes: Substring.init
    )
  }
}

extension Digits where Input == Substring.UTF8View, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init() {
    self.init(1...)
  }

  @_disfavoredOverload
  public init<L: Length>(_ length: L) {
    self.init(
      length: length,
      toBytes: { $0 },
      fromBytes: { $0 }
    )
  }
}
