extension Conversion where Self == Conversions.SubstringToString {
  @inlinable
  public static var string: Self {
    .init()
  }
}

extension Conversion where Self == Conversions.BytesToString<Substring.UTF8View> {
  @inlinable
  public static var string: Self {
    .init()
  }
}

extension Conversions {
  public struct SubstringToString: Conversion {
    @inlinable
    public init() {}

    @inlinable
    public func apply(_ input: Substring) -> String {
      String(input)
    }

    @inlinable
    public func unapply(_ output: String) -> Substring {
      Substring(output)
    }
  }

  public struct BytesToString<Input>: Conversion
  where
    Input: AppendableCollection,
    Input.SubSequence == Input,
    Input.Element == UTF8.CodeUnit
  {
    @inlinable
    public init() {}

    @inlinable
    public func apply(_ input: Input) -> String {
      String(decoding: input, as: UTF8.self)
    }

    @inlinable
    public func unapply(_ output: String) -> Input {
      .init(output.utf8)
    }
  }
}
