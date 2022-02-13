// BEGIN AUTO-GENERATED CONTENT

extension Parsers {
  public struct ZipOO<P0, P1>: Parser
  where
    P0: Parser,
    P1: Parser,
    P0.Input == P1.Input
  {
    public let p0: P0, p1: P1

    @inlinable public init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input)
      else {
        return nil
      }
      return (o0, o1)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> Parsers.ZipOO<P0, P1> {
    Parsers.ZipOO(p0, p1)
  }
}

extension Parsers {
  public struct ZipOV<P0, P1>: Parser
  where
    P0: Parser,
    P1: Parser,
    P0.Input == P1.Input,
    P1.Output == Void
  {
    public let p0: P0, p1: P1

    @inlinable public init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input)
      else {
        return nil
      }
      return (o0)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> Parsers.ZipOV<P0, P1> {
    Parsers.ZipOV(p0, p1)
  }
}

extension Parsers {
  public struct ZipVO<P0, P1>: Parser
  where
    P0: Parser,
    P1: Parser,
    P0.Input == P1.Input,
    P0.Output == Void
  {
    public let p0: P0, p1: P1

    @inlinable public init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input)
      else {
        return nil
      }
      return (o1)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> Parsers.ZipVO<P0, P1> {
    Parsers.ZipVO(p0, p1)
  }
}

extension Parsers {
  public struct ZipVV<P0, P1>: Parser
  where
    P0: Parser,
    P1: Parser,
    P0.Input == P1.Input,
    P0.Output == Void,
    P1.Output == Void
  {
    public let p0: P0, p1: P1

    @inlinable public init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (

    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input)
      else {
        return nil
      }
      return ()
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> Parsers.ZipVV<P0, P1> {
    Parsers.ZipVV(p0, p1)
  }
}

extension Parsers {
  public struct ZipOOO<P0, P1, P2>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Parsers.ZipOOO<P0, P1, P2> {
    Parsers.ZipOOO(p0, p1, p2)
  }
}

extension Parsers {
  public struct ZipOOV<P0, P1, P2>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input)
      else {
        return nil
      }
      return (o0, o1)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Parsers.ZipOOV<P0, P1, P2> {
    Parsers.ZipOOV(p0, p1, p2)
  }
}

extension Parsers {
  public struct ZipOVO<P0, P1, P2>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P1.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input)
      else {
        return nil
      }
      return (o0, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Parsers.ZipOVO<P0, P1, P2> {
    Parsers.ZipOVO(p0, p1, p2)
  }
}

extension Parsers {
  public struct ZipOVV<P0, P1, P2>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P1.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input)
      else {
        return nil
      }
      return (o0)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Parsers.ZipOVV<P0, P1, P2> {
    Parsers.ZipOVV(p0, p1, p2)
  }
}

extension Parsers {
  public struct ZipVOO<P0, P1, P2>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P0.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input)
      else {
        return nil
      }
      return (o1, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Parsers.ZipVOO<P0, P1, P2> {
    Parsers.ZipVOO(p0, p1, p2)
  }
}

extension Parsers {
  public struct ZipVOV<P0, P1, P2>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P0.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input)
      else {
        return nil
      }
      return (o1)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Parsers.ZipVOV<P0, P1, P2> {
    Parsers.ZipVOV(p0, p1, p2)
  }
}

extension Parsers {
  public struct ZipVVO<P0, P1, P2>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P0.Output == Void,
    P1.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input)
      else {
        return nil
      }
      return (o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Parsers.ZipVVO<P0, P1, P2> {
    Parsers.ZipVVO(p0, p1, p2)
  }
}

extension Parsers {
  public struct ZipVVV<P0, P1, P2>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (

    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input)
      else {
        return nil
      }
      return ()
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Parsers.ZipVVV<P0, P1, P2> {
    Parsers.ZipVVV(p0, p1, p2)
  }
}

