// BEGIN AUTO-GENERATED CONTENT

public struct Zip2_OO<P0, P1>: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == P1.Input
{
  @usableFromInline let p0: P0, p1: P1
  @inlinable init(_ p0: P0, _ p1: P1) {
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
extension Zip2_OO: Printer
where
  P0: Printer,
  P1: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> Zip2_OO<P0, P1> {
    Zip2_OO(p0, p1)
  }
}
public struct Zip2_OV<P0, P1, P1Output> {
  @usableFromInline let p0: P0, p1: P1
  @inlinable init(_ p0: P0, _ p1: P1) where P1Output == Void {
    self.p0 = p0
    self.p1 = p1
  }
}
extension Zip2_OV: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == P1.Input,
  P1.Output == P1Output,
  P1.Output == Void
{
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P0.Output
  )? {
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0)
  }
}
extension Zip2_OV: Printer
where
  P0: Printer,
  P1: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Output == P1Output,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output),
      let i1 = p1.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> Zip2_OV<P0, P1, Void> {
    Zip2_OV(p0, p1)
  }
}
public struct Zip2_VO<P0, P1>: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == P1.Input,
  P0.Output == Void
{
  @usableFromInline let p0: P0, p1: P1
  @inlinable init(_ p0: P0, _ p1: P1) {
    self.p0 = p0
    self.p1 = p1
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P1.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1)
  }
}
extension Zip2_VO: Printer
where
  P0: Printer,
  P1: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P0.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output)
    else { return nil }
    i0.append(contentsOf: i1)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> Zip2_VO<P0, P1> {
    Zip2_VO(p0, p1)
  }
}
public struct Zip2_VV<P0, P1>: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == P1.Input,
  P0.Output == Void,
  P1.Output == Void
{
  @usableFromInline let p0: P0, p1: P1
  @inlinable init(_ p0: P0, _ p1: P1) {
    self.p0 = p0
    self.p1 = p1
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (

  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input)
    else {
      input = original
      return nil
    }
    return ()
  }
}
extension Zip2_VV: Printer
where
  P0: Printer,
  P1: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P0.Output == Void,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (

    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> Zip2_VV<P0, P1> {
    Zip2_VV(p0, p1)
  }
}
public struct Zip3_OOO<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == P1.Input,
  P1.Input == P2.Input
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
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
extension Zip3_OOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Zip3_OOO<P0, P1, P2> {
    Zip3_OOO(p0, p1, p2)
  }
}
public struct Zip3_OOV<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P0.Output,
    P1.Output
  )? {
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1)
  }
}
extension Zip3_OOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Zip3_OOV<P0, P1, P2> {
    Zip3_OOV(p0, p1, p2)
  }
}
public struct Zip3_OVO<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P1.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P0.Output,
    P2.Output
  )? {
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2)
  }
}
extension Zip3_OVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Zip3_OVO<P0, P1, P2> {
    Zip3_OVO(p0, p1, p2)
  }
}
public struct Zip3_OVV<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P1.Output == Void,
  P2.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P0.Output
  )? {
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0)
  }
}
extension Zip3_OVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output),
      let i1 = p1.print(()),
      let i2 = p2.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Zip3_OVV<P0, P1, P2> {
    Zip3_OVV(p0, p1, p2)
  }
}
public struct Zip3_VOO<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P0.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P1.Output,
    P2.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2)
  }
}
extension Zip3_VOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P0.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Zip3_VOO<P0, P1, P2> {
    Zip3_VOO(p0, p1, p2)
  }
}
public struct Zip3_VOV<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P0.Output == Void,
  P2.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P1.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1)
  }
}
extension Zip3_VOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P0.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output),
      let i2 = p2.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Zip3_VOV<P0, P1, P2> {
    Zip3_VOV(p0, p1, p2)
  }
}
public struct Zip3_VVO<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P0.Output == Void,
  P1.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P2.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2)
  }
}
extension Zip3_VVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P0.Output == Void,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Zip3_VVO<P0, P1, P2> {
    Zip3_VVO(p0, p1, p2)
  }
}
public struct Zip3_VVV<P0, P1, P2>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (

  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input)
    else {
      input = original
      return nil
    }
    return ()
  }
}
extension Zip3_VVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (

    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> Zip3_VVV<P0, P1, P2> {
    Zip3_VVV(p0, p1, p2)
  }
}
public struct Zip4_OOOO<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input
{
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
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
extension Zip4_OOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_OOOO<P0, P1, P2, P3> {
    Zip4_OOOO(p0, p1, p2, p3)
  }
}
public struct Zip4_OOOV<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o2)
  }
}
extension Zip4_OOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_OOOV<P0, P1, P2, P3> {
    Zip4_OOOV(p0, p1, p2, p3)
  }
}
public struct Zip4_OOVO<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o3)
  }
}
extension Zip4_OOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_OOVO<P0, P1, P2, P3> {
    Zip4_OOVO(p0, p1, p2, p3)
  }
}
public struct Zip4_OOVV<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P0.Output,
    P1.Output
  )? {
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1)
  }
}
extension Zip4_OOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_OOVV<P0, P1, P2, P3> {
    Zip4_OOVV(p0, p1, p2, p3)
  }
}
public struct Zip4_OVOO<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2, o3)
  }
}
extension Zip4_OVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_OVOO<P0, P1, P2, P3> {
    Zip4_OVOO(p0, p1, p2, p3)
  }
}
public struct Zip4_OVOV<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P0.Output,
    P2.Output
  )? {
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2)
  }
}
extension Zip4_OVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P1.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_OVOV<P0, P1, P2, P3> {
    Zip4_OVOV(p0, p1, p2, p3)
  }
}
public struct Zip4_OVVO<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P0.Output,
    P3.Output
  )? {
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o3)
  }
}
extension Zip4_OVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_OVVO<P0, P1, P2, P3> {
    Zip4_OVVO(p0, p1, p2, p3)
  }
}
public struct Zip4_OVVV<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P0.Output
  )? {
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0)
  }
}
extension Zip4_OVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_OVVV<P0, P1, P2, P3> {
    Zip4_OVVV(p0, p1, p2, p3)
  }
}
public struct Zip4_VOOO<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2, o3)
  }
}
extension Zip4_VOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P0.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_VOOO<P0, P1, P2, P3> {
    Zip4_VOOO(p0, p1, p2, p3)
  }
}
public struct Zip4_VOOV<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P1.Output,
    P2.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2)
  }
}
extension Zip4_VOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P0.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_VOOV<P0, P1, P2, P3> {
    Zip4_VOOV(p0, p1, p2, p3)
  }
}
public struct Zip4_VOVO<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P1.Output,
    P3.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o3)
  }
}
extension Zip4_VOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P0.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_VOVO<P0, P1, P2, P3> {
    Zip4_VOVO(p0, p1, p2, p3)
  }
}
public struct Zip4_VOVV<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P1.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1)
  }
}
extension Zip4_VOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P0.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output),
      let i2 = p2.print(()),
      let i3 = p3.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_VOVV<P0, P1, P2, P3> {
    Zip4_VOVV(p0, p1, p2, p3)
  }
}
public struct Zip4_VVOO<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P2.Output,
    P3.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2, o3)
  }
}
extension Zip4_VVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P0.Output == Void,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_VVOO<P0, P1, P2, P3> {
    Zip4_VVOO(p0, p1, p2, p3)
  }
}
public struct Zip4_VVOV<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P2.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2)
  }
}
extension Zip4_VVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P0.Output == Void,
  P1.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output),
      let i3 = p3.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_VVOV<P0, P1, P2, P3> {
    Zip4_VVOV(p0, p1, p2, p3)
  }
}
public struct Zip4_VVVO<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P3.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return (o3)
  }
}
extension Zip4_VVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_VVVO<P0, P1, P2, P3> {
    Zip4_VVVO(p0, p1, p2, p3)
  }
}
public struct Zip4_VVVV<P0, P1, P2, P3>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (

  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input)
    else {
      input = original
      return nil
    }
    return ()
  }
}
extension Zip4_VVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (

    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> Zip4_VVVV<P0, P1, P2, P3> {
    Zip4_VVVV(p0, p1, p2, p3)
  }
}
public struct Zip5_OOOOO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
extension Zip5_OOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(output.4)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OOOOO<P0, P1, P2, P3, P4> {
    Zip5_OOOOO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OOOOV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o2, o3)
  }
}
extension Zip5_OOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OOOOV<P0, P1, P2, P3, P4> {
    Zip5_OOOOV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OOOVO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o2, o4)
  }
}
extension Zip5_OOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OOOVO<P0, P1, P2, P3, P4> {
    Zip5_OOOVO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OOOVV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o2)
  }
}
extension Zip5_OOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OOOVV<P0, P1, P2, P3, P4> {
    Zip5_OOOVV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OOVOO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o3, o4)
  }
}
extension Zip5_OOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OOVOO<P0, P1, P2, P3, P4> {
    Zip5_OOVOO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OOVOV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o3)
  }
}
extension Zip5_OOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P2.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OOVOV<P0, P1, P2, P3, P4> {
    Zip5_OOVOV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OOVVO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o4)
  }
}
extension Zip5_OOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OOVVO<P0, P1, P2, P3, P4> {
    Zip5_OOVVO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OOVVV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1)
  }
}
extension Zip5_OOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P2.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OOVVV<P0, P1, P2, P3, P4> {
    Zip5_OOVVV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OVOOO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2, o3, o4)
  }
}
extension Zip5_OVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OVOOO<P0, P1, P2, P3, P4> {
    Zip5_OVOOO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OVOOV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2, o3)
  }
}
extension Zip5_OVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P1.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OVOOV<P0, P1, P2, P3, P4> {
    Zip5_OVOOV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OVOVO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2, o4)
  }
}
extension Zip5_OVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P1.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OVOVO<P0, P1, P2, P3, P4> {
    Zip5_OVOVO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OVOVV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2)
  }
}
extension Zip5_OVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P1.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OVOVV<P0, P1, P2, P3, P4> {
    Zip5_OVOVV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OVVOO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o3, o4)
  }
}
extension Zip5_OVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OVVOO<P0, P1, P2, P3, P4> {
    Zip5_OVVOO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OVVOV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o3)
  }
}
extension Zip5_OVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P1.Output == Void,
  P2.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OVVOV<P0, P1, P2, P3, P4> {
    Zip5_OVVOV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OVVVO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o4)
  }
}
extension Zip5_OVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OVVVO<P0, P1, P2, P3, P4> {
    Zip5_OVVVO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_OVVVV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P0.Output
  )? {
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0)
  }
}
extension Zip5_OVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_OVVVV<P0, P1, P2, P3, P4> {
    Zip5_OVVVV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VOOOO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2, o3, o4)
  }
}
extension Zip5_VOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VOOOO<P0, P1, P2, P3, P4> {
    Zip5_VOOOO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VOOOV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2, o3)
  }
}
extension Zip5_VOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VOOOV<P0, P1, P2, P3, P4> {
    Zip5_VOOOV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VOOVO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2, o4)
  }
}
extension Zip5_VOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VOOVO<P0, P1, P2, P3, P4> {
    Zip5_VOOVO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VOOVV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2)
  }
}
extension Zip5_VOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VOOVV<P0, P1, P2, P3, P4> {
    Zip5_VOOVV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VOVOO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o3, o4)
  }
}
extension Zip5_VOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VOVOO<P0, P1, P2, P3, P4> {
    Zip5_VOVOO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VOVOV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o3)
  }
}
extension Zip5_VOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P2.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VOVOV<P0, P1, P2, P3, P4> {
    Zip5_VOVOV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VOVVO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o4)
  }
}
extension Zip5_VOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VOVVO<P0, P1, P2, P3, P4> {
    Zip5_VOVVO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VOVVV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P1.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1)
  }
}
extension Zip5_VOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P2.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VOVVV<P0, P1, P2, P3, P4> {
    Zip5_VOVVV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VVOOO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2, o3, o4)
  }
}
extension Zip5_VVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VVOOO<P0, P1, P2, P3, P4> {
    Zip5_VVOOO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VVOOV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2, o3)
  }
}
extension Zip5_VVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P1.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VVOOV<P0, P1, P2, P3, P4> {
    Zip5_VVOOV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VVOVO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2, o4)
  }
}
extension Zip5_VVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P1.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VVOVO<P0, P1, P2, P3, P4> {
    Zip5_VVOVO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VVOVV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P2.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2)
  }
}
extension Zip5_VVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P1.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VVOVV<P0, P1, P2, P3, P4> {
    Zip5_VVOVV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VVVOO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o3, o4)
  }
}
extension Zip5_VVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.0),
      let i4 = p4.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VVVOO<P0, P1, P2, P3, P4> {
    Zip5_VVVOO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VVVOV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P3.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o3)
  }
}
extension Zip5_VVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VVVOV<P0, P1, P2, P3, P4> {
    Zip5_VVVOV(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VVVVO<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (
    P4.Output
  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return (o4)
  }
}
extension Zip5_VVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VVVVO<P0, P1, P2, P3, P4> {
    Zip5_VVVVO(p0, p1, p2, p3, p4)
  }
}
public struct Zip5_VVVVV<P0, P1, P2, P3, P4>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (

  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input)
    else {
      input = original
      return nil
    }
    return ()
  }
}
extension Zip5_VVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (

    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> Zip5_VVVVV<P0, P1, P2, P3, P4> {
    Zip5_VVVVV(p0, p1, p2, p3, p4)
  }
}
public struct Zip6_OOOOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
extension Zip6_OOOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(output.4),
      let i5 = p5.print(output.5)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOOOOO<P0, P1, P2, P3, P4, P5> {
    Zip6_OOOOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOOOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o2, o3, o4)
  }
}
extension Zip6_OOOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(output.4),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOOOOV<P0, P1, P2, P3, P4, P5> {
    Zip6_OOOOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOOOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o2, o3, o5)
  }
}
extension Zip6_OOOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(()),
      let i5 = p5.print(output.4)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOOOVO<P0, P1, P2, P3, P4, P5> {
    Zip6_OOOOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOOOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o2, o3)
  }
}
extension Zip6_OOOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P4.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOOOVV<P0, P1, P2, P3, P4, P5> {
    Zip6_OOOOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOOVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o2, o4, o5)
  }
}
extension Zip6_OOOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(output.3),
      let i5 = p5.print(output.4)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOOVOO<P0, P1, P2, P3, P4, P5> {
    Zip6_OOOVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOOVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o2, o4)
  }
}
extension Zip6_OOOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P3.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(output.3),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOOVOV<P0, P1, P2, P3, P4, P5> {
    Zip6_OOOVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOOVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o2, o5)
  }
}
extension Zip6_OOOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOOVVO<P0, P1, P2, P3, P4, P5> {
    Zip6_OOOVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOOVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o2)
  }
}
extension Zip6_OOOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P3.Output == Void,
  P4.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOOVVV<P0, P1, P2, P3, P4, P5> {
    Zip6_OOOVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOVOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o3, o4, o5)
  }
}
extension Zip6_OOVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(output.4)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOVOOO<P0, P1, P2, P3, P4, P5> {
    Zip6_OOVOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOVOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o3, o4)
  }
}
extension Zip6_OOVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P2.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOVOOV<P0, P1, P2, P3, P4, P5> {
    Zip6_OOVOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOVOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o3, o5)
  }
}
extension Zip6_OOVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P2.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P3.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOVOVO<P0, P1, P2, P3, P4, P5> {
    Zip6_OOVOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOVOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o3)
  }
}
extension Zip6_OOVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P2.Output == Void,
  P4.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOVOVV<P0, P1, P2, P3, P4, P5> {
    Zip6_OOVOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOVVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o4, o5)
  }
}
extension Zip6_OOVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOVVOO<P0, P1, P2, P3, P4, P5> {
    Zip6_OOVVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOVVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o4)
  }
}
extension Zip6_OOVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P2.Output == Void,
  P3.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOVVOV<P0, P1, P2, P3, P4, P5> {
    Zip6_OOVVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOVVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1, o5)
  }
}
extension Zip6_OOVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P2.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOVVVO<P0, P1, P2, P3, P4, P5> {
    Zip6_OOVVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OOVVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o1)
  }
}
extension Zip6_OOVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OOVVVV<P0, P1, P2, P3, P4, P5> {
    Zip6_OOVVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVOOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2, o3, o4, o5)
  }
}
extension Zip6_OVOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(output.4)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVOOOO<P0, P1, P2, P3, P4, P5> {
    Zip6_OVOOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVOOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2, o3, o4)
  }
}
extension Zip6_OVOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P1.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVOOOV<P0, P1, P2, P3, P4, P5> {
    Zip6_OVOOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVOOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2, o3, o5)
  }
}
extension Zip6_OVOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P1.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P3.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVOOVO<P0, P1, P2, P3, P4, P5> {
    Zip6_OVOOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVOOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2, o3)
  }
}
extension Zip6_OVOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P1.Output == Void,
  P4.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVOOVV<P0, P1, P2, P3, P4, P5> {
    Zip6_OVOOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVOVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2, o4, o5)
  }
}
extension Zip6_OVOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P1.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVOVOO<P0, P1, P2, P3, P4, P5> {
    Zip6_OVOVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVOVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2, o4)
  }
}
extension Zip6_OVOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P1.Output == Void,
  P3.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVOVOV<P0, P1, P2, P3, P4, P5> {
    Zip6_OVOVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVOVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2, o5)
  }
}
extension Zip6_OVOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P1.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVOVVO<P0, P1, P2, P3, P4, P5> {
    Zip6_OVOVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVOVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o2)
  }
}
extension Zip6_OVOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVOVVV<P0, P1, P2, P3, P4, P5> {
    Zip6_OVOVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVVOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o3, o4, o5)
  }
}
extension Zip6_OVVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVVOOO<P0, P1, P2, P3, P4, P5> {
    Zip6_OVVOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVVOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o3, o4)
  }
}
extension Zip6_OVVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P1.Output == Void,
  P2.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVVOOV<P0, P1, P2, P3, P4, P5> {
    Zip6_OVVOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVVOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o3, o5)
  }
}
extension Zip6_OVVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P1.Output == Void,
  P2.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P3.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVVOVO<P0, P1, P2, P3, P4, P5> {
    Zip6_OVVOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVVOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o3)
  }
}
extension Zip6_OVVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P0.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVVOVV<P0, P1, P2, P3, P4, P5> {
    Zip6_OVVOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVVVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o4, o5)
  }
}
extension Zip6_OVVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVVVOO<P0, P1, P2, P3, P4, P5> {
    Zip6_OVVVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVVVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o4)
  }
}
extension Zip6_OVVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P0.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVVVOV<P0, P1, P2, P3, P4, P5> {
    Zip6_OVVVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVVVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0, o5)
  }
}
extension Zip6_OVVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P0.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVVVVO<P0, P1, P2, P3, P4, P5> {
    Zip6_OVVVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_OVVVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let o0 = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o0)
  }
}
extension Zip6_OVVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P0.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(output),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_OVVVVV<P0, P1, P2, P3, P4, P5> {
    Zip6_OVVVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOOOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2, o3, o4, o5)
  }
}
extension Zip6_VOOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(output.4)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOOOOO<P0, P1, P2, P3, P4, P5> {
    Zip6_VOOOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOOOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2, o3, o4)
  }
}
extension Zip6_VOOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOOOOV<P0, P1, P2, P3, P4, P5> {
    Zip6_VOOOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOOOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2, o3, o5)
  }
}
extension Zip6_VOOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P3.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOOOVO<P0, P1, P2, P3, P4, P5> {
    Zip6_VOOOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOOOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2, o3)
  }
}
extension Zip6_VOOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P4.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOOOVV<P0, P1, P2, P3, P4, P5> {
    Zip6_VOOOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOOVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2, o4, o5)
  }
}
extension Zip6_VOOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOOVOO<P0, P1, P2, P3, P4, P5> {
    Zip6_VOOVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOOVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2, o4)
  }
}
extension Zip6_VOOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P3.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOOVOV<P0, P1, P2, P3, P4, P5> {
    Zip6_VOOVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOOVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2, o5)
  }
}
extension Zip6_VOOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOOVVO<P0, P1, P2, P3, P4, P5> {
    Zip6_VOOVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOOVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o2)
  }
}
extension Zip6_VOOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOOVVV<P0, P1, P2, P3, P4, P5> {
    Zip6_VOOVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOVOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o3, o4, o5)
  }
}
extension Zip6_VOVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOVOOO<P0, P1, P2, P3, P4, P5> {
    Zip6_VOVOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOVOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o3, o4)
  }
}
extension Zip6_VOVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P2.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOVOOV<P0, P1, P2, P3, P4, P5> {
    Zip6_VOVOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOVOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o3, o5)
  }
}
extension Zip6_VOVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P2.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P3.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOVOVO<P0, P1, P2, P3, P4, P5> {
    Zip6_VOVOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOVOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o3)
  }
}
extension Zip6_VOVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P1.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOVOVV<P0, P1, P2, P3, P4, P5> {
    Zip6_VOVOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOVVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o4, o5)
  }
}
extension Zip6_VOVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOVVOO<P0, P1, P2, P3, P4, P5> {
    Zip6_VOVVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOVVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o4)
  }
}
extension Zip6_VOVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P1.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOVVOV<P0, P1, P2, P3, P4, P5> {
    Zip6_VOVVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOVVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1, o5)
  }
}
extension Zip6_VOVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P1.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOVVVO<P0, P1, P2, P3, P4, P5> {
    Zip6_VOVVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VOVVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let o1 = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o1)
  }
}
extension Zip6_VOVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P1.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(output),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VOVVVV<P0, P1, P2, P3, P4, P5> {
    Zip6_VOVVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVOOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2, o3, o4, o5)
  }
}
extension Zip6_VVOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P3.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVOOOO<P0, P1, P2, P3, P4, P5> {
    Zip6_VVOOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVOOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2, o3, o4)
  }
}
extension Zip6_VVOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P1.Output == Void,
  P5.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVOOOV<P0, P1, P2, P3, P4, P5> {
    Zip6_VVOOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVOOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2, o3, o5)
  }
}
extension Zip6_VVOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P1.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P3.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVOOVO<P0, P1, P2, P3, P4, P5> {
    Zip6_VVOOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVOOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2, o3)
  }
}
extension Zip6_VVOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P2.Output,
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVOOVV<P0, P1, P2, P3, P4, P5> {
    Zip6_VVOOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVOVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2, o4, o5)
  }
}
extension Zip6_VVOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P1.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVOVOO<P0, P1, P2, P3, P4, P5> {
    Zip6_VVOVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVOVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2, o4)
  }
}
extension Zip6_VVOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P2.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVOVOV<P0, P1, P2, P3, P4, P5> {
    Zip6_VVOVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVOVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2, o5)
  }
}
extension Zip6_VVOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P2.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVOVVO<P0, P1, P2, P3, P4, P5> {
    Zip6_VVOVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVOVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let o2 = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o2)
  }
}
extension Zip6_VVOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P2.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVOVVV<P0, P1, P2, P3, P4, P5> {
    Zip6_VVOVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVVOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o3, o4, o5)
  }
}
extension Zip6_VVVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P4.Input == P5.Input,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P3.Output,
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.0),
      let i4 = p4.print(output.1),
      let i5 = p5.print(output.2)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVVOOO<P0, P1, P2, P3, P4, P5> {
    Zip6_VVVOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVVOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o3, o4)
  }
}
extension Zip6_VVVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P3.Output,
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.0),
      let i4 = p4.print(output.1),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVVOOV<P0, P1, P2, P3, P4, P5> {
    Zip6_VVVOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVVOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o3, o5)
  }
}
extension Zip6_VVVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P3.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.0),
      let i4 = p4.print(()),
      let i5 = p5.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVVOVO<P0, P1, P2, P3, P4, P5> {
    Zip6_VVVOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVVOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let o3 = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o3)
  }
}
extension Zip6_VVVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P3.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVVOVV<P0, P1, P2, P3, P4, P5> {
    Zip6_VVVOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVVVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o4, o5)
  }
}
extension Zip6_VVVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P4.Output,
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.0),
      let i5 = p5.print(output.1)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVVVOO<P0, P1, P2, P3, P4, P5> {
    Zip6_VVVVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVVVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let o4 = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o4)
  }
}
extension Zip6_VVVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P4.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVVVOV<P0, P1, P2, P3, P4, P5> {
    Zip6_VVVVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVVVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
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
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let o5 = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return (o5)
  }
}
extension Zip6_VVVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (
      P5.Output
    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output)
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVVVVO<P0, P1, P2, P3, P4, P5> {
    Zip6_VVVVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct Zip6_VVVVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }
  @inlinable public func parse(_ input: inout P0.Input) -> (

  )? {
    let original = input
    guard
      let _ = p0.parse(&input),
      let _ = p1.parse(&input),
      let _ = p2.parse(&input),
      let _ = p3.parse(&input),
      let _ = p4.parse(&input),
      let _ = p5.parse(&input)
    else {
      input = original
      return nil
    }
    return ()
  }
}
extension Zip6_VVVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P0.Input: Appendable,
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
  @inlinable public func print(
    _ output: (

    )
  ) -> P0.Input? {
    guard
      var i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    i0.append(contentsOf: i1)
    i0.append(contentsOf: i2)
    i0.append(contentsOf: i3)
    i0.append(contentsOf: i4)
    i0.append(contentsOf: i5)
    return i0
  }
}
extension ParserBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> Zip6_VVVVVV<P0, P1, P2, P3, P4, P5> {
    Zip6_VVVVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct OneOf2<P0, P1> {
  @usableFromInline let p0: P0, p1: P1
  @inlinable init(_ p0: P0, _ p1: P1) {
    self.p0 = p0
    self.p1 = p1
  }
}
extension OneOf2: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == P1.Input,
  P0.Output == P1.Output
{
  @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
    if let output = self.p0.parse(&input) { return output }
    if let output = self.p1.parse(&input) { return output }
    return nil
  }
}
extension OneOf2: Printer
where
  P0: Printer,
  P1: Printer,
  P0.Input == P1.Input,
  P0.Output == P1.Output
{
  @inlinable public func print(_ output: P0.Output) -> P0.Input? {
    if let input = self.p0.print(output) { return input }
    if let input = self.p1.print(output) { return input }
    return nil
  }
}
extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> OneOf2<P0, P1> {
    OneOf2(p0, p1)
  }
}
public struct OneOf3<P0, P1, P2> {
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
}
extension OneOf3: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P0.Output == P1.Output,
  P1.Output == P2.Output
{
  @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
    if let output = self.p0.parse(&input) { return output }
    if let output = self.p1.parse(&input) { return output }
    if let output = self.p2.parse(&input) { return output }
    return nil
  }
}
extension OneOf3: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P0.Output == P1.Output,
  P1.Output == P2.Output
{
  @inlinable public func print(_ output: P0.Output) -> P0.Input? {
    if let input = self.p0.print(output) { return input }
    if let input = self.p1.print(output) { return input }
    if let input = self.p2.print(output) { return input }
    return nil
  }
}
extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> OneOf3<P0, P1, P2> {
    OneOf3(p0, p1, p2)
  }
}
public struct OneOf4<P0, P1, P2, P3> {
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
}
extension OneOf4: Parser
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
  @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
    if let output = self.p0.parse(&input) { return output }
    if let output = self.p1.parse(&input) { return output }
    if let output = self.p2.parse(&input) { return output }
    if let output = self.p3.parse(&input) { return output }
    return nil
  }
}
extension OneOf4: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P0.Output == P1.Output,
  P1.Output == P2.Output,
  P2.Output == P3.Output
{
  @inlinable public func print(_ output: P0.Output) -> P0.Input? {
    if let input = self.p0.print(output) { return input }
    if let input = self.p1.print(output) { return input }
    if let input = self.p2.print(output) { return input }
    if let input = self.p3.print(output) { return input }
    return nil
  }
}
extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> OneOf4<P0, P1, P2, P3> {
    OneOf4(p0, p1, p2, p3)
  }
}
public struct OneOf5<P0, P1, P2, P3, P4> {
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }
}
extension OneOf5: Parser
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
  @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {
    if let output = self.p0.parse(&input) { return output }
    if let output = self.p1.parse(&input) { return output }
    if let output = self.p2.parse(&input) { return output }
    if let output = self.p3.parse(&input) { return output }
    if let output = self.p4.parse(&input) { return output }
    return nil
  }
}
extension OneOf5: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input == P1.Input,
  P1.Input == P2.Input,
  P2.Input == P3.Input,
  P3.Input == P4.Input,
  P0.Output == P1.Output,
  P1.Output == P2.Output,
  P2.Output == P3.Output,
  P3.Output == P4.Output
{
  @inlinable public func print(_ output: P0.Output) -> P0.Input? {
    if let input = self.p0.print(output) { return input }
    if let input = self.p1.print(output) { return input }
    if let input = self.p2.print(output) { return input }
    if let input = self.p3.print(output) { return input }
    if let input = self.p4.print(output) { return input }
    return nil
  }
}
extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> OneOf5<P0, P1, P2, P3, P4> {
    OneOf5(p0, p1, p2, p3, p4)
  }
}
public struct OneOf6<P0, P1, P2, P3, P4, P5> {
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }
}
extension OneOf6: Parser
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
extension OneOf6: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  @inlinable public func print(_ output: P0.Output) -> P0.Input? {
    if let input = self.p0.print(output) { return input }
    if let input = self.p1.print(output) { return input }
    if let input = self.p2.print(output) { return input }
    if let input = self.p3.print(output) { return input }
    if let input = self.p4.print(output) { return input }
    if let input = self.p5.print(output) { return input }
    return nil
  }
}
extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> OneOf6<P0, P1, P2, P3, P4, P5> {
    OneOf6(p0, p1, p2, p3, p4, p5)
  }
}
public struct OneOf7<P0, P1, P2, P3, P4, P5, P6> {
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
    self.p6 = p6
  }
}
extension OneOf7: Parser
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
extension OneOf7: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P6: Printer,
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
  @inlinable public func print(_ output: P0.Output) -> P0.Input? {
    if let input = self.p0.print(output) { return input }
    if let input = self.p1.print(output) { return input }
    if let input = self.p2.print(output) { return input }
    if let input = self.p3.print(output) { return input }
    if let input = self.p4.print(output) { return input }
    if let input = self.p5.print(output) { return input }
    if let input = self.p6.print(output) { return input }
    return nil
  }
}
extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6
  ) -> OneOf7<P0, P1, P2, P3, P4, P5, P6> {
    OneOf7(p0, p1, p2, p3, p4, p5, p6)
  }
}
public struct OneOf8<P0, P1, P2, P3, P4, P5, P6, P7> {
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
    self.p6 = p6
    self.p7 = p7
  }
}
extension OneOf8: Parser
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
extension OneOf8: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P6: Printer,
  P7: Printer,
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
  @inlinable public func print(_ output: P0.Output) -> P0.Input? {
    if let input = self.p0.print(output) { return input }
    if let input = self.p1.print(output) { return input }
    if let input = self.p2.print(output) { return input }
    if let input = self.p3.print(output) { return input }
    if let input = self.p4.print(output) { return input }
    if let input = self.p5.print(output) { return input }
    if let input = self.p6.print(output) { return input }
    if let input = self.p7.print(output) { return input }
    return nil
  }
}
extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6, P7>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7
  ) -> OneOf8<P0, P1, P2, P3, P4, P5, P6, P7> {
    OneOf8(p0, p1, p2, p3, p4, p5, p6, p7)
  }
}
public struct OneOf9<P0, P1, P2, P3, P4, P5, P6, P7, P8> {
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7, p8: P8
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7, _ p8: P8) {
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
}
extension OneOf9: Parser
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
extension OneOf9: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
  P6: Printer,
  P7: Printer,
  P8: Printer,
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
  @inlinable public func print(_ output: P0.Output) -> P0.Input? {
    if let input = self.p0.print(output) { return input }
    if let input = self.p1.print(output) { return input }
    if let input = self.p2.print(output) { return input }
    if let input = self.p3.print(output) { return input }
    if let input = self.p4.print(output) { return input }
    if let input = self.p5.print(output) { return input }
    if let input = self.p6.print(output) { return input }
    if let input = self.p7.print(output) { return input }
    if let input = self.p8.print(output) { return input }
    return nil
  }
}
extension OneOfBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5, P6, P7, P8>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5, _ p6: P6, _ p7: P7, _ p8: P8
  ) -> OneOf9<P0, P1, P2, P3, P4, P5, P6, P7, P8> {
    OneOf9(p0, p1, p2, p3, p4, p5, p6, p7, p8)
  }
}

// END AUTO-GENERATED CONTENT
