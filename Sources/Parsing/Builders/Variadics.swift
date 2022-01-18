// BEGIN AUTO-GENERATED CONTENT

extension Parsers {
  public struct Zip2<P0, P1>: Parser
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
      let original = input
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input)
      else {
        input = original
        return nil
      }
      return (o0, o1)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> Parsers.Zip2<P0, P1> {
    Parsers.Zip2(p0, p1)
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1>(
    _ p: Parsers.Zip2<P0, P1>
  ) -> Parsers.Map<Parsers.Zip2<P0, P1>, (P0.Output)>
  where
    P1.Output == Void
  {
    p.map { o0, _ in (o0) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1>(
    _ p: Parsers.Zip2<P0, P1>
  ) -> Parsers.Map<Parsers.Zip2<P0, P1>, (P1.Output)>
  where
    P0.Output == Void
  {
    p.map { _, o1 in (o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1>(
    _ p: Parsers.Zip2<P0, P1>
  ) -> Parsers.Map<Parsers.Zip2<P0, P1>, ()>
  where
    P0.Output == Void,
    P1.Output == Void
  {
    p.map { _, _ in () }
  }
}

extension Parsers {
  public struct Zip3<P0, P1, P2>: Parser
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
      let original = input
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input)
      else {
        input = original
        return nil
      }
      return (o0, o1, o2)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Parsers.Zip3<P0, P1, P2> {
    Parsers.Zip3(p0, p1, p2)
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ p: Parsers.Zip3<P0, P1, P2>
  ) -> Parsers.Map<Parsers.Zip3<P0, P1, P2>, (P0.Output, P1.Output)>
  where
    P2.Output == Void
  {
    p.map { o0, o1, _ in (o0, o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ p: Parsers.Zip3<P0, P1, P2>
  ) -> Parsers.Map<Parsers.Zip3<P0, P1, P2>, (P0.Output, P2.Output)>
  where
    P1.Output == Void
  {
    p.map { o0, _, o2 in (o0, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ p: Parsers.Zip3<P0, P1, P2>
  ) -> Parsers.Map<Parsers.Zip3<P0, P1, P2>, (P0.Output)>
  where
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { o0, _, _ in (o0) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ p: Parsers.Zip3<P0, P1, P2>
  ) -> Parsers.Map<Parsers.Zip3<P0, P1, P2>, (P1.Output, P2.Output)>
  where
    P0.Output == Void
  {
    p.map { _, o1, o2 in (o1, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ p: Parsers.Zip3<P0, P1, P2>
  ) -> Parsers.Map<Parsers.Zip3<P0, P1, P2>, (P1.Output)>
  where
    P0.Output == Void,
    P2.Output == Void
  {
    p.map { _, o1, _ in (o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ p: Parsers.Zip3<P0, P1, P2>
  ) -> Parsers.Map<Parsers.Zip3<P0, P1, P2>, (P2.Output)>
  where
    P0.Output == Void,
    P1.Output == Void
  {
    p.map { _, _, o2 in (o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2>(
    _ p: Parsers.Zip3<P0, P1, P2>
  ) -> Parsers.Map<Parsers.Zip3<P0, P1, P2>, ()>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { _, _, _ in () }
  }
}

extension Parsers {
  public struct Zip4<P0, P1, P2, P3>: Parser
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
      let original = input
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input)
      else {
        input = original
        return nil
      }
      return (o0, o1, o2, o3)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Parsers.Zip4<P0, P1, P2, P3> {
    Parsers.Zip4(p0, p1, p2, p3)
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P0.Output, P1.Output, P2.Output)>
  where
    P3.Output == Void
  {
    p.map { o0, o1, o2, _ in (o0, o1, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P0.Output, P1.Output, P3.Output)>
  where
    P2.Output == Void
  {
    p.map { o0, o1, _, o3 in (o0, o1, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P0.Output, P1.Output)>
  where
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { o0, o1, _, _ in (o0, o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P0.Output, P2.Output, P3.Output)>
  where
    P1.Output == Void
  {
    p.map { o0, _, o2, o3 in (o0, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P0.Output, P2.Output)>
  where
    P1.Output == Void,
    P3.Output == Void
  {
    p.map { o0, _, o2, _ in (o0, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P0.Output, P3.Output)>
  where
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { o0, _, _, o3 in (o0, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P0.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { o0, _, _, _ in (o0) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P1.Output, P2.Output, P3.Output)>
  where
    P0.Output == Void
  {
    p.map { _, o1, o2, o3 in (o1, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P1.Output, P2.Output)>
  where
    P0.Output == Void,
    P3.Output == Void
  {
    p.map { _, o1, o2, _ in (o1, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P1.Output, P3.Output)>
  where
    P0.Output == Void,
    P2.Output == Void
  {
    p.map { _, o1, _, o3 in (o1, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P1.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { _, o1, _, _ in (o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P2.Output, P3.Output)>
  where
    P0.Output == Void,
    P1.Output == Void
  {
    p.map { _, _, o2, o3 in (o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P2.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void
  {
    p.map { _, _, o2, _ in (o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, (P3.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { _, _, _, o3 in (o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3>(
    _ p: Parsers.Zip4<P0, P1, P2, P3>
  ) -> Parsers.Map<Parsers.Zip4<P0, P1, P2, P3>, ()>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { _, _, _, _ in () }
  }
}

extension Parsers {
  public struct Zip5<P0, P1, P2, P3, P4>: Parser
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
      let original = input
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input)
      else {
        input = original
        return nil
      }
      return (o0, o1, o2, o3, o4)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Parsers.Zip5<P0, P1, P2, P3, P4> {
    Parsers.Zip5(p0, p1, p2, p3, p4)
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P1.Output, P2.Output, P3.Output)>
  where
    P4.Output == Void
  {
    p.map { o0, o1, o2, o3, _ in (o0, o1, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P1.Output, P2.Output, P4.Output)>
  where
    P3.Output == Void
  {
    p.map { o0, o1, o2, _, o4 in (o0, o1, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P1.Output, P2.Output)>
  where
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, o2, _, _ in (o0, o1, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P1.Output, P3.Output, P4.Output)>
  where
    P2.Output == Void
  {
    p.map { o0, o1, _, o3, o4 in (o0, o1, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P1.Output, P3.Output)>
  where
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, _, o3, _ in (o0, o1, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P1.Output, P4.Output)>
  where
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { o0, o1, _, _, o4 in (o0, o1, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P1.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, _, _, _ in (o0, o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P2.Output, P3.Output, P4.Output)>
  where
    P1.Output == Void
  {
    p.map { o0, _, o2, o3, o4 in (o0, o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P2.Output, P3.Output)>
  where
    P1.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, o2, o3, _ in (o0, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P2.Output, P4.Output)>
  where
    P1.Output == Void,
    P3.Output == Void
  {
    p.map { o0, _, o2, _, o4 in (o0, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P2.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, o2, _, _ in (o0, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P3.Output, P4.Output)>
  where
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { o0, _, _, o3, o4 in (o0, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P3.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, _, o3, _ in (o0, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output, P4.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { o0, _, _, _, o4 in (o0, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P0.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, _, _, _ in (o0) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P1.Output, P2.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void
  {
    p.map { _, o1, o2, o3, o4 in (o1, o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P1.Output, P2.Output, P3.Output)>
  where
    P0.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, o2, o3, _ in (o1, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P1.Output, P2.Output, P4.Output)>
  where
    P0.Output == Void,
    P3.Output == Void
  {
    p.map { _, o1, o2, _, o4 in (o1, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P1.Output, P2.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, o2, _, _ in (o1, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P1.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P2.Output == Void
  {
    p.map { _, o1, _, o3, o4 in (o1, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P1.Output, P3.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, _, o3, _ in (o1, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P1.Output, P4.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { _, o1, _, _, o4 in (o1, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P1.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, _, _, _ in (o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P2.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void
  {
    p.map { _, _, o2, o3, o4 in (o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P2.Output, P3.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, o2, o3, _ in (o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P2.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void
  {
    p.map { _, _, o2, _, o4 in (o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P2.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, o2, _, _ in (o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { _, _, _, o3, o4 in (o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P3.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, _, o3, _ in (o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, (P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { _, _, _, _, o4 in (o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4>(
    _ p: Parsers.Zip5<P0, P1, P2, P3, P4>
  ) -> Parsers.Map<Parsers.Zip5<P0, P1, P2, P3, P4>, ()>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, _, _, _ in () }
  }
}

extension Parsers {
  public struct Zip6<P0, P1, P2, P3, P4, P5>: Parser
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
      let original = input
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input)
      else {
        input = original
        return nil
      }
      return (o0, o1, o2, o3, o4, o5)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Parsers.Zip6<P0, P1, P2, P3, P4, P5> {
    Parsers.Zip6(p0, p1, p2, p3, p4, p5)
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P2.Output, P3.Output, P4.Output)>
  where
    P5.Output == Void
  {
    p.map { o0, o1, o2, o3, o4, _ in (o0, o1, o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P2.Output, P3.Output, P5.Output)>
  where
    P4.Output == Void
  {
    p.map { o0, o1, o2, o3, _, o5 in (o0, o1, o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P2.Output, P3.Output)>
  where
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, o2, o3, _, _ in (o0, o1, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P2.Output, P4.Output, P5.Output)>
  where
    P3.Output == Void
  {
    p.map { o0, o1, o2, _, o4, o5 in (o0, o1, o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P2.Output, P4.Output)>
  where
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, o2, _, o4, _ in (o0, o1, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P2.Output, P5.Output)>
  where
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, o2, _, _, o5 in (o0, o1, o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P2.Output)>
  where
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, o2, _, _, _ in (o0, o1, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P3.Output, P4.Output, P5.Output)>
  where
    P2.Output == Void
  {
    p.map { o0, o1, _, o3, o4, o5 in (o0, o1, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P3.Output, P4.Output)>
  where
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, o3, o4, _ in (o0, o1, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P3.Output, P5.Output)>
  where
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, _, o3, _, o5 in (o0, o1, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P3.Output)>
  where
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, o3, _, _ in (o0, o1, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P4.Output, P5.Output)>
  where
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { o0, o1, _, _, o4, o5 in (o0, o1, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P4.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, _, o4, _ in (o0, o1, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output, P5.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, _, _, _, o5 in (o0, o1, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P1.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, _, _, _ in (o0, o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P2.Output, P3.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void
  {
    p.map { o0, _, o2, o3, o4, o5 in (o0, o2, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P2.Output, P3.Output, P4.Output)>
  where
    P1.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, o3, o4, _ in (o0, o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P2.Output, P3.Output, P5.Output)>
  where
    P1.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, o2, o3, _, o5 in (o0, o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P2.Output, P3.Output)>
  where
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, o3, _, _ in (o0, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P2.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void,
    P3.Output == Void
  {
    p.map { o0, _, o2, _, o4, o5 in (o0, o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P2.Output, P4.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, _, o4, _ in (o0, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P2.Output, P5.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, o2, _, _, o5 in (o0, o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P2.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, _, _, _ in (o0, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P3.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { o0, _, _, o3, o4, o5 in (o0, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P3.Output, P4.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, o3, o4, _ in (o0, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P3.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, _, o3, _, o5 in (o0, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P3.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, o3, _, _ in (o0, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { o0, _, _, _, o4, o5 in (o0, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P4.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, _, o4, _ in (o0, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, _, _, _, o5 in (o0, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P0.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, _, _, _ in (o0) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P2.Output, P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void
  {
    p.map { _, o1, o2, o3, o4, o5 in (o1, o2, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P2.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, o3, o4, _ in (o1, o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P2.Output, P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, o2, o3, _, o5 in (o1, o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P2.Output, P3.Output)>
  where
    P0.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, o3, _, _ in (o1, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P2.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P3.Output == Void
  {
    p.map { _, o1, o2, _, o4, o5 in (o1, o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P2.Output, P4.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, _, o4, _ in (o1, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P2.Output, P5.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, o2, _, _, o5 in (o1, o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P2.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, _, _, _ in (o1, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void
  {
    p.map { _, o1, _, o3, o4, o5 in (o1, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, o3, o4, _ in (o1, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, _, o3, _, o5 in (o1, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P3.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, o3, _, _ in (o1, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { _, o1, _, _, o4, o5 in (o1, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P4.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, _, o4, _ in (o1, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, _, _, _, o5 in (o1, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P1.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, _, _, _ in (o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P2.Output, P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void
  {
    p.map { _, _, o2, o3, o4, o5 in (o2, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P2.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, o3, o4, _ in (o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P2.Output, P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, o2, o3, _, o5 in (o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P2.Output, P3.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, o3, _, _ in (o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P2.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void
  {
    p.map { _, _, o2, _, o4, o5 in (o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P2.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, _, o4, _ in (o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P2.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, o2, _, _, o5 in (o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P2.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, _, _, _ in (o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { _, _, _, o3, o4, o5 in (o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, o3, o4, _ in (o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, _, o3, _, o5 in (o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P3.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, o3, _, _ in (o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { _, _, _, _, o4, o5 in (o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, _, o4, _ in (o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, (P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, _, _, _, o5 in (o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5>(
    _ p: Parsers.Zip6<P0, P1, P2, P3, P4, P5>
  ) -> Parsers.Map<Parsers.Zip6<P0, P1, P2, P3, P4, P5>, ()>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, _, _, _ in () }
  }
}

extension Parsers {
  public struct Zip7<P0, P1, P2, P3, P4, P5, P6>: Parser
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
    P5.Input == P6.Input
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

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output,
      P6.Output
    )? {
      let original = input
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input),
        let o6 = p6.parse(&input)
      else {
        input = original
        return nil
      }
      return (o0, o1, o2, o3, o4, o5, o6)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6
  ) -> Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6> {
    Parsers.Zip7(p0, p1, p2, p3, p4, p5, p6)
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P3.Output, P4.Output, P5.Output)>
  where
    P6.Output == Void
  {
    p.map { o0, o1, o2, o3, o4, o5, _ in (o0, o1, o2, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P3.Output, P4.Output, P6.Output)>
  where
    P5.Output == Void
  {
    p.map { o0, o1, o2, o3, o4, _, o6 in (o0, o1, o2, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P3.Output, P4.Output)>
  where
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, o3, o4, _, _ in (o0, o1, o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P3.Output, P5.Output, P6.Output)>
  where
    P4.Output == Void
  {
    p.map { o0, o1, o2, o3, _, o5, o6 in (o0, o1, o2, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P3.Output, P5.Output)>
  where
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, o3, _, o5, _ in (o0, o1, o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P3.Output, P6.Output)>
  where
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, o2, o3, _, _, o6 in (o0, o1, o2, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P3.Output)>
  where
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, o3, _, _, _ in (o0, o1, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P4.Output, P5.Output, P6.Output)>
  where
    P3.Output == Void
  {
    p.map { o0, o1, o2, _, o4, o5, o6 in (o0, o1, o2, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P4.Output, P5.Output)>
  where
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, _, o4, o5, _ in (o0, o1, o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P4.Output, P6.Output)>
  where
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, o2, _, o4, _, o6 in (o0, o1, o2, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P4.Output)>
  where
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, _, o4, _, _ in (o0, o1, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P5.Output, P6.Output)>
  where
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, o2, _, _, o5, o6 in (o0, o1, o2, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P5.Output)>
  where
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, _, _, o5, _ in (o0, o1, o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output, P6.Output)>
  where
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, o2, _, _, _, o6 in (o0, o1, o2, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P2.Output)>
  where
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, _, _, _, _ in (o0, o1, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P2.Output == Void
  {
    p.map { o0, o1, _, o3, o4, o5, o6 in (o0, o1, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P3.Output, P4.Output, P5.Output)>
  where
    P2.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, o3, o4, o5, _ in (o0, o1, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P3.Output, P4.Output, P6.Output)>
  where
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, o3, o4, _, o6 in (o0, o1, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P3.Output, P4.Output)>
  where
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, o3, o4, _, _ in (o0, o1, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P3.Output, P5.Output, P6.Output)>
  where
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, _, o3, _, o5, o6 in (o0, o1, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P3.Output, P5.Output)>
  where
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, o3, _, o5, _ in (o0, o1, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P3.Output, P6.Output)>
  where
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, o3, _, _, o6 in (o0, o1, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P3.Output)>
  where
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, o3, _, _, _ in (o0, o1, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P4.Output, P5.Output, P6.Output)>
  where
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { o0, o1, _, _, o4, o5, o6 in (o0, o1, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P4.Output, P5.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, _, o4, o5, _ in (o0, o1, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P4.Output, P6.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, _, o4, _, o6 in (o0, o1, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P4.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, _, o4, _, _ in (o0, o1, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P5.Output, P6.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, _, _, _, o5, o6 in (o0, o1, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P5.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, _, _, o5, _ in (o0, o1, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output, P6.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, _, _, _, o6 in (o0, o1, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P1.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, _, _, _, _ in (o0, o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void
  {
    p.map { o0, _, o2, o3, o4, o5, o6 in (o0, o2, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P3.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, o3, o4, o5, _ in (o0, o2, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P3.Output, P4.Output, P6.Output)>
  where
    P1.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, o3, o4, _, o6 in (o0, o2, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P3.Output, P4.Output)>
  where
    P1.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, o3, o4, _, _ in (o0, o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P3.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, o2, o3, _, o5, o6 in (o0, o2, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P3.Output, P5.Output)>
  where
    P1.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, o3, _, o5, _ in (o0, o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P3.Output, P6.Output)>
  where
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, o3, _, _, o6 in (o0, o2, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P3.Output)>
  where
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, o3, _, _, _ in (o0, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P4.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P3.Output == Void
  {
    p.map { o0, _, o2, _, o4, o5, o6 in (o0, o2, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, _, o4, o5, _ in (o0, o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P4.Output, P6.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, _, o4, _, o6 in (o0, o2, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P4.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, _, o4, _, _ in (o0, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, o2, _, _, o5, o6 in (o0, o2, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P5.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, _, _, o5, _ in (o0, o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output, P6.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, _, _, _, o6 in (o0, o2, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P2.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, _, _, _, _ in (o0, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { o0, _, _, o3, o4, o5, o6 in (o0, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P3.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, o3, o4, o5, _ in (o0, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P3.Output, P4.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, o3, o4, _, o6 in (o0, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P3.Output, P4.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, o3, o4, _, _ in (o0, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P3.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, _, o3, _, o5, o6 in (o0, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P3.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, o3, _, o5, _ in (o0, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P3.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, o3, _, _, o6 in (o0, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P3.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, o3, _, _, _ in (o0, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P4.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { o0, _, _, _, o4, o5, o6 in (o0, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, _, o4, o5, _ in (o0, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P4.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, _, o4, _, o6 in (o0, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P4.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, _, o4, _, _ in (o0, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, _, _, _, o5, o6 in (o0, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, _, _, o5, _ in (o0, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, _, _, _, o6 in (o0, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P0.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, _, _, _, _ in (o0) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void
  {
    p.map { _, o1, o2, o3, o4, o5, o6 in (o1, o2, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, o3, o4, o5, _ in (o1, o2, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P3.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, o3, o4, _, o6 in (o1, o2, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, o3, o4, _, _ in (o1, o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P3.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, o2, o3, _, o5, o6 in (o1, o2, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, o3, _, o5, _ in (o1, o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P3.Output, P6.Output)>
  where
    P0.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, o3, _, _, o6 in (o1, o2, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P3.Output)>
  where
    P0.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, o3, _, _, _ in (o1, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P3.Output == Void
  {
    p.map { _, o1, o2, _, o4, o5, o6 in (o1, o2, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, _, o4, o5, _ in (o1, o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, _, o4, _, o6 in (o1, o2, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P4.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, _, o4, _, _ in (o1, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, o2, _, _, o5, o6 in (o1, o2, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P5.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, _, _, o5, _ in (o1, o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output, P6.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, _, _, _, o6 in (o1, o2, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P2.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, _, _, _, _ in (o1, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void
  {
    p.map { _, o1, _, o3, o4, o5, o6 in (o1, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, o3, o4, o5, _ in (o1, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P3.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, o3, o4, _, o6 in (o1, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, o3, o4, _, _ in (o1, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P3.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, _, o3, _, o5, o6 in (o1, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, o3, _, o5, _ in (o1, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P3.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, o3, _, _, o6 in (o1, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P3.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, o3, _, _, _ in (o1, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { _, o1, _, _, o4, o5, o6 in (o1, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, _, o4, o5, _ in (o1, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, _, o4, _, o6 in (o1, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P4.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, _, o4, _, _ in (o1, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, _, _, _, o5, o6 in (o1, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, _, _, o5, _ in (o1, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, _, _, _, o6 in (o1, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P1.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, _, _, _, _ in (o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void
  {
    p.map { _, _, o2, o3, o4, o5, o6 in (o2, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, o3, o4, o5, _ in (o2, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P3.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, o3, o4, _, o6 in (o2, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, o3, o4, _, _ in (o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P3.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, o2, o3, _, o5, o6 in (o2, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, o3, _, o5, _ in (o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P3.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, o3, _, _, o6 in (o2, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P3.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, o3, _, _, _ in (o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void
  {
    p.map { _, _, o2, _, o4, o5, o6 in (o2, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, _, o4, o5, _ in (o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, _, o4, _, o6 in (o2, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, _, o4, _, _ in (o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, o2, _, _, o5, o6 in (o2, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, _, _, o5, _ in (o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, _, _, _, o6 in (o2, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P2.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, _, _, _, _ in (o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { _, _, _, o3, o4, o5, o6 in (o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, o3, o4, o5, _ in (o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P3.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, o3, o4, _, o6 in (o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, o3, o4, _, _ in (o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P3.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, _, o3, _, o5, o6 in (o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, o3, _, o5, _ in (o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P3.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, o3, _, _, o6 in (o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P3.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, o3, _, _, _ in (o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { _, _, _, _, o4, o5, o6 in (o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, _, o4, o5, _ in (o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, _, o4, _, o6 in (o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, _, o4, _, _ in (o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, _, _, _, o5, o6 in (o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, _, _, o5, _ in (o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, (P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, _, _, _, o6 in (o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6>(
    _ p: Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>
  ) -> Parsers.Map<Parsers.Zip7<P0, P1, P2, P3, P4, P5, P6>, ()>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, _, _, _, _ in () }
  }
}

extension Parsers {
  public struct Zip8<P0, P1, P2, P3, P4, P5, P6, P7>: Parser
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
    P6.Input == P7.Input
  {
    public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7) {
      self.p0 = p0
      self.p1 = p1
      self.p2 = p2
      self.p3 = p3
      self.p4 = p4
      self.p5 = p5
      self.p6 = p6
      self.p7 = p7
    }

    @inlinable public func parse(_ input: inout P0.Input) -> (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output,
      P6.Output,
      P7.Output
    )? {
      let original = input
      guard
        let o0 = p0.parse(&input),
        let o1 = p1.parse(&input),
        let o2 = p2.parse(&input),
        let o3 = p3.parse(&input),
        let o4 = p4.parse(&input),
        let o5 = p5.parse(&input),
        let o6 = p6.parse(&input),
        let o7 = p7.parse(&input)
      else {
        input = original
        return nil
      }
      return (o0, o1, o2, o3, o4, o5, o6, o7)
    }
  }
}

extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7
  ) -> Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7> {
    Parsers.Zip8(p0, p1, p2, p3, p4, p5, p6, p7)
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P7.Output == Void
  {
    p.map { o0, o1, o2, o3, o4, o5, o6, _ in (o0, o1, o2, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P4.Output, P5.Output, P7.Output)>
  where
    P6.Output == Void
  {
    p.map { o0, o1, o2, o3, o4, o5, _, o7 in (o0, o1, o2, o3, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P4.Output, P5.Output)>
  where
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, o3, o4, o5, _, _ in (o0, o1, o2, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P4.Output, P6.Output, P7.Output)>
  where
    P5.Output == Void
  {
    p.map { o0, o1, o2, o3, o4, _, o6, o7 in (o0, o1, o2, o3, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P4.Output, P6.Output)>
  where
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, o3, o4, _, o6, _ in (o0, o1, o2, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P4.Output, P7.Output)>
  where
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, o3, o4, _, _, o7 in (o0, o1, o2, o3, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P4.Output)>
  where
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, o3, o4, _, _, _ in (o0, o1, o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P5.Output, P6.Output, P7.Output)>
  where
    P4.Output == Void
  {
    p.map { o0, o1, o2, o3, _, o5, o6, o7 in (o0, o1, o2, o3, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P5.Output, P6.Output)>
  where
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, o3, _, o5, o6, _ in (o0, o1, o2, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P5.Output, P7.Output)>
  where
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, o3, _, o5, _, o7 in (o0, o1, o2, o3, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P5.Output)>
  where
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, o3, _, o5, _, _ in (o0, o1, o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P6.Output, P7.Output)>
  where
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, o2, o3, _, _, o6, o7 in (o0, o1, o2, o3, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P6.Output)>
  where
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, o3, _, _, o6, _ in (o0, o1, o2, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output, P7.Output)>
  where
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, o3, _, _, _, o7 in (o0, o1, o2, o3, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P3.Output)>
  where
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, o3, _, _, _, _ in (o0, o1, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P3.Output == Void
  {
    p.map { o0, o1, o2, _, o4, o5, o6, o7 in (o0, o1, o2, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P4.Output, P5.Output, P6.Output)>
  where
    P3.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, _, o4, o5, o6, _ in (o0, o1, o2, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P4.Output, P5.Output, P7.Output)>
  where
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, _, o4, o5, _, o7 in (o0, o1, o2, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P4.Output, P5.Output)>
  where
    P3.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, _, o4, o5, _, _ in (o0, o1, o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P4.Output, P6.Output, P7.Output)>
  where
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, o2, _, o4, _, o6, o7 in (o0, o1, o2, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P4.Output, P6.Output)>
  where
    P3.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, _, o4, _, o6, _ in (o0, o1, o2, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P4.Output, P7.Output)>
  where
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, _, o4, _, _, o7 in (o0, o1, o2, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P4.Output)>
  where
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, _, o4, _, _, _ in (o0, o1, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P5.Output, P6.Output, P7.Output)>
  where
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, o2, _, _, o5, o6, o7 in (o0, o1, o2, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P5.Output, P6.Output)>
  where
    P3.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, _, _, o5, o6, _ in (o0, o1, o2, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P5.Output, P7.Output)>
  where
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, _, _, o5, _, o7 in (o0, o1, o2, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P5.Output)>
  where
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, _, _, o5, _, _ in (o0, o1, o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P6.Output, P7.Output)>
  where
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, o2, _, _, _, o6, o7 in (o0, o1, o2, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P6.Output)>
  where
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, _, _, _, o6, _ in (o0, o1, o2, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output, P7.Output)>
  where
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, o2, _, _, _, _, o7 in (o0, o1, o2, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P2.Output)>
  where
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, o2, _, _, _, _, _ in (o0, o1, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P2.Output == Void
  {
    p.map { o0, o1, _, o3, o4, o5, o6, o7 in (o0, o1, o3, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P2.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, o3, o4, o5, o6, _ in (o0, o1, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P4.Output, P5.Output, P7.Output)>
  where
    P2.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, o3, o4, o5, _, o7 in (o0, o1, o3, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P4.Output, P5.Output)>
  where
    P2.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, o3, o4, o5, _, _ in (o0, o1, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P4.Output, P6.Output, P7.Output)>
  where
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, o3, o4, _, o6, o7 in (o0, o1, o3, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P4.Output, P6.Output)>
  where
    P2.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, o3, o4, _, o6, _ in (o0, o1, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P4.Output, P7.Output)>
  where
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, o3, o4, _, _, o7 in (o0, o1, o3, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P4.Output)>
  where
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, o3, o4, _, _, _ in (o0, o1, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P5.Output, P6.Output, P7.Output)>
  where
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, _, o3, _, o5, o6, o7 in (o0, o1, o3, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P5.Output, P6.Output)>
  where
    P2.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, o3, _, o5, o6, _ in (o0, o1, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P5.Output, P7.Output)>
  where
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, o3, _, o5, _, o7 in (o0, o1, o3, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P5.Output)>
  where
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, o3, _, o5, _, _ in (o0, o1, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P6.Output, P7.Output)>
  where
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, o3, _, _, o6, o7 in (o0, o1, o3, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P6.Output)>
  where
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, o3, _, _, o6, _ in (o0, o1, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output, P7.Output)>
  where
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, o3, _, _, _, o7 in (o0, o1, o3, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P3.Output)>
  where
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, o3, _, _, _, _ in (o0, o1, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { o0, o1, _, _, o4, o5, o6, o7 in (o0, o1, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P4.Output, P5.Output, P6.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, _, o4, o5, o6, _ in (o0, o1, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P4.Output, P5.Output, P7.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, _, o4, o5, _, o7 in (o0, o1, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P4.Output, P5.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, _, o4, o5, _, _ in (o0, o1, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P4.Output, P6.Output, P7.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, _, o4, _, o6, o7 in (o0, o1, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P4.Output, P6.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, _, o4, _, o6, _ in (o0, o1, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P4.Output, P7.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, _, o4, _, _, o7 in (o0, o1, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P4.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, _, o4, _, _, _ in (o0, o1, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P5.Output, P6.Output, P7.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, o1, _, _, _, o5, o6, o7 in (o0, o1, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P5.Output, P6.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, _, _, o5, o6, _ in (o0, o1, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P5.Output, P7.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, _, _, o5, _, o7 in (o0, o1, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P5.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, _, _, o5, _, _ in (o0, o1, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P6.Output, P7.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, o1, _, _, _, _, o6, o7 in (o0, o1, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P6.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, _, _, _, o6, _ in (o0, o1, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output, P7.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, o1, _, _, _, _, _, o7 in (o0, o1, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P1.Output)>
  where
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, o1, _, _, _, _, _, _ in (o0, o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void
  {
    p.map { o0, _, o2, o3, o4, o5, o6, o7 in (o0, o2, o3, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, o3, o4, o5, o6, _ in (o0, o2, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P4.Output, P5.Output, P7.Output)>
  where
    P1.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, o3, o4, o5, _, o7 in (o0, o2, o3, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, o3, o4, o5, _, _ in (o0, o2, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P4.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, o3, o4, _, o6, o7 in (o0, o2, o3, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P4.Output, P6.Output)>
  where
    P1.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, o3, o4, _, o6, _ in (o0, o2, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P4.Output, P7.Output)>
  where
    P1.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, o3, o4, _, _, o7 in (o0, o2, o3, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P4.Output)>
  where
    P1.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, o3, o4, _, _, _ in (o0, o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P5.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, o2, o3, _, o5, o6, o7 in (o0, o2, o3, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, o3, _, o5, o6, _ in (o0, o2, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P5.Output, P7.Output)>
  where
    P1.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, o3, _, o5, _, o7 in (o0, o2, o3, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P5.Output)>
  where
    P1.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, o3, _, o5, _, _ in (o0, o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, o3, _, _, o6, o7 in (o0, o2, o3, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P6.Output)>
  where
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, o3, _, _, o6, _ in (o0, o2, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output, P7.Output)>
  where
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, o3, _, _, _, o7 in (o0, o2, o3, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P3.Output)>
  where
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, o3, _, _, _, _ in (o0, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P3.Output == Void
  {
    p.map { o0, _, o2, _, o4, o5, o6, o7 in (o0, o2, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P4.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, _, o4, o5, o6, _ in (o0, o2, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P4.Output, P5.Output, P7.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, _, o4, o5, _, o7 in (o0, o2, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, _, o4, o5, _, _ in (o0, o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P4.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, _, o4, _, o6, o7 in (o0, o2, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P4.Output, P6.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, _, o4, _, o6, _ in (o0, o2, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P4.Output, P7.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, _, o4, _, _, o7 in (o0, o2, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P4.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, _, o4, _, _, _ in (o0, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P5.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, o2, _, _, o5, o6, o7 in (o0, o2, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, _, _, o5, o6, _ in (o0, o2, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P5.Output, P7.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, _, _, o5, _, o7 in (o0, o2, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P5.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, _, _, o5, _, _ in (o0, o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, o2, _, _, _, o6, o7 in (o0, o2, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P6.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, _, _, _, o6, _ in (o0, o2, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output, P7.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, o2, _, _, _, _, o7 in (o0, o2, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P2.Output)>
  where
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, o2, _, _, _, _, _ in (o0, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { o0, _, _, o3, o4, o5, o6, o7 in (o0, o3, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, o3, o4, o5, o6, _ in (o0, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P4.Output, P5.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, o3, o4, o5, _, o7 in (o0, o3, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, o3, o4, o5, _, _ in (o0, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P4.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, o3, o4, _, o6, o7 in (o0, o3, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P4.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, o3, o4, _, o6, _ in (o0, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P4.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, o3, o4, _, _, o7 in (o0, o3, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P4.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, o3, o4, _, _, _ in (o0, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P5.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, _, o3, _, o5, o6, o7 in (o0, o3, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, o3, _, o5, o6, _ in (o0, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P5.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, o3, _, o5, _, o7 in (o0, o3, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, o3, _, o5, _, _ in (o0, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, o3, _, _, o6, o7 in (o0, o3, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, o3, _, _, o6, _ in (o0, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, o3, _, _, _, o7 in (o0, o3, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P3.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, o3, _, _, _, _ in (o0, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { o0, _, _, _, o4, o5, o6, o7 in (o0, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P4.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, _, o4, o5, o6, _ in (o0, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P4.Output, P5.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, _, o4, o5, _, o7 in (o0, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P4.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, _, o4, o5, _, _ in (o0, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P4.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, _, o4, _, o6, o7 in (o0, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P4.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, _, o4, _, o6, _ in (o0, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P4.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, _, o4, _, _, o7 in (o0, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P4.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, _, o4, _, _, _ in (o0, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P5.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { o0, _, _, _, _, o5, o6, o7 in (o0, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P5.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, _, _, o5, o6, _ in (o0, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P5.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, _, _, o5, _, o7 in (o0, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P5.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, _, _, o5, _, _ in (o0, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P6.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { o0, _, _, _, _, _, o6, o7 in (o0, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P6.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, _, _, _, o6, _ in (o0, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output, P7.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { o0, _, _, _, _, _, _, o7 in (o0, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P0.Output)>
  where
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { o0, _, _, _, _, _, _, _ in (o0) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void
  {
    p.map { _, o1, o2, o3, o4, o5, o6, o7 in (o1, o2, o3, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, o3, o4, o5, o6, _ in (o1, o2, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P4.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, o3, o4, o5, _, o7 in (o1, o2, o3, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, o3, o4, o5, _, _ in (o1, o2, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P4.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, o3, o4, _, o6, o7 in (o1, o2, o3, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, o3, o4, _, o6, _ in (o1, o2, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P4.Output, P7.Output)>
  where
    P0.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, o3, o4, _, _, o7 in (o1, o2, o3, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, o3, o4, _, _, _ in (o1, o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, o2, o3, _, o5, o6, o7 in (o1, o2, o3, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, o3, _, o5, o6, _ in (o1, o2, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, o3, _, o5, _, o7 in (o1, o2, o3, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, o3, _, o5, _, _ in (o1, o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, o3, _, _, o6, o7 in (o1, o2, o3, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P6.Output)>
  where
    P0.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, o3, _, _, o6, _ in (o1, o2, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output, P7.Output)>
  where
    P0.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, o3, _, _, _, o7 in (o1, o2, o3, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P3.Output)>
  where
    P0.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, o3, _, _, _, _ in (o1, o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P3.Output == Void
  {
    p.map { _, o1, o2, _, o4, o5, o6, o7 in (o1, o2, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, _, o4, o5, o6, _ in (o1, o2, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P4.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, _, o4, o5, _, o7 in (o1, o2, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, _, o4, o5, _, _ in (o1, o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P4.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, _, o4, _, o6, o7 in (o1, o2, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, _, o4, _, o6, _ in (o1, o2, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P4.Output, P7.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, _, o4, _, _, o7 in (o1, o2, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P4.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, _, o4, _, _, _ in (o1, o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, o2, _, _, o5, o6, o7 in (o1, o2, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, _, _, o5, o6, _ in (o1, o2, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, _, _, o5, _, o7 in (o1, o2, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P5.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, _, _, o5, _, _ in (o1, o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, o2, _, _, _, o6, o7 in (o1, o2, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P6.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, _, _, _, o6, _ in (o1, o2, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output, P7.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, o2, _, _, _, _, o7 in (o1, o2, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P2.Output)>
  where
    P0.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, o2, _, _, _, _, _ in (o1, o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void
  {
    p.map { _, o1, _, o3, o4, o5, o6, o7 in (o1, o3, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, o3, o4, o5, o6, _ in (o1, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P4.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, o3, o4, o5, _, o7 in (o1, o3, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, o3, o4, o5, _, _ in (o1, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P4.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, o3, o4, _, o6, o7 in (o1, o3, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, o3, o4, _, o6, _ in (o1, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P4.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, o3, o4, _, _, o7 in (o1, o3, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, o3, o4, _, _, _ in (o1, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, _, o3, _, o5, o6, o7 in (o1, o3, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, o3, _, o5, o6, _ in (o1, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, o3, _, o5, _, o7 in (o1, o3, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, o3, _, o5, _, _ in (o1, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, o3, _, _, o6, o7 in (o1, o3, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, o3, _, _, o6, _ in (o1, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, o3, _, _, _, o7 in (o1, o3, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P3.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, o3, _, _, _, _ in (o1, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { _, o1, _, _, o4, o5, o6, o7 in (o1, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, _, o4, o5, o6, _ in (o1, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P4.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, _, o4, o5, _, o7 in (o1, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, _, o4, o5, _, _ in (o1, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P4.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, _, o4, _, o6, o7 in (o1, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, _, o4, _, o6, _ in (o1, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P4.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, _, o4, _, _, o7 in (o1, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P4.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, _, o4, _, _, _ in (o1, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, o1, _, _, _, o5, o6, o7 in (o1, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, _, _, o5, o6, _ in (o1, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, _, _, o5, _, o7 in (o1, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P5.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, _, _, o5, _, _ in (o1, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, o1, _, _, _, _, o6, o7 in (o1, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P6.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, _, _, _, o6, _ in (o1, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output, P7.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, o1, _, _, _, _, _, o7 in (o1, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P1.Output)>
  where
    P0.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, o1, _, _, _, _, _, _ in (o1) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void
  {
    p.map { _, _, o2, o3, o4, o5, o6, o7 in (o2, o3, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, o3, o4, o5, o6, _ in (o2, o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P4.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, o3, o4, o5, _, o7 in (o2, o3, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, o3, o4, o5, _, _ in (o2, o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P4.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, o3, o4, _, o6, o7 in (o2, o3, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, o3, o4, _, o6, _ in (o2, o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P4.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, o3, o4, _, _, o7 in (o2, o3, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, o3, o4, _, _, _ in (o2, o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, o2, o3, _, o5, o6, o7 in (o2, o3, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, o3, _, o5, o6, _ in (o2, o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, o3, _, o5, _, o7 in (o2, o3, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, o3, _, o5, _, _ in (o2, o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, o3, _, _, o6, o7 in (o2, o3, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, o3, _, _, o6, _ in (o2, o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, o3, _, _, _, o7 in (o2, o3, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P3.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, o3, _, _, _, _ in (o2, o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void
  {
    p.map { _, _, o2, _, o4, o5, o6, o7 in (o2, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, _, o4, o5, o6, _ in (o2, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P4.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, _, o4, o5, _, o7 in (o2, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, _, o4, o5, _, _ in (o2, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P4.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, _, o4, _, o6, o7 in (o2, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, _, o4, _, o6, _ in (o2, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P4.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, _, o4, _, _, o7 in (o2, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, _, o4, _, _, _ in (o2, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, o2, _, _, o5, o6, o7 in (o2, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, _, _, o5, o6, _ in (o2, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, _, _, o5, _, o7 in (o2, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, _, _, o5, _, _ in (o2, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, o2, _, _, _, o6, o7 in (o2, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, _, _, _, o6, _ in (o2, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, o2, _, _, _, _, o7 in (o2, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P2.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, o2, _, _, _, _, _ in (o2) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void
  {
    p.map { _, _, _, o3, o4, o5, o6, o7 in (o3, o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, o3, o4, o5, o6, _ in (o3, o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P4.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, o3, o4, o5, _, o7 in (o3, o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, o3, o4, o5, _, _ in (o3, o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P4.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, o3, o4, _, o6, o7 in (o3, o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, o3, o4, _, o6, _ in (o3, o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P4.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, o3, o4, _, _, o7 in (o3, o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, o3, o4, _, _, _ in (o3, o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, _, o3, _, o5, o6, o7 in (o3, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, o3, _, o5, o6, _ in (o3, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, o3, _, o5, _, o7 in (o3, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, o3, _, o5, _, _ in (o3, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, o3, _, _, o6, o7 in (o3, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, o3, _, _, o6, _ in (o3, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, o3, _, _, _, o7 in (o3, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P3.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, o3, _, _, _, _ in (o3) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P4.Output, P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void
  {
    p.map { _, _, _, _, o4, o5, o6, o7 in (o4, o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P4.Output, P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, _, o4, o5, o6, _ in (o4, o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P4.Output, P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, _, o4, o5, _, o7 in (o4, o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P4.Output, P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, _, o4, o5, _, _ in (o4, o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P4.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, _, o4, _, o6, o7 in (o4, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P4.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, _, o4, _, o6, _ in (o4, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P4.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, _, o4, _, _, o7 in (o4, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P4.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, _, o4, _, _, _ in (o4) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P5.Output, P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    p.map { _, _, _, _, _, o5, o6, o7 in (o5, o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P5.Output, P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, _, _, o5, o6, _ in (o5, o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P5.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, _, _, o5, _, o7 in (o5, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P5.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, _, _, o5, _, _ in (o5) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P6.Output, P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void
  {
    p.map { _, _, _, _, _, _, o6, o7 in (o6, o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P6.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, _, _, _, o6, _ in (o6) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, (P7.Output)>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void
  {
    p.map { _, _, _, _, _, _, _, o7 in (o7) }
  }
}

extension ParserBuilder {
  @inlinable public static func buildFinalResult<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p: Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>
  ) -> Parsers.Map<Parsers.Zip8<P0, P1, P2, P3, P4, P5, P6, P7>, ()>
  where
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void,
    P3.Output == Void,
    P4.Output == Void,
    P5.Output == Void,
    P6.Output == Void,
    P7.Output == Void
  {
    p.map { _, _, _, _, _, _, _, _ in () }
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
      if let output = self.p0.parse(&input) { return output }
      if let output = self.p1.parse(&input) { return output }
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
      if let output = self.p0.parse(&input) { return output }
      if let output = self.p1.parse(&input) { return output }
      if let output = self.p2.parse(&input) { return output }
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
      if let output = self.p0.parse(&input) { return output }
      if let output = self.p1.parse(&input) { return output }
      if let output = self.p2.parse(&input) { return output }
      if let output = self.p3.parse(&input) { return output }
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
      if let output = self.p0.parse(&input) { return output }
      if let output = self.p1.parse(&input) { return output }
      if let output = self.p2.parse(&input) { return output }
      if let output = self.p3.parse(&input) { return output }
      if let output = self.p4.parse(&input) { return output }
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
      if let output = self.p0.parse(&input) { return output }
      if let output = self.p1.parse(&input) { return output }
      if let output = self.p2.parse(&input) { return output }
      if let output = self.p3.parse(&input) { return output }
      if let output = self.p4.parse(&input) { return output }
      if let output = self.p5.parse(&input) { return output }
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
      if let output = self.p0.parse(&input) { return output }
      if let output = self.p1.parse(&input) { return output }
      if let output = self.p2.parse(&input) { return output }
      if let output = self.p3.parse(&input) { return output }
      if let output = self.p4.parse(&input) { return output }
      if let output = self.p5.parse(&input) { return output }
      if let output = self.p6.parse(&input) { return output }
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

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7) {
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
      if let output = self.p0.parse(&input) { return output }
      if let output = self.p1.parse(&input) { return output }
      if let output = self.p2.parse(&input) { return output }
      if let output = self.p3.parse(&input) { return output }
      if let output = self.p4.parse(&input) { return output }
      if let output = self.p5.parse(&input) { return output }
      if let output = self.p6.parse(&input) { return output }
      if let output = self.p7.parse(&input) { return output }
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

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7, _ p8: P8) {
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
      if let output = self.p0.parse(&input) { return output }
      if let output = self.p1.parse(&input) { return output }
      if let output = self.p2.parse(&input) { return output }
      if let output = self.p3.parse(&input) { return output }
      if let output = self.p4.parse(&input) { return output }
      if let output = self.p5.parse(&input) { return output }
      if let output = self.p6.parse(&input) { return output }
      if let output = self.p7.parse(&input) { return output }
      if let output = self.p8.parse(&input) { return output }
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

    @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7, _ p8: P8, _ p9: P9) {
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
      if let output = self.p0.parse(&input) { return output }
      if let output = self.p1.parse(&input) { return output }
      if let output = self.p2.parse(&input) { return output }
      if let output = self.p3.parse(&input) { return output }
      if let output = self.p4.parse(&input) { return output }
      if let output = self.p5.parse(&input) { return output }
      if let output = self.p6.parse(&input) { return output }
      if let output = self.p7.parse(&input) { return output }
      if let output = self.p8.parse(&input) { return output }
      if let output = self.p9.parse(&input) { return output }
      return nil
    }
  }
}

extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6, P7, P8, P9>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7, _ p8: P8, _ p9: P9
  ) -> Parsers.OneOf10<P0, P1, P2, P3, P4, P5, P6, P7, P8, P9> {
    Parsers.OneOf10(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
  }
}

// END AUTO-GENERATED CONTENT