extension Parsers {
  public struct ZipOOOO<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipOOOO<P0, P1, P2, P3> {
    Parsers.ZipOOOO(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipOOOV<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipOOOV<P0, P1, P2, P3> {
    Parsers.ZipOOOV(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipOOVO<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipOOVO<P0, P1, P2, P3> {
    Parsers.ZipOOVO(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipOOVV<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input)
      else {
        return nil
      }
      return (o0, o1)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipOOVV<P0, P1, P2, P3> {
    Parsers.ZipOOVV(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipOVOO<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P1.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input)
      else {
        return nil
      }
      return (o0, o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipOVOO<P0, P1, P2, P3> {
    Parsers.ZipOVOO(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipOVOV<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P1.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input)
      else {
        return nil
      }
      return (o0, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipOVOV<P0, P1, P2, P3> {
    Parsers.ZipOVOV(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipOVVO<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P1.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input)
      else {
        return nil
      }
      return (o0, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipOVVO<P0, P1, P2, P3> {
    Parsers.ZipOVVO(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipOVVV<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input)
      else {
        return nil
      }
      return (o0)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipOVVV<P0, P1, P2, P3> {
    Parsers.ZipOVVV(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipVOOO<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P0.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output,
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input)
      else {
        return nil
      }
      return (o1, o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipVOOO<P0, P1, P2, P3> {
    Parsers.ZipVOOO(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipVOOV<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P0.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input)
      else {
        return nil
      }
      return (o1, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipVOOV<P0, P1, P2, P3> {
    Parsers.ZipVOOV(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipVOVO<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P0.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input)
      else {
        return nil
      }
      return (o1, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipVOVO<P0, P1, P2, P3> {
    Parsers.ZipVOVO(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipVOVV<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input)
      else {
        return nil
      }
      return (o1)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipVOVV<P0, P1, P2, P3> {
    Parsers.ZipVOVV(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipVVOO<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P0.Output == Void,
    P1.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output,
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input)
      else {
        return nil
      }
      return (o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipVVOO<P0, P1, P2, P3> {
    Parsers.ZipVVOO(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipVVOV<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input)
      else {
        return nil
      }
      return (o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipVVOV<P0, P1, P2, P3> {
    Parsers.ZipVVOV(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipVVVO<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input)
      else {
        return nil
      }
      return (o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipVVVO<P0, P1, P2, P3> {
    Parsers.ZipVVVO(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipVVVV<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (

    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input)
      else {
        return nil
      }
      return ()
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.ZipVVVV<P0, P1, P2, P3> {
    Parsers.ZipVVVV(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct ZipOOOOO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOOOOO<P0, P1, P2, P3, P4> {
    Parsers.ZipOOOOO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOOOOV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOOOOV<P0, P1, P2, P3, P4> {
    Parsers.ZipOOOOV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOOOVO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOOOVO<P0, P1, P2, P3, P4> {
    Parsers.ZipOOOVO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOOOVV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOOOVV<P0, P1, P2, P3, P4> {
    Parsers.ZipOOOVV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOOVOO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOOVOO<P0, P1, P2, P3, P4> {
    Parsers.ZipOOVOO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOOVOV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P2.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOOVOV<P0, P1, P2, P3, P4> {
    Parsers.ZipOOVOV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOOVVO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOOVVO<P0, P1, P2, P3, P4> {
    Parsers.ZipOOVVO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOOVVV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o1)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOOVVV<P0, P1, P2, P3, P4> {
    Parsers.ZipOOVVV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOVOOO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P1.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o2, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOVOOO<P0, P1, P2, P3, P4> {
    Parsers.ZipOVOOO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOVOOV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P1.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOVOOV<P0, P1, P2, P3, P4> {
    Parsers.ZipOVOOV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOVOVO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P1.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o2, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOVOVO<P0, P1, P2, P3, P4> {
    Parsers.ZipOVOVO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOVOVV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOVOVV<P0, P1, P2, P3, P4> {
    Parsers.ZipOVOVV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOVVOO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P1.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOVVOO<P0, P1, P2, P3, P4> {
    Parsers.ZipOVVOO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOVVOV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOVVOV<P0, P1, P2, P3, P4> {
    Parsers.ZipOVVOV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOVVVO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o0, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOVVVO<P0, P1, P2, P3, P4> {
    Parsers.ZipOVVVO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOVVVV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o0)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipOVVVV<P0, P1, P2, P3, P4> {
    Parsers.ZipOVVVV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVOOOO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o1, o2, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVOOOO<P0, P1, P2, P3, P4> {
    Parsers.ZipVOOOO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVOOOV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output,
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o1, o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVOOOV<P0, P1, P2, P3, P4> {
    Parsers.ZipVOOOV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVOOVO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o1, o2, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVOOVO<P0, P1, P2, P3, P4> {
    Parsers.ZipVOOVO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVOOVV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o1, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVOOVV<P0, P1, P2, P3, P4> {
    Parsers.ZipVOOVV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVOVOO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o1, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVOVOO<P0, P1, P2, P3, P4> {
    Parsers.ZipVOVOO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVOVOV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o1, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVOVOV<P0, P1, P2, P3, P4> {
    Parsers.ZipVOVOV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVOVVO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o1, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVOVVO<P0, P1, P2, P3, P4> {
    Parsers.ZipVOVVO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVOVVV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o1)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVOVVV<P0, P1, P2, P3, P4> {
    Parsers.ZipVOVVV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVVOOO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P1.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o2, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVVOOO<P0, P1, P2, P3, P4> {
    Parsers.ZipVVOOO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVVOOV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output,
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVVOOV<P0, P1, P2, P3, P4> {
    Parsers.ZipVVOOV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVVOVO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o2, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVVOVO<P0, P1, P2, P3, P4> {
    Parsers.ZipVVOVO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVVOVV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVVOVV<P0, P1, P2, P3, P4> {
    Parsers.ZipVVOVV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVVVOO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P3.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVVVOO<P0, P1, P2, P3, P4> {
    Parsers.ZipVVVOO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVVVOV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return (o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVVVOV<P0, P1, P2, P3, P4> {
    Parsers.ZipVVVOV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVVVVO<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        return nil
      }
      return (o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVVVVO<P0, P1, P2, P3, P4> {
    Parsers.ZipVVVVO(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipVVVVV<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (

    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input)
      else {
        return nil
      }
      return ()
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.ZipVVVVV<P0, P1, P2, P3, P4> {
    Parsers.ZipVVVVV(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct ZipOOOOOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2, o3, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOOOOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOOOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOOOOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOOOOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOOOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOOOVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2, o3, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOOOVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOOOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOOOVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOOOVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOOOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOOVOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOOVOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOOVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOOVOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P3.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOOVOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOOVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOOVVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOOVVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOOVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOOVVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOOVVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOOVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOVOOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o3, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOVOOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOVOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOVOOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P2.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOVOOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOVOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOVOVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P2.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P3.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o3, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOVOVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOVOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOVOVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOVOVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOVOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOVVOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOVVOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOVVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOVVOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOVVOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOVVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOVVVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOVVVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOVVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOOVVVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o1)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOOVVVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOOVVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVOOOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o2, o3, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVOOOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVOOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVOOOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o2, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVOOOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVOOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVOOVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output,
      P3.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o2, o3, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVOOVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVOOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVOOVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVOOVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVOOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVOVOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o2, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVOVOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVOVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVOVOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o2, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVOVOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVOVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVOVVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o2, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVOVVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVOVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVOVVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P2.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVOVVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVOVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVVOOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o3, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVVOOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVVOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVVOOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVVOOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVVOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVVOVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P3.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o3, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVVOVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVVOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVVOVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P3.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVVOVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVVOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVVVOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVVVOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVVVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVVVOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P4.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVVVOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVVVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVVVVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P5.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o0, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVVVVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVVVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipOVVVVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output
    )? {
      guard
        let o0 = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o0)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipOVVVVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipOVVVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOOOOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o2, o3, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOOOOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOOOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOOOOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o2, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOOOOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOOOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOOOVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output,
      P3.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o2, o3, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOOOVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOOOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOOOVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output,
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOOOVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOOOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOOVOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o2, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOOVOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOOVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOOVOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o2, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOOVOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOOVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOOVVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o2, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOOVVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOOVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOOVVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P2.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOOVVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOOVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOVOOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o3, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOVOOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOVOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOVOOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOVOOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOVOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOVOVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P3.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o3, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOVOVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOVOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOVOVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOVOVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOVOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOVVOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOVVOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOVVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOVVOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOVVOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOVVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOVVVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o1, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOVVVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOVVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVOVVVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P1.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let o1 = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o1)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVOVVVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVOVVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVOOOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o2, o3, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVOOOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVOOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVOOOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output,
      P3.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o2, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVOOOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVOOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVOOVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output,
      P3.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o2, o3, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVOOVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVOOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVOOVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output,
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVOOVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVOOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVOVOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o2, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVOVOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVOVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVOVOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o2, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVOVOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVOVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVOVVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o2, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVOVVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVOVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVOVVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P2.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let o2 = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVOVVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVOVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVVOOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P3.Output,
      P4.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o3, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVVOOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVVOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVVOOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P3.Output,
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVVOOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVVOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVVOVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P3.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o3, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVVOVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVVOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVVOVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P3.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let o3 = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVVOVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVVOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVVVOO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P4.Output,
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVVVOO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVVVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVVVOV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P4.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let o4 = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return (o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVVVOV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVVVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVVVVO<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P5.Output
    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        return nil
      }
      return (o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVVVVO<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVVVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct ZipVVVVVV<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (

    )? {
      guard
        let _ = p0.parse(&input),
        let _ = p1.parse(&input),
        let _ = p2.parse(&input),
        let _ = p3.parse(&input),
        let _ = p4.parse(&input),
        let _ = p5.parse(&input)
      else {
        return nil
      }
      return ()
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.ZipVVVVVV<P0, P1, P2, P3, P4, P5> {
    Parsers.ZipVVVVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct OneOf2<P0, P1>: Parser
  where
    P0: Parser,
    P1: Parser,
    P0.Input == P1.Input,
    P0.Output == P1.Output
  {
    public let p0: P0, p1: P1

    @inlinable public init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
      var i0 = input
      if let output = self.p0.parse(&i0) {
        input = i0
        return output
      }
      var i1 = input
      if let output = self.p1.parse(&i1) {
        input = i1
        return output
      }
      return nil
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> Parsers.OneOf2<P0, P1> {
    Parsers.OneOf2(p0, p1)
  }
}

extension Parsers {
  public struct OneOf3<P0, P1, P2>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P0.Output == P1.Output,
    P1.Output == P2.Output
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
      var i0 = input
      if let output = self.p0.parse(&i0) {
        input = i0
        return output
      }
      var i1 = input
      if let output = self.p1.parse(&i1) {
        input = i1
        return output
      }
      var i2 = input
      if let output = self.p2.parse(&i2) {
        input = i2
        return output
      }
      return nil
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Parsers.OneOf3<P0, P1, P2> {
    Parsers.OneOf3(p0, p1, p2)
  }
}

extension Parsers {
  public struct OneOf4<P0, P1, P2, P3>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P0.Output == P1.Output,
    P1.Output == P2.Output,
    P2.Output == P3.Output
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
      var i0 = input
      if let output = self.p0.parse(&i0) {
        input = i0
        return output
      }
      var i1 = input
      if let output = self.p1.parse(&i1) {
        input = i1
        return output
      }
      var i2 = input
      if let output = self.p2.parse(&i2) {
        input = i2
        return output
      }
      var i3 = input
      if let output = self.p3.parse(&i3) {
        input = i3
        return output
      }
      return nil
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.OneOf4<P0, P1, P2, P3> {
    Parsers.OneOf4(p0, p1, p2, p3)
  }
}

extension Parsers {
  public struct OneOf5<P0, P1, P2, P3, P4>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P0.Output == P1.Output,
    P1.Output == P2.Output,
    P2.Output == P3.Output,
    P3.Output == P4.Output
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
      var i0 = input
      if let output = self.p0.parse(&i0) {
        input = i0
        return output
      }
      var i1 = input
      if let output = self.p1.parse(&i1) {
        input = i1
        return output
      }
      var i2 = input
      if let output = self.p2.parse(&i2) {
        input = i2
        return output
      }
      var i3 = input
      if let output = self.p3.parse(&i3) {
        input = i3
        return output
      }
      var i4 = input
      if let output = self.p4.parse(&i4) {
        input = i4
        return output
      }
      return nil
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.OneOf5<P0, P1, P2, P3, P4> {
    Parsers.OneOf5(p0, p1, p2, p3, p4)
  }
}

extension Parsers {
  public struct OneOf6<P0, P1, P2, P3, P4, P5>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P0.Output == P1.Output,
    P1.Output == P2.Output,
    P2.Output == P3.Output,
    P3.Output == P4.Output,
    P4.Output == P5.Output
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
    }

    @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
      var i0 = input
      if let output = self.p0.parse(&i0) {
        input = i0
        return output
      }
      var i1 = input
      if let output = self.p1.parse(&i1) {
        input = i1
        return output
      }
      var i2 = input
      if let output = self.p2.parse(&i2) {
        input = i2
        return output
      }
      var i3 = input
      if let output = self.p3.parse(&i3) {
        input = i3
        return output
      }
      var i4 = input
      if let output = self.p4.parse(&i4) {
        input = i4
        return output
      }
      var i5 = input
      if let output = self.p5.parse(&i5) {
        input = i5
        return output
      }
      return nil
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.OneOf6<P0, P1, P2, P3, P4, P5> {
    Parsers.OneOf6(p0, p1, p2, p3, p4, p5)
  }
}

extension Parsers {
  public struct OneOf7<P0, P1, P2, P3, P4, P5, P6>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P6: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P5.Input == P6.Input,
    P0.Output == P1.Output,
    P1.Output == P2.Output,
    P2.Output == P3.Output,
    P3.Output == P4.Output,
    P4.Output == P5.Output,
    P5.Output == P6.Output
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
      self.p6 = p6
    }

    @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
      var i0 = input
      if let output = self.p0.parse(&i0) {
        input = i0
        return output
      }
      var i1 = input
      if let output = self.p1.parse(&i1) {
        input = i1
        return output
      }
      var i2 = input
      if let output = self.p2.parse(&i2) {
        input = i2
        return output
      }
      var i3 = input
      if let output = self.p3.parse(&i3) {
        input = i3
        return output
      }
      var i4 = input
      if let output = self.p4.parse(&i4) {
        input = i4
        return output
      }
      var i5 = input
      if let output = self.p5.parse(&i5) {
        input = i5
        return output
      }
      var i6 = input
      if let output = self.p6.parse(&i6) {
        input = i6
        return output
      }
      return nil
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6
  ) -> Parsers.OneOf7<P0, P1, P2, P3, P4, P5, P6> {
    Parsers.OneOf7(p0, p1, p2, p3, p4, p5, p6)
  }
}

extension Parsers {
  public struct OneOf8<P0, P1, P2, P3, P4, P5, P6, P7>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P6: Parser,
    P7: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P5.Input == P6.Input,
    P6.Input == P7.Input,
    P0.Output == P1.Output,
    P1.Output == P2.Output,
    P2.Output == P3.Output,
    P3.Output == P4.Output,
    P4.Output == P5.Output,
    P5.Output == P6.Output,
    P6.Output == P7.Output
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7

    @inlinable public init(
      _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7
    ) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
      self.p6 = p6
      self.p7 = p7
    }

    @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
      var i0 = input
      if let output = self.p0.parse(&i0) {
        input = i0
        return output
      }
      var i1 = input
      if let output = self.p1.parse(&i1) {
        input = i1
        return output
      }
      var i2 = input
      if let output = self.p2.parse(&i2) {
        input = i2
        return output
      }
      var i3 = input
      if let output = self.p3.parse(&i3) {
        input = i3
        return output
      }
      var i4 = input
      if let output = self.p4.parse(&i4) {
        input = i4
        return output
      }
      var i5 = input
      if let output = self.p5.parse(&i5) {
        input = i5
        return output
      }
      var i6 = input
      if let output = self.p6.parse(&i6) {
        input = i6
        return output
      }
      var i7 = input
      if let output = self.p7.parse(&i7) {
        input = i7
        return output
      }
      return nil
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7
  ) -> Parsers.OneOf8<P0, P1, P2, P3, P4, P5, P6, P7> {
    Parsers.OneOf8(p0, p1, p2, p3, p4, p5, p6, p7)
  }
}

extension Parsers {
  public struct OneOf9<P0, P1, P2, P3, P4, P5, P6, P7, P8>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P6: Parser,
    P7: Parser,
    P8: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P5.Input == P6.Input,
    P6.Input == P7.Input,
    P7.Input == P8.Input,
    P0.Output == P1.Output,
    P1.Output == P2.Output,
    P2.Output == P3.Output,
    P3.Output == P4.Output,
    P4.Output == P5.Output,
    P5.Output == P6.Output,
    P6.Output == P7.Output,
    P7.Output == P8.Output
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8

    @inlinable public init(
      _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7, _ p8: P8
    ) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
      self.p6 = p6
      self.p7 = p7
      self.p8 = p8
    }

    @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
      var i0 = input
      if let output = self.p0.parse(&i0) {
        input = i0
        return output
      }
      var i1 = input
      if let output = self.p1.parse(&i1) {
        input = i1
        return output
      }
      var i2 = input
      if let output = self.p2.parse(&i2) {
        input = i2
        return output
      }
      var i3 = input
      if let output = self.p3.parse(&i3) {
        input = i3
        return output
      }
      var i4 = input
      if let output = self.p4.parse(&i4) {
        input = i4
        return output
      }
      var i5 = input
      if let output = self.p5.parse(&i5) {
        input = i5
        return output
      }
      var i6 = input
      if let output = self.p6.parse(&i6) {
        input = i6
        return output
      }
      var i7 = input
      if let output = self.p7.parse(&i7) {
        input = i7
        return output
      }
      var i8 = input
      if let output = self.p8.parse(&i8) {
        input = i8
        return output
      }
      return nil
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6, P7, P8>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7, _ p8: P8
  ) -> Parsers.OneOf9<P0, P1, P2, P3, P4, P5, P6, P7, P8> {
    Parsers.OneOf9(p0, p1, p2, p3, p4, p5, p6, p7, p8)
  }
}

extension Parsers {
  public struct OneOf10<P0, P1, P2, P3, P4, P5, P6, P7, P8, P9>: Parser
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P5: Parser,
    P6: Parser,
    P7: Parser,
    P8: Parser,
    P9: Parser,
    P0.Input == P1.Input,
    P1.Input == P2.Input,
    P2.Input == P3.Input,
    P3.Input == P4.Input,
    P4.Input == P5.Input,
    P5.Input == P6.Input,
    P6.Input == P7.Input,
    P7.Input == P8.Input,
    P8.Input == P9.Input,
    P0.Output == P1.Output,
    P1.Output == P2.Output,
    P2.Output == P3.Output,
    P3.Output == P4.Output,
    P4.Output == P5.Output,
    P5.Output == P6.Output,
    P6.Output == P7.Output,
    P7.Output == P8.Output,
    P8.Output == P9.Output
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8, p9: P9

    @inlinable public init(
      _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7, _ p8: P8,
      _ p9: P9
    ) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
      self.p6 = p6
      self.p7 = p7
      self.p8 = p8
      self.p9 = p9
    }

    @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
      var i0 = input
      if let output = self.p0.parse(&i0) {
        input = i0
        return output
      }
      var i1 = input
      if let output = self.p1.parse(&i1) {
        input = i1
        return output
      }
      var i2 = input
      if let output = self.p2.parse(&i2) {
        input = i2
        return output
      }
      var i3 = input
      if let output = self.p3.parse(&i3) {
        input = i3
        return output
      }
      var i4 = input
      if let output = self.p4.parse(&i4) {
        input = i4
        return output
      }
      var i5 = input
      if let output = self.p5.parse(&i5) {
        input = i5
        return output
      }
      var i6 = input
      if let output = self.p6.parse(&i6) {
        input = i6
        return output
      }
      var i7 = input
      if let output = self.p7.parse(&i7) {
        input = i7
        return output
      }
      var i8 = input
      if let output = self.p8.parse(&i8) {
        input = i8
        return output
      }
      var i9 = input
      if let output = self.p9.parse(&i9) {
        input = i9
        return output
      }
      return nil
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6, P7, P8, P9>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7, _ p8: P8,
    _ p9: P9
  ) -> Parsers.OneOf10<P0, P1, P2, P3, P4, P5, P6, P7, P8, P9> {
    Parsers.OneOf10(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1>(
    _ component: Parsers.ZipOO<P0, P1>
  )
    -> (Separator) -> Parsers.ZipOVO<
      P0, Skip<Separator>,
      P1
    >
  {
    {
      Parsers.ZipOVO(
        component.p0, Skip($0),
        component.p1
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1>(
    _ component: Parsers.ZipOV<P0, P1>
  )
    -> (Separator) -> Parsers.ZipOVV<
      P0, Skip<Separator>,
      P1
    >
  {
    {
      Parsers.ZipOVV(
        component.p0, Skip($0),
        component.p1
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1>(
    _ component: Parsers.ZipVO<P0, P1>
  )
    -> (Separator) -> Parsers.ZipVVO<
      P0, Skip<Separator>,
      P1
    >
  {
    {
      Parsers.ZipVVO(
        component.p0, Skip($0),
        component.p1
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1>(
    _ component: Parsers.ZipVV<P0, P1>
  )
    -> (Separator) -> Parsers.ZipVVV<
      P0, Skip<Separator>,
      P1
    >
  {
    {
      Parsers.ZipVVV(
        component.p0, Skip($0),
        component.p1
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ component: Parsers.ZipOOO<P0, P1, P2>
  )
    -> (Separator) -> Parsers.ZipOVOVO<
      P0, Skip<Separator>,
      P1, Skip<Separator>,
      P2
    >
  {
    {
      Parsers.ZipOVOVO(
        component.p0, Skip($0),
        component.p1, Skip($0),
        component.p2
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ component: Parsers.ZipOOV<P0, P1, P2>
  )
    -> (Separator) -> Parsers.ZipOVOVV<
      P0, Skip<Separator>,
      P1, Skip<Separator>,
      P2
    >
  {
    {
      Parsers.ZipOVOVV(
        component.p0, Skip($0),
        component.p1, Skip($0),
        component.p2
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ component: Parsers.ZipOVO<P0, P1, P2>
  )
    -> (Separator) -> Parsers.ZipOVVVO<
      P0, Skip<Separator>,
      P1, Skip<Separator>,
      P2
    >
  {
    {
      Parsers.ZipOVVVO(
        component.p0, Skip($0),
        component.p1, Skip($0),
        component.p2
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ component: Parsers.ZipOVV<P0, P1, P2>
  )
    -> (Separator) -> Parsers.ZipOVVVV<
      P0, Skip<Separator>,
      P1, Skip<Separator>,
      P2
    >
  {
    {
      Parsers.ZipOVVVV(
        component.p0, Skip($0),
        component.p1, Skip($0),
        component.p2
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ component: Parsers.ZipVOO<P0, P1, P2>
  )
    -> (Separator) -> Parsers.ZipVVOVO<
      P0, Skip<Separator>,
      P1, Skip<Separator>,
      P2
    >
  {
    {
      Parsers.ZipVVOVO(
        component.p0, Skip($0),
        component.p1, Skip($0),
        component.p2
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ component: Parsers.ZipVOV<P0, P1, P2>
  )
    -> (Separator) -> Parsers.ZipVVOVV<
      P0, Skip<Separator>,
      P1, Skip<Separator>,
      P2
    >
  {
    {
      Parsers.ZipVVOVV(
        component.p0, Skip($0),
        component.p1, Skip($0),
        component.p2
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ component: Parsers.ZipVVO<P0, P1, P2>
  )
    -> (Separator) -> Parsers.ZipVVVVO<
      P0, Skip<Separator>,
      P1, Skip<Separator>,
      P2
    >
  {
    {
      Parsers.ZipVVVVO(
        component.p0, Skip($0),
        component.p1, Skip($0),
        component.p2
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ component: Parsers.ZipVVV<P0, P1, P2>
  )
    -> (Separator) -> Parsers.ZipVVVVV<
      P0, Skip<Separator>,
      P1, Skip<Separator>,
      P2
    >
  {
    {
      Parsers.ZipVVVVV(
        component.p0, Skip($0),
        component.p1, Skip($0),
        component.p2
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipOOOO<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipOOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipOOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipOOOV<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipOOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipOOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipOOVO<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipOOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipOOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipOOVV<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipOOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipOOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipOVOO<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipOVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipOVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipOVOV<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipOVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipOVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipOVVO<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipOVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipOVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipOVVV<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipOVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipOVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipVOOO<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipVOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipVOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipVOOV<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipVOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipVOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipVOVO<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipVOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipVOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipVOVV<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipVOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipVOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipVVOO<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipVVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipVVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipVVOV<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipVVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipVVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipVVVO<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipVVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipVVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ component: Parsers.ZipVVVV<P0, P1, P2, P3>
  )
    -> (Separator) -> Parsers.ZipVVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      P3
    >
  {
    {
      Parsers.ZipVVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        component.p3
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOOOOO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOOOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOOOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOOOOV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOOOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOOOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOOOVO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOOOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOOOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOOOVV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOOOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOOOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOOVOO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOOVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOOVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOOVOV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOOVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOOVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOOVVO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOOVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOOVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOOVVV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOOVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOOVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOVOOO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOVOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOVOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOVOOV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOVOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOVOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOVOVO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOVOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOVOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOVOVV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOVOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOVOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOVVOO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOVVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOVVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOVVOV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOVVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOVVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOVVVO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOVVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOVVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipOVVVV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipOVVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipOVVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVOOOO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVOOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVOOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVOOOV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVOOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVOOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVOOVO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVOOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVOOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVOOVV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVOOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVOOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVOVOO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVOVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVOVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVOVOV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVOVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVOVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVOVVO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVOVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVOVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVOVVV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVOVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVOVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVVOOO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVVOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVVOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVVOOV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVVOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVVOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVVOVO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVVOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVVOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVVOVV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVVOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVVOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVVVOO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVVVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVVVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVVVOV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVVVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVVVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVVVVO<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVVVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVVVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ component: Parsers.ZipVVVVV<P0, P1, P2, P3, P4>
  )
    -> (Separator) -> Parsers.ZipVVVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      P4
    >
  {
    {
      Parsers.ZipVVVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        component.p4
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOOOOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOOOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOOOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOOOOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOOOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOOOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOOOVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOOOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOOOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOOOVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOOOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOOOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOOVOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOOVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOOVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOOVOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOOVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOOVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOOVVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOOVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOOVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOOVVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOOVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOOVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOVOOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOVOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOVOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOVOOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOVOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOVOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOVOVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOVOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOVOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOVOVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOVOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOVOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOVVOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOVVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOVVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOVVOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOVVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOVVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOVVVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOVVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOVVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOOVVVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOOVVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOOVVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVOOOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVOOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVOOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVOOOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVOOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVOOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVOOVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVOOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVOOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVOOVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVOOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVOOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVOVOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVOVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVOVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVOVOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVOVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVOVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVOVVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVOVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVOVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVOVVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVOVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVOVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVVOOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVVOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVVOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVVOOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVVOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVVOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVVOVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVVOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVVOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVVOVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVVOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVVOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVVVOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVVVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVVVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVVVOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVVVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVVVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVVVVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVVVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVVVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipOVVVVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipOVVVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipOVVVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOOOOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOOOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOOOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOOOOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOOOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOOOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOOOVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOOOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOOOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOOOVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOOOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOOOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOOVOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOOVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOOVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOOVOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOOVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOOVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOOVVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOOVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOOVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOOVVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOOVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOOVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOVOOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOVOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOVOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOVOOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOVOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOVOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOVOVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOVOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOVOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOVOVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOVOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOVOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOVVOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOVVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOVVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOVVOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOVVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOVVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOVVVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOVVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOVVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVOVVVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVOVVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVOVVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVOOOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVOOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVOOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVOOOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVOOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVOOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVOOVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVOOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVOOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVOOVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVOOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVOOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVOVOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVOVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVOVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVOVOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVOVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVOVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVOVVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVOVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVOVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVOVVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVOVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVOVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVVOOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVVOOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVVOOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVVOOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVVOOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVVOOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVVOVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVVOVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVVOVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVVOVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVVOVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVVOVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVVVOO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVVVOO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVVVOO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVVVOV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVVVOV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVVVOV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVVVVO<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVVVVO<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVVVVO(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

extension SeparatedParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ component: Parsers.ZipVVVVVV<P0, P1, P2, P3, P4, P5>
  )
    -> (Separator) -> Parsers.ZipVVVVVV<
      Parsers.ZipOV<P0, Skip<Separator>>,
      Parsers.ZipOV<P1, Skip<Separator>>,
      Parsers.ZipOV<P2, Skip<Separator>>,
      Parsers.ZipOV<P3, Skip<Separator>>,
      Parsers.ZipOV<P4, Skip<Separator>>,
      P5
    >
  {
    {
      Parsers.ZipVVVVVV(
        Parsers.ZipOV(component.p0, Skip($0)),
        Parsers.ZipOV(component.p1, Skip($0)),
        Parsers.ZipOV(component.p2, Skip($0)),
        Parsers.ZipOV(component.p3, Skip($0)),
        Parsers.ZipOV(component.p4, Skip($0)),
        component.p5
      )
    }
  }
}

// END AUTO-GENERATED CONTENT
