// BEGIN AUTO-GENERATED CONTENT

extension ParserBuilder {
  public struct ZipOO<P0: Parser, P1: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input
  {
    public let p0: P0, p1: P1

    @inlinable public init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        return (o0, o1)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> ZipOO<P0, P1> {
    ZipOO(p0, p1)
  }
}

extension ParserBuilder {
  public struct ZipOV<P0: Parser, P1: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P1.Output == Void
  {
    public let p0: P0, p1: P1

    @inlinable public init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        return o0
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> ZipOV<P0, P1> {
    ZipOV(p0, p1)
  }
}

extension ParserBuilder {
  public struct ZipVO<P0: Parser, P1: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P0.Output == Void
  {
    public let p0: P0, p1: P1

    @inlinable public init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P1.Output {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        return o1
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> ZipVO<P0, P1> {
    ZipVO(p0, p1)
  }
}

extension ParserBuilder {
  public struct ZipVV<P0: Parser, P1: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P0.Output == Void,
    P1.Output == Void
  {
    public let p0: P0, p1: P1

    @inlinable public init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> ZipVV<P0, P1> {
    ZipVV(p0, p1)
  }
}

extension ParserBuilder {
  public struct ZipOOO<P0: Parser, P1: Parser, P2: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        return (o0, o1, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> ZipOOO<P0, P1, P2> {
    ZipOOO(p0, p1, p2)
  }
}

extension ParserBuilder {
  public struct ZipOOV<P0: Parser, P1: Parser, P2: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        return (o0, o1)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> ZipOOV<P0, P1, P2> {
    ZipOOV(p0, p1, p2)
  }
}

extension ParserBuilder {
  public struct ZipOVO<P0: Parser, P1: Parser, P2: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P1.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        return (o0, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> ZipOVO<P0, P1, P2> {
    ZipOVO(p0, p1, p2)
  }
}

extension ParserBuilder {
  public struct ZipOVV<P0: Parser, P1: Parser, P2: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P1.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        return o0
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> ZipOVV<P0, P1, P2> {
    ZipOVV(p0, p1, p2)
  }
}

extension ParserBuilder {
  public struct ZipVOO<P0: Parser, P1: Parser, P2: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P0.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        return (o1, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> ZipVOO<P0, P1, P2> {
    ZipVOO(p0, p1, p2)
  }
}

extension ParserBuilder {
  public struct ZipVOV<P0: Parser, P1: Parser, P2: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P0.Output == Void,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P1.Output {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        return o1
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> ZipVOV<P0, P1, P2> {
    ZipVOV(p0, p1, p2)
  }
}

extension ParserBuilder {
  public struct ZipVVO<P0: Parser, P1: Parser, P2: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P0.Output == Void,
    P1.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P2.Output {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        return o2
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> ZipVVO<P0, P1, P2> {
    ZipVVO(p0, p1, p2)
  }
}

extension ParserBuilder {
  public struct ZipVVV<P0: Parser, P1: Parser, P2: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> ZipVVV<P0, P1, P2> {
    ZipVVV(p0, p1, p2)
  }
}

extension ParserBuilder {
  public struct ZipOOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        return (o0, o1, o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipOOOO<P0, P1, P2, P3> {
    ZipOOOO(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipOOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P3.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        return (o0, o1, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipOOOV<P0, P1, P2, P3> {
    ZipOOOV(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipOOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P2.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        return (o0, o1, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipOOVO<P0, P1, P2, P3> {
    ZipOOVO(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipOOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        return (o0, o1)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipOOVV<P0, P1, P2, P3> {
    ZipOOVV(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipOVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P1.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        return (o0, o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipOVOO<P0, P1, P2, P3> {
    ZipOVOO(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipOVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        return (o0, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipOVOV<P0, P1, P2, P3> {
    ZipOVOV(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipOVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        return (o0, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipOVVO<P0, P1, P2, P3> {
    ZipOVVO(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipOVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        return o0
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipOVVV<P0, P1, P2, P3> {
    ZipOVVV(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipVOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P0.Output == Void
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output,
      P3.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        return (o1, o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipVOOO<P0, P1, P2, P3> {
    ZipVOOO(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipVOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        return (o1, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipVOOV<P0, P1, P2, P3> {
    ZipVOOV(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipVOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P3.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        return (o1, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipVOVO<P0, P1, P2, P3> {
    ZipVOVO(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipVOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P1.Output {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        return o1
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipVOVV<P0, P1, P2, P3> {
    ZipVOVV(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipVVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P2.Output,
      P3.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        return (o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipVVOO<P0, P1, P2, P3> {
    ZipVVOO(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipVVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P2.Output {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        return o2
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipVVOV<P0, P1, P2, P3> {
    ZipVVOV(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipVVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P3.Output {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        return o3
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipVVVO<P0, P1, P2, P3> {
    ZipVVVO(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipVVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> ZipVVVV<P0, P1, P2, P3> {
    ZipVVVV(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  public struct ZipOOOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o0, o1, o2, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOOOOO<P0, P1, P2, P3, P4> {
    ZipOOOOO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOOOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        return (o0, o1, o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOOOOV<P0, P1, P2, P3, P4> {
    ZipOOOOV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOOOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o0, o1, o2, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOOOVO<P0, P1, P2, P3, P4> {
    ZipOOOVO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOOOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        return (o0, o1, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOOOVV<P0, P1, P2, P3, P4> {
    ZipOOOVV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOOVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o0, o1, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOOVOO<P0, P1, P2, P3, P4> {
    ZipOOVOO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOOVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        return (o0, o1, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOOVOV<P0, P1, P2, P3, P4> {
    ZipOOVOV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOOVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o0, o1, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOOVVO<P0, P1, P2, P3, P4> {
    ZipOOVVO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOOVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        return (o0, o1)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOOVVV<P0, P1, P2, P3, P4> {
    ZipOOVVV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOVOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o0, o2, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOVOOO<P0, P1, P2, P3, P4> {
    ZipOVOOO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOVOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        return (o0, o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOVOOV<P0, P1, P2, P3, P4> {
    ZipOVOOV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOVOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o0, o2, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOVOVO<P0, P1, P2, P3, P4> {
    ZipOVOVO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOVOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        return (o0, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOVOVV<P0, P1, P2, P3, P4> {
    ZipOVOVV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOVVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o0, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOVVOO<P0, P1, P2, P3, P4> {
    ZipOVVOO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOVVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        return (o0, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOVVOV<P0, P1, P2, P3, P4> {
    ZipOVVOV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOVVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o0, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOVVVO<P0, P1, P2, P3, P4> {
    ZipOVVVO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOVVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        return o0
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipOVVVV<P0, P1, P2, P3, P4> {
    ZipOVVVV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVOOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o1, o2, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVOOOO<P0, P1, P2, P3, P4> {
    ZipVOOOO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVOOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output,
      P3.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        return (o1, o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVOOOV<P0, P1, P2, P3, P4> {
    ZipVOOOV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVOOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o1, o2, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVOOVO<P0, P1, P2, P3, P4> {
    ZipVOOVO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVOOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        return (o1, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVOOVV<P0, P1, P2, P3, P4> {
    ZipVOOVV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVOVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o1, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVOVOO<P0, P1, P2, P3, P4> {
    ZipVOVOO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVOVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P3.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        return (o1, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVOVOV<P0, P1, P2, P3, P4> {
    ZipVOVOV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVOVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o1, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVOVVO<P0, P1, P2, P3, P4> {
    ZipVOVVO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVOVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P1.Output {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        return o1
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVOVVV<P0, P1, P2, P3, P4> {
    ZipVOVVV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVVOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P2.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o2, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVVOOO<P0, P1, P2, P3, P4> {
    ZipVVOOO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVVOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P2.Output,
      P3.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        return (o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVVOOV<P0, P1, P2, P3, P4> {
    ZipVVOOV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVVOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P2.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o2, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVVOVO<P0, P1, P2, P3, P4> {
    ZipVVOVO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVVOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P2.Output {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        return o2
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVVOVV<P0, P1, P2, P3, P4> {
    ZipVVOVV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVVVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P3.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return (o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVVVOO<P0, P1, P2, P3, P4> {
    ZipVVVOO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVVVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P3.Output {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        return o3
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVVVOV<P0, P1, P2, P3, P4> {
    ZipVVVOV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVVVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P4.Output {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        return o4
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVVVVO<P0, P1, P2, P3, P4> {
    ZipVVVVO(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipVVVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> ZipVVVVV<P0, P1, P2, P3, P4> {
    ZipVVVVV(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  public struct ZipOOOOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o1, o2, o3, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOOOOO<P0, P1, P2, P3, P4, P5> {
    ZipOOOOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOOOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o1, o2, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOOOOV<P0, P1, P2, P3, P4, P5> {
    ZipOOOOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOOOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o1, o2, o3, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOOOVO<P0, P1, P2, P3, P4, P5> {
    ZipOOOOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOOOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o1, o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOOOVV<P0, P1, P2, P3, P4, P5> {
    ZipOOOOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOOVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o1, o2, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOOVOO<P0, P1, P2, P3, P4, P5> {
    ZipOOOVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOOVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o1, o2, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOOVOV<P0, P1, P2, P3, P4, P5> {
    ZipOOOVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOOVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o1, o2, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOOVVO<P0, P1, P2, P3, P4, P5> {
    ZipOOOVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOOVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P2.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o1, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOOVVV<P0, P1, P2, P3, P4, P5> {
    ZipOOOVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOVOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P3.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o1, o3, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOVOOO<P0, P1, P2, P3, P4, P5> {
    ZipOOVOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOVOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o1, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOVOOV<P0, P1, P2, P3, P4, P5> {
    ZipOOVOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOVOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P3.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o1, o3, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOVOVO<P0, P1, P2, P3, P4, P5> {
    ZipOOVOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOVOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o1, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOVOVV<P0, P1, P2, P3, P4, P5> {
    ZipOOVOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOVVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o1, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOVVOO<P0, P1, P2, P3, P4, P5> {
    ZipOOVVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOVVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o1, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOVVOV<P0, P1, P2, P3, P4, P5> {
    ZipOOVVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOVVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o1, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOVVVO<P0, P1, P2, P3, P4, P5> {
    ZipOOVVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOOVVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P1.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o1)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOOVVVV<P0, P1, P2, P3, P4, P5> {
    ZipOOVVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVOOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o2, o3, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVOOOO<P0, P1, P2, P3, P4, P5> {
    ZipOVOOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVOOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o2, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVOOOV<P0, P1, P2, P3, P4, P5> {
    ZipOVOOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVOOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output,
      P3.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o2, o3, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVOOVO<P0, P1, P2, P3, P4, P5> {
    ZipOVOOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVOOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVOOVV<P0, P1, P2, P3, P4, P5> {
    ZipOVOOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVOVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o2, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVOVOO<P0, P1, P2, P3, P4, P5> {
    ZipOVOVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVOVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o2, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVOVOV<P0, P1, P2, P3, P4, P5> {
    ZipOVOVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVOVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o2, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVOVVO<P0, P1, P2, P3, P4, P5> {
    ZipOVOVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVOVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P2.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVOVVV<P0, P1, P2, P3, P4, P5> {
    ZipOVOVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVVOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P3.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o3, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVVOOO<P0, P1, P2, P3, P4, P5> {
    ZipOVVOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVVOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVVOOV<P0, P1, P2, P3, P4, P5> {
    ZipOVVOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVVOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P3.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o3, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVVOVO<P0, P1, P2, P3, P4, P5> {
    ZipOVVOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVVOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P3.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVVOVV<P0, P1, P2, P3, P4, P5> {
    ZipOVVOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVVVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVVVOO<P0, P1, P2, P3, P4, P5> {
    ZipOVVVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVVVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P4.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o0, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVVVOV<P0, P1, P2, P3, P4, P5> {
    ZipOVVVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVVVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P0.Output,
      P5.Output
    ) {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o0, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVVVVO<P0, P1, P2, P3, P4, P5> {
    ZipOVVVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipOVVVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      do {
        let o0 = try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return o0
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipOVVVVV<P0, P1, P2, P3, P4, P5> {
    ZipOVVVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOOOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o1, o2, o3, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOOOOO<P0, P1, P2, P3, P4, P5> {
    ZipVOOOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOOOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o1, o2, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOOOOV<P0, P1, P2, P3, P4, P5> {
    ZipVOOOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOOOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output,
      P3.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o1, o2, o3, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOOOVO<P0, P1, P2, P3, P4, P5> {
    ZipVOOOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOOOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output,
      P3.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return (o1, o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOOOVV<P0, P1, P2, P3, P4, P5> {
    ZipVOOOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOOVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o1, o2, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOOVOO<P0, P1, P2, P3, P4, P5> {
    ZipVOOVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOOVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o1, o2, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOOVOV<P0, P1, P2, P3, P4, P5> {
    ZipVOOVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOOVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o1, o2, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOOVVO<P0, P1, P2, P3, P4, P5> {
    ZipVOOVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOOVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P2.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return (o1, o2)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOOVVV<P0, P1, P2, P3, P4, P5> {
    ZipVOOVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOVOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P3.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o1, o3, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOVOOO<P0, P1, P2, P3, P4, P5> {
    ZipVOVOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOVOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o1, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOVOOV<P0, P1, P2, P3, P4, P5> {
    ZipVOVOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOVOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P3.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o1, o3, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOVOVO<P0, P1, P2, P3, P4, P5> {
    ZipVOVOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOVOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P3.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return (o1, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOVOVV<P0, P1, P2, P3, P4, P5> {
    ZipVOVOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOVVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o1, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOVVOO<P0, P1, P2, P3, P4, P5> {
    ZipVOVVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOVVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o1, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOVVOV<P0, P1, P2, P3, P4, P5> {
    ZipVOVVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOVVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P1.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o1, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOVVVO<P0, P1, P2, P3, P4, P5> {
    ZipVOVVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVOVVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P1.Output {
      do {
        try p0.parse(&input)
        let o1 = try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return o1
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVOVVVV<P0, P1, P2, P3, P4, P5> {
    ZipVOVVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVOOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o2, o3, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVOOOO<P0, P1, P2, P3, P4, P5> {
    ZipVVOOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVOOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P2.Output,
      P3.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o2, o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVOOOV<P0, P1, P2, P3, P4, P5> {
    ZipVVOOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVOOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P2.Output,
      P3.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o2, o3, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVOOVO<P0, P1, P2, P3, P4, P5> {
    ZipVVOOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVOOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P2.Output,
      P3.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return (o2, o3)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVOOVV<P0, P1, P2, P3, P4, P5> {
    ZipVVOOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVOVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P2.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o2, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVOVOO<P0, P1, P2, P3, P4, P5> {
    ZipVVOVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVOVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P2.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o2, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVOVOV<P0, P1, P2, P3, P4, P5> {
    ZipVVOVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVOVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P2.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o2, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVOVVO<P0, P1, P2, P3, P4, P5> {
    ZipVVOVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVOVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P2.Output {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        let o2 = try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return o2
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVOVVV<P0, P1, P2, P3, P4, P5> {
    ZipVVOVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVVOOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P3.Output,
      P4.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o3, o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVVOOO<P0, P1, P2, P3, P4, P5> {
    ZipVVVOOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVVOOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P3.Output,
      P4.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return (o3, o4)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVVOOV<P0, P1, P2, P3, P4, P5> {
    ZipVVVOOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVVOVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P3.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o3, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVVOVO<P0, P1, P2, P3, P4, P5> {
    ZipVVVOVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVVOVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P3.Output {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        let o3 = try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
        return o3
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVVOVV<P0, P1, P2, P3, P4, P5> {
    ZipVVVOVV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVVVOO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> (
      P4.Output,
      P5.Output
    ) {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return (o4, o5)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVVVOO<P0, P1, P2, P3, P4, P5> {
    ZipVVVVOO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVVVOV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P4.Output {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        let o4 = try p4.parse(&input)
        try p5.parse(&input)
        return o4
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVVVOV<P0, P1, P2, P3, P4, P5> {
    ZipVVVVOV(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVVVVO<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P5.Output {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        let o5 = try p5.parse(&input)
        return o5
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVVVVO<P0, P1, P2, P3, P4, P5> {
    ZipVVVVVO(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  public struct ZipVVVVVV<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows {
      do {
        try p0.parse(&input)
        try p1.parse(&input)
        try p2.parse(&input)
        try p3.parse(&input)
        try p4.parse(&input)
        try p5.parse(&input)
      } catch { throw ParsingError.wrap(error, at: input) }
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> ZipVVVVVV<P0, P1, P2, P3, P4, P5> {
    ZipVVVVVV(p0, p1, p2, p3, p4, p5)
  }
}

extension OneOfBuilder {
  public struct OneOf2<P0: Parser, P1: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P0.Output == P1.Output
  {
    public let p0: P0, p1: P1

    @inlinable public init(_ p0: P0, _ p1: P1) {
      self.p0 = p0
      self.p1 = p1
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      let original = input
      do { return try self.p0.parse(&input) } catch let e0 {
        do {
          input = original
          return try self.p1.parse(&input)
        } catch let e1 {
          throw ParsingError.manyFailed(
            [e0, e1], at: input
          )
        }
      }
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> OneOf2<P0, P1> {
    OneOf2(p0, p1)
  }
}

extension OneOfBuilder {
  public struct OneOf3<P0: Parser, P1: Parser, P2: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P0.Output == P1.Output,
    P1.Output == P2.Output
  {
    public let p0: P0, p1: P1, p2: P2

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
    }

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      let original = input
      do { return try self.p0.parse(&input) } catch let e0 {
        do {
          input = original
          return try self.p1.parse(&input)
        } catch let e1 {
          do {
            input = original
            return try self.p2.parse(&input)
          } catch let e2 {
            throw ParsingError.manyFailed(
              [e0, e1, e2], at: input
            )
          }
        }
      }
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> OneOf3<P0, P1, P2> {
    OneOf3(p0, p1, p2)
  }
}

extension OneOfBuilder {
  public struct OneOf4<P0: Parser, P1: Parser, P2: Parser, P3: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      let original = input
      do { return try self.p0.parse(&input) } catch let e0 {
        do {
          input = original
          return try self.p1.parse(&input)
        } catch let e1 {
          do {
            input = original
            return try self.p2.parse(&input)
          } catch let e2 {
            do {
              input = original
              return try self.p3.parse(&input)
            } catch let e3 {
              throw ParsingError.manyFailed(
                [e0, e1, e2, e3], at: input
              )
            }
          }
        }
      }
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> OneOf4<P0, P1, P2, P3> {
    OneOf4(p0, p1, p2, p3)
  }
}

extension OneOfBuilder {
  public struct OneOf5<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser>: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      let original = input
      do { return try self.p0.parse(&input) } catch let e0 {
        do {
          input = original
          return try self.p1.parse(&input)
        } catch let e1 {
          do {
            input = original
            return try self.p2.parse(&input)
          } catch let e2 {
            do {
              input = original
              return try self.p3.parse(&input)
            } catch let e3 {
              do {
                input = original
                return try self.p4.parse(&input)
              } catch let e4 {
                throw ParsingError.manyFailed(
                  [e0, e1, e2, e3, e4], at: input
                )
              }
            }
          }
        }
      }
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> OneOf5<P0, P1, P2, P3, P4> {
    OneOf5(p0, p1, p2, p3, p4)
  }
}

extension OneOfBuilder {
  public struct OneOf6<P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser>:
    Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      let original = input
      do { return try self.p0.parse(&input) } catch let e0 {
        do {
          input = original
          return try self.p1.parse(&input)
        } catch let e1 {
          do {
            input = original
            return try self.p2.parse(&input)
          } catch let e2 {
            do {
              input = original
              return try self.p3.parse(&input)
            } catch let e3 {
              do {
                input = original
                return try self.p4.parse(&input)
              } catch let e4 {
                do {
                  input = original
                  return try self.p5.parse(&input)
                } catch let e5 {
                  throw ParsingError.manyFailed(
                    [e0, e1, e2, e3, e4, e5], at: input
                  )
                }
              }
            }
          }
        }
      }
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> OneOf6<P0, P1, P2, P3, P4, P5> {
    OneOf6(p0, p1, p2, p3, p4, p5)
  }
}

extension OneOfBuilder {
  public struct OneOf7<
    P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser, P6: Parser
  >: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
    P6.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      let original = input
      do { return try self.p0.parse(&input) } catch let e0 {
        do {
          input = original
          return try self.p1.parse(&input)
        } catch let e1 {
          do {
            input = original
            return try self.p2.parse(&input)
          } catch let e2 {
            do {
              input = original
              return try self.p3.parse(&input)
            } catch let e3 {
              do {
                input = original
                return try self.p4.parse(&input)
              } catch let e4 {
                do {
                  input = original
                  return try self.p5.parse(&input)
                } catch let e5 {
                  do {
                    input = original
                    return try self.p6.parse(&input)
                  } catch let e6 {
                    throw ParsingError.manyFailed(
                      [e0, e1, e2, e3, e4, e5, e6], at: input
                    )
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6
  ) -> OneOf7<P0, P1, P2, P3, P4, P5, P6> {
    OneOf7(p0, p1, p2, p3, p4, p5, p6)
  }
}

extension OneOfBuilder {
  public struct OneOf8<
    P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser, P6: Parser, P7: Parser
  >: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
    P6.Input == Input,
    P7.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      let original = input
      do { return try self.p0.parse(&input) } catch let e0 {
        do {
          input = original
          return try self.p1.parse(&input)
        } catch let e1 {
          do {
            input = original
            return try self.p2.parse(&input)
          } catch let e2 {
            do {
              input = original
              return try self.p3.parse(&input)
            } catch let e3 {
              do {
                input = original
                return try self.p4.parse(&input)
              } catch let e4 {
                do {
                  input = original
                  return try self.p5.parse(&input)
                } catch let e5 {
                  do {
                    input = original
                    return try self.p6.parse(&input)
                  } catch let e6 {
                    do {
                      input = original
                      return try self.p7.parse(&input)
                    } catch let e7 {
                      throw ParsingError.manyFailed(
                        [e0, e1, e2, e3, e4, e5, e6, e7], at: input
                      )
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7
  ) -> OneOf8<P0, P1, P2, P3, P4, P5, P6, P7> {
    OneOf8(p0, p1, p2, p3, p4, p5, p6, p7)
  }
}

extension OneOfBuilder {
  public struct OneOf9<
    P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser, P6: Parser, P7: Parser,
    P8: Parser
  >: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
    P6.Input == Input,
    P7.Input == Input,
    P8.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      let original = input
      do { return try self.p0.parse(&input) } catch let e0 {
        do {
          input = original
          return try self.p1.parse(&input)
        } catch let e1 {
          do {
            input = original
            return try self.p2.parse(&input)
          } catch let e2 {
            do {
              input = original
              return try self.p3.parse(&input)
            } catch let e3 {
              do {
                input = original
                return try self.p4.parse(&input)
              } catch let e4 {
                do {
                  input = original
                  return try self.p5.parse(&input)
                } catch let e5 {
                  do {
                    input = original
                    return try self.p6.parse(&input)
                  } catch let e6 {
                    do {
                      input = original
                      return try self.p7.parse(&input)
                    } catch let e7 {
                      do {
                        input = original
                        return try self.p8.parse(&input)
                      } catch let e8 {
                        throw ParsingError.manyFailed(
                          [e0, e1, e2, e3, e4, e5, e6, e7, e8], at: input
                        )
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6, P7, P8>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7, _ p8: P8
  ) -> OneOf9<P0, P1, P2, P3, P4, P5, P6, P7, P8> {
    OneOf9(p0, p1, p2, p3, p4, p5, p6, p7, p8)
  }
}

extension OneOfBuilder {
  public struct OneOf10<
    P0: Parser, P1: Parser, P2: Parser, P3: Parser, P4: Parser, P5: Parser, P6: Parser, P7: Parser,
    P8: Parser, P9: Parser
  >: Parser
  where
    P0.Input == Input,
    P1.Input == Input,
    P2.Input == Input,
    P3.Input == Input,
    P4.Input == Input,
    P5.Input == Input,
    P6.Input == Input,
    P7.Input == Input,
    P8.Input == Input,
    P9.Input == Input,
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

    @inlinable public func parse(_ input: inout P0.Input) rethrows -> P0.Output {
      let original = input
      do { return try self.p0.parse(&input) } catch let e0 {
        do {
          input = original
          return try self.p1.parse(&input)
        } catch let e1 {
          do {
            input = original
            return try self.p2.parse(&input)
          } catch let e2 {
            do {
              input = original
              return try self.p3.parse(&input)
            } catch let e3 {
              do {
                input = original
                return try self.p4.parse(&input)
              } catch let e4 {
                do {
                  input = original
                  return try self.p5.parse(&input)
                } catch let e5 {
                  do {
                    input = original
                    return try self.p6.parse(&input)
                  } catch let e6 {
                    do {
                      input = original
                      return try self.p7.parse(&input)
                    } catch let e7 {
                      do {
                        input = original
                        return try self.p8.parse(&input)
                      } catch let e8 {
                        do {
                          input = original
                          return try self.p9.parse(&input)
                        } catch let e9 {
                          throw ParsingError.manyFailed(
                            [e0, e1, e2, e3, e4, e5, e6, e7, e8, e9], at: input
                          )
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6, P7, P8, P9>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7, _ p8: P8,
    _ p9: P9
  ) -> OneOf10<P0, P1, P2, P3, P4, P5, P6, P7, P8, P9> {
    OneOf10(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
  }
}

// END AUTO-GENERATED CONTENT
