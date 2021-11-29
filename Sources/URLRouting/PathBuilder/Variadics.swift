// BEGIN AUTO-GENERATED CONTENT

public struct PathZip2_OO<P0, P1>: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == Substring,
  P1.Input == Substring
{
  @usableFromInline let p0: P0, p1: P1
  @inlinable init(_ p0: P0, _ p1: P1) {
    self.p0 = p0
    self.p1 = p1
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output
  )? {
    guard
      input.path.count >= 2,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty
    else { return nil }
    input.path.removeFirst(2)
    return (o0, o1)
  }
}
extension PathZip2_OO: Printer
where
  P0: Printer,
  P1: Printer
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1)
    else { return nil }
    return .init(path: [i0, i1])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> PathZip2_OO<P0, P1> {
    PathZip2_OO(p0, p1)
  }
}
public struct PathZip2_OV<P0, P1>: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P1.Output == Void
{
  @usableFromInline let p0: P0, p1: P1
  @inlinable init(_ p0: P0, _ p1: P1) {
    self.p0 = p0
    self.p1 = p1
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output
  )? {
    guard
      input.path.count >= 2,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty
    else { return nil }
    input.path.removeFirst(2)
    return (o0)
  }
}
extension PathZip2_OV: Printer
where
  P0: Printer,
  P1: Printer,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output),
      let i1 = p1.print(())
    else { return nil }
    return .init(path: [i0, i1])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> PathZip2_OV<P0, P1> {
    PathZip2_OV(p0, p1)
  }
}
public struct PathZip2_VO<P0, P1>: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P0.Output == Void
{
  @usableFromInline let p0: P0, p1: P1
  @inlinable init(_ p0: P0, _ p1: P1) {
    self.p0 = p0
    self.p1 = p1
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output
  )? {
    guard
      input.path.count >= 2,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty
    else { return nil }
    input.path.removeFirst(2)
    return (o1)
  }
}
extension PathZip2_VO: Printer
where
  P0: Printer,
  P1: Printer,
  P0.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output)
    else { return nil }
    return .init(path: [i0, i1])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> PathZip2_VO<P0, P1> {
    PathZip2_VO(p0, p1)
  }
}
public struct PathZip2_VV<P0, P1>: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P0.Output == Void,
  P1.Output == Void
{
  @usableFromInline let p0: P0, p1: P1
  @inlinable init(_ p0: P0, _ p1: P1) {
    self.p0 = p0
    self.p1 = p1
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (

  )? {
    guard
      input.path.count >= 2,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty
    else { return nil }
    input.path.removeFirst(2)
    return ()
  }
}
extension PathZip2_VV: Printer
where
  P0: Printer,
  P1: Printer,
  P0.Output == Void,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (

    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(())
    else { return nil }
    return .init(path: [i0, i1])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> PathZip2_VV<P0, P1> {
    PathZip2_VV(p0, p1)
  }
}
public struct PathZip3_OOO<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 3,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty
    else { return nil }
    input.path.removeFirst(3)
    return (o0, o1, o2)
  }
}
extension PathZip3_OOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZip3_OOO<P0, P1, P2> {
    PathZip3_OOO(p0, p1, p2)
  }
}
public struct PathZip3_OOV<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P2.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output
  )? {
    guard
      input.path.count >= 3,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty
    else { return nil }
    input.path.removeFirst(3)
    return (o0, o1)
  }
}
extension PathZip3_OOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(())
    else { return nil }
    return .init(path: [i0, i1, i2])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZip3_OOV<P0, P1, P2> {
    PathZip3_OOV(p0, p1, p2)
  }
}
public struct PathZip3_OVO<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P1.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 3,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty
    else { return nil }
    input.path.removeFirst(3)
    return (o0, o2)
  }
}
extension PathZip3_OVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZip3_OVO<P0, P1, P2> {
    PathZip3_OVO(p0, p1, p2)
  }
}
public struct PathZip3_OVV<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P1.Output == Void,
  P2.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output
  )? {
    guard
      input.path.count >= 3,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty
    else { return nil }
    input.path.removeFirst(3)
    return (o0)
  }
}
extension PathZip3_OVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output),
      let i1 = p1.print(()),
      let i2 = p2.print(())
    else { return nil }
    return .init(path: [i0, i1, i2])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZip3_OVV<P0, P1, P2> {
    PathZip3_OVV(p0, p1, p2)
  }
}
public struct PathZip3_VOO<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P0.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 3,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty
    else { return nil }
    input.path.removeFirst(3)
    return (o1, o2)
  }
}
extension PathZip3_VOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZip3_VOO<P0, P1, P2> {
    PathZip3_VOO(p0, p1, p2)
  }
}
public struct PathZip3_VOV<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P0.Output == Void,
  P2.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output
  )? {
    guard
      input.path.count >= 3,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty
    else { return nil }
    input.path.removeFirst(3)
    return (o1)
  }
}
extension PathZip3_VOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output),
      let i2 = p2.print(())
    else { return nil }
    return .init(path: [i0, i1, i2])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZip3_VOV<P0, P1, P2> {
    PathZip3_VOV(p0, p1, p2)
  }
}
public struct PathZip3_VVO<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P0.Output == Void,
  P1.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output
  )? {
    guard
      input.path.count >= 3,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty
    else { return nil }
    input.path.removeFirst(3)
    return (o2)
  }
}
extension PathZip3_VVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Output == Void,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output)
    else { return nil }
    return .init(path: [i0, i1, i2])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZip3_VVO<P0, P1, P2> {
    PathZip3_VVO(p0, p1, p2)
  }
}
public struct PathZip3_VVV<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (

  )? {
    guard
      input.path.count >= 3,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty
    else { return nil }
    input.path.removeFirst(3)
    return ()
  }
}
extension PathZip3_VVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (

    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(())
    else { return nil }
    return .init(path: [i0, i1, i2])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZip3_VVV<P0, P1, P2> {
    PathZip3_VVV(p0, p1, p2)
  }
}
public struct PathZip4_OOOO<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring
{
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o0, o1, o2, o3)
  }
}
extension PathZip4_OOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_OOOO<P0, P1, P2, P3> {
    PathZip4_OOOO(p0, p1, p2, p3)
  }
}
public struct PathZip4_OOOV<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P3.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o0, o1, o2)
  }
}
extension PathZip4_OOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_OOOV<P0, P1, P2, P3> {
    PathZip4_OOOV(p0, p1, p2, p3)
  }
}
public struct PathZip4_OOVO<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P2.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o0, o1, o3)
  }
}
extension PathZip4_OOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_OOVO<P0, P1, P2, P3> {
    PathZip4_OOVO(p0, p1, p2, p3)
  }
}
public struct PathZip4_OOVV<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o0, o1)
  }
}
extension PathZip4_OOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_OOVV<P0, P1, P2, P3> {
    PathZip4_OOVV(p0, p1, p2, p3)
  }
}
public struct PathZip4_OVOO<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P1.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o0, o2, o3)
  }
}
extension PathZip4_OVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_OVOO<P0, P1, P2, P3> {
    PathZip4_OVOO(p0, p1, p2, p3)
  }
}
public struct PathZip4_OVOV<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o0, o2)
  }
}
extension PathZip4_OVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P1.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_OVOV<P0, P1, P2, P3> {
    PathZip4_OVOV(p0, p1, p2, p3)
  }
}
public struct PathZip4_OVVO<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o0, o3)
  }
}
extension PathZip4_OVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_OVVO<P0, P1, P2, P3> {
    PathZip4_OVVO(p0, p1, p2, p3)
  }
}
public struct PathZip4_OVVV<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o0)
  }
}
extension PathZip4_OVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_OVVV<P0, P1, P2, P3> {
    PathZip4_OVVV(p0, p1, p2, p3)
  }
}
public struct PathZip4_VOOO<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P0.Output == Void
{
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o1, o2, o3)
  }
}
extension PathZip4_VOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_VOOO<P0, P1, P2, P3> {
    PathZip4_VOOO(p0, p1, p2, p3)
  }
}
public struct PathZip4_VOOV<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o1, o2)
  }
}
extension PathZip4_VOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_VOOV<P0, P1, P2, P3> {
    PathZip4_VOOV(p0, p1, p2, p3)
  }
}
public struct PathZip4_VOVO<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o1, o3)
  }
}
extension PathZip4_VOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_VOVO<P0, P1, P2, P3> {
    PathZip4_VOVO(p0, p1, p2, p3)
  }
}
public struct PathZip4_VOVV<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o1)
  }
}
extension PathZip4_VOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output),
      let i2 = p2.print(()),
      let i3 = p3.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_VOVV<P0, P1, P2, P3> {
    PathZip4_VOVV(p0, p1, p2, p3)
  }
}
public struct PathZip4_VVOO<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o2, o3)
  }
}
extension PathZip4_VVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Output == Void,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_VVOO<P0, P1, P2, P3> {
    PathZip4_VVOO(p0, p1, p2, p3)
  }
}
public struct PathZip4_VVOV<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o2)
  }
}
extension PathZip4_VVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Output == Void,
  P1.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output),
      let i3 = p3.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_VVOV<P0, P1, P2, P3> {
    PathZip4_VVOV(p0, p1, p2, p3)
  }
}
public struct PathZip4_VVVO<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P3.Output
  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return (o3)
  }
}
extension PathZip4_VVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output)
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_VVVO<P0, P1, P2, P3> {
    PathZip4_VVVO(p0, p1, p2, p3)
  }
}
public struct PathZip4_VVVV<P0, P1, P2, P3>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (

  )? {
    guard
      input.path.count >= 4,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty
    else { return nil }
    input.path.removeFirst(4)
    return ()
  }
}
extension PathZip4_VVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (

    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZip4_VVVV<P0, P1, P2, P3> {
    PathZip4_VVVV(p0, p1, p2, p3)
  }
}
public struct PathZip5_OOOOO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring
{
  @usableFromInline let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4
  @inlinable init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o1, o2, o3, o4)
  }
}
extension PathZip5_OOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(output.4)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OOOOO<P0, P1, P2, P3, P4> {
    PathZip5_OOOOO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OOOOV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o1, o2, o3)
  }
}
extension PathZip5_OOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OOOOV<P0, P1, P2, P3, P4> {
    PathZip5_OOOOV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OOOVO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o1, o2, o4)
  }
}
extension PathZip5_OOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OOOVO<P0, P1, P2, P3, P4> {
    PathZip5_OOOVO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OOOVV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o1, o2)
  }
}
extension PathZip5_OOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OOOVV<P0, P1, P2, P3, P4> {
    PathZip5_OOOVV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OOVOO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o1, o3, o4)
  }
}
extension PathZip5_OOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P3.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OOVOO<P0, P1, P2, P3, P4> {
    PathZip5_OOVOO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OOVOV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o1, o3)
  }
}
extension PathZip5_OOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P2.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OOVOV<P0, P1, P2, P3, P4> {
    PathZip5_OOVOV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OOVVO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o1, o4)
  }
}
extension PathZip5_OOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OOVVO<P0, P1, P2, P3, P4> {
    PathZip5_OOVVO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OOVVV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o1)
  }
}
extension PathZip5_OOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P2.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OOVVV<P0, P1, P2, P3, P4> {
    PathZip5_OOVVV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OVOOO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o2, o3, o4)
  }
}
extension PathZip5_OVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OVOOO<P0, P1, P2, P3, P4> {
    PathZip5_OVOOO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OVOOV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o2, o3)
  }
}
extension PathZip5_OVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P1.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OVOOV<P0, P1, P2, P3, P4> {
    PathZip5_OVOOV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OVOVO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o2, o4)
  }
}
extension PathZip5_OVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P1.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OVOVO<P0, P1, P2, P3, P4> {
    PathZip5_OVOVO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OVOVV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o2)
  }
}
extension PathZip5_OVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P1.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OVOVV<P0, P1, P2, P3, P4> {
    PathZip5_OVOVV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OVVOO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o3, o4)
  }
}
extension PathZip5_OVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P3.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OVVOO<P0, P1, P2, P3, P4> {
    PathZip5_OVVOO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OVVOV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o3)
  }
}
extension PathZip5_OVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P1.Output == Void,
  P2.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OVVOV<P0, P1, P2, P3, P4> {
    PathZip5_OVVOV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OVVVO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0, o4)
  }
}
extension PathZip5_OVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OVVVO<P0, P1, P2, P3, P4> {
    PathZip5_OVVVO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_OVVVV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o0)
  }
}
extension PathZip5_OVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_OVVVV<P0, P1, P2, P3, P4> {
    PathZip5_OVVVV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VOOOO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o1, o2, o3, o4)
  }
}
extension PathZip5_VOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VOOOO<P0, P1, P2, P3, P4> {
    PathZip5_VOOOO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VOOOV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o1, o2, o3)
  }
}
extension PathZip5_VOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VOOOV<P0, P1, P2, P3, P4> {
    PathZip5_VOOOV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VOOVO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o1, o2, o4)
  }
}
extension PathZip5_VOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VOOVO<P0, P1, P2, P3, P4> {
    PathZip5_VOOVO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VOOVV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o1, o2)
  }
}
extension PathZip5_VOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VOOVV<P0, P1, P2, P3, P4> {
    PathZip5_VOOVV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VOVOO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o1, o3, o4)
  }
}
extension PathZip5_VOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P3.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VOVOO<P0, P1, P2, P3, P4> {
    PathZip5_VOVOO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VOVOV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o1, o3)
  }
}
extension PathZip5_VOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P2.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VOVOV<P0, P1, P2, P3, P4> {
    PathZip5_VOVOV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VOVVO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o1, o4)
  }
}
extension PathZip5_VOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VOVVO<P0, P1, P2, P3, P4> {
    PathZip5_VOVVO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VOVVV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o1)
  }
}
extension PathZip5_VOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P2.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VOVVV<P0, P1, P2, P3, P4> {
    PathZip5_VOVVV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VVOOO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o2, o3, o4)
  }
}
extension PathZip5_VVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P3.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VVOOO<P0, P1, P2, P3, P4> {
    PathZip5_VVOOO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VVOOV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o2, o3)
  }
}
extension PathZip5_VVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P1.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VVOOV<P0, P1, P2, P3, P4> {
    PathZip5_VVOOV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VVOVO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o2, o4)
  }
}
extension PathZip5_VVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P1.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VVOVO<P0, P1, P2, P3, P4> {
    PathZip5_VVOVO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VVOVV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o2)
  }
}
extension PathZip5_VVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P1.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P2.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VVOVV<P0, P1, P2, P3, P4> {
    PathZip5_VVOVV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VVVOO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o3, o4)
  }
}
extension PathZip5_VVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void
{
  @inlinable public func print(
    _ output: (
      P3.Output,
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.0),
      let i4 = p4.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VVVOO<P0, P1, P2, P3, P4> {
    PathZip5_VVVOO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VVVOV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P3.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o3)
  }
}
extension PathZip5_VVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (
      P3.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VVVOV<P0, P1, P2, P3, P4> {
    PathZip5_VVVOV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VVVVO<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P4.Output
  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return (o4)
  }
}
extension PathZip5_VVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void
{
  @inlinable public func print(
    _ output: (
      P4.Output
    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VVVVO<P0, P1, P2, P3, P4> {
    PathZip5_VVVVO(p0, p1, p2, p3, p4)
  }
}
public struct PathZip5_VVVVV<P0, P1, P2, P3, P4>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (

  )? {
    guard
      input.path.count >= 5,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty
    else { return nil }
    input.path.removeFirst(5)
    return ()
  }
}
extension PathZip5_VVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Output == Void,
  P1.Output == Void,
  P2.Output == Void,
  P3.Output == Void,
  P4.Output == Void
{
  @inlinable public func print(
    _ output: (

    )
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZip5_VVVVV<P0, P1, P2, P3, P4> {
    PathZip5_VVVVV(p0, p1, p2, p3, p4)
  }
}
public struct PathZip6_OOOOOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o2, o3, o4, o5)
  }
}
extension PathZip6_OOOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(output.4),
      let i5 = p5.print(output.5)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOOOOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOOOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOOOOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o2, o3, o4)
  }
}
extension PathZip6_OOOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(output.4),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOOOOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOOOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOOOVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o2, o3, o5)
  }
}
extension PathZip6_OOOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(()),
      let i5 = p5.print(output.4)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOOOVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOOOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOOOVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o2, o3)
  }
}
extension PathZip6_OOOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(output.3),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOOOVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOOOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOOVOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o2, o4, o5)
  }
}
extension PathZip6_OOOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(output.3),
      let i5 = p5.print(output.4)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOOVOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOOVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOOVOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o2, o4)
  }
}
extension PathZip6_OOOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(output.3),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOOVOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOOVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOOVVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o2, o5)
  }
}
extension PathZip6_OOOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOOVVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOOVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOOVVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o2)
  }
}
extension PathZip6_OOOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(output.2),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOOVVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOOVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOVOOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P3.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o3, o4, o5)
  }
}
extension PathZip6_OOVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(output.4)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOVOOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOVOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOVOOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o3, o4)
  }
}
extension PathZip6_OOVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOVOOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOVOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOVOVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P3.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o3, o5)
  }
}
extension PathZip6_OOVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOVOVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOVOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOVOVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o3)
  }
}
extension PathZip6_OOVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOVOVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOVOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOVVOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o4, o5)
  }
}
extension PathZip6_OOVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOVVOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOVVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOVVOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o4)
  }
}
extension PathZip6_OOVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOVVOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOVVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOVVVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1, o5)
  }
}
extension PathZip6_OOVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOVVVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOVVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OOVVVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P1.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o1)
  }
}
extension PathZip6_OOVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(output.1),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OOVVVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OOVVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVOOOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output,
    P3.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o2, o3, o4, o5)
  }
}
extension PathZip6_OVOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(output.4)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVOOOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVOOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVOOOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o2, o3, o4)
  }
}
extension PathZip6_OVOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVOOOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVOOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVOOVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output,
    P3.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o2, o3, o5)
  }
}
extension PathZip6_OVOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVOOVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVOOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVOOVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o2, o3)
  }
}
extension PathZip6_OVOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVOOVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVOOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVOVOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o2, o4, o5)
  }
}
extension PathZip6_OVOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVOVOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVOVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVOVOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o2, o4)
  }
}
extension PathZip6_OVOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVOVOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVOVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVOVVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o2, o5)
  }
}
extension PathZip6_OVOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVOVVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVOVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVOVVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o2)
  }
}
extension PathZip6_OVOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVOVVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVOVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVVOOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P3.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o3, o4, o5)
  }
}
extension PathZip6_OVVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVVOOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVVOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVVOOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o3, o4)
  }
}
extension PathZip6_OVVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVVOOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVVOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVVOVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P3.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o3, o5)
  }
}
extension PathZip6_OVVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVVOVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVVOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVVOVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o3)
  }
}
extension PathZip6_OVVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVVOVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVVOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVVVOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o4, o5)
  }
}
extension PathZip6_OVVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVVVOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVVVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVVVOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o4)
  }
}
extension PathZip6_OVVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVVVOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVVVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVVVVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0, o5)
  }
}
extension PathZip6_OVVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output.0),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVVVVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVVVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_OVVVVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P0.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let o0 = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o0)
  }
}
extension PathZip6_OVVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(output),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_OVVVVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_OVVVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOOOOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o2, o3, o4, o5)
  }
}
extension PathZip6_VOOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(output.4)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOOOOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOOOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOOOOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o2, o3, o4)
  }
}
extension PathZip6_VOOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(output.3),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOOOOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOOOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOOOVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output,
    P3.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o2, o3, o5)
  }
}
extension PathZip6_VOOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOOOVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOOOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOOOVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o2, o3)
  }
}
extension PathZip6_VOOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(output.2),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOOOVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOOOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOOVOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o2, o4, o5)
  }
}
extension PathZip6_VOOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOOVOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOOVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOOVOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o2, o4)
  }
}
extension PathZip6_VOOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOOVOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOOVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOOVVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o2, o5)
  }
}
extension PathZip6_VOOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOOVVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOOVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOOVVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P2.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o2)
  }
}
extension PathZip6_VOOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(output.1),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOOVVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOOVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOVOOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P3.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o3, o4, o5)
  }
}
extension PathZip6_VOVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOVOOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOVOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOVOOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o3, o4)
  }
}
extension PathZip6_VOVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOVOOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOVOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOVOVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P3.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o3, o5)
  }
}
extension PathZip6_VOVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOVOVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOVOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOVOVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o3)
  }
}
extension PathZip6_VOVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOVOVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOVOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOVVOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o4, o5)
  }
}
extension PathZip6_VOVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOVVOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOVVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOVVOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o4)
  }
}
extension PathZip6_VOVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOVVOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOVVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOVVVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1, o5)
  }
}
extension PathZip6_VOVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output.0),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOVVVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOVVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VOVVVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P1.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let o1 = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o1)
  }
}
extension PathZip6_VOVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(output),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VOVVVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VOVVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVOOOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output,
    P3.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o2, o3, o4, o5)
  }
}
extension PathZip6_VVOOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(output.3)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVOOOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVOOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVOOOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output,
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o2, o3, o4)
  }
}
extension PathZip6_VVOOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(output.2),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVOOOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVOOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVOOVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output,
    P3.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o2, o3, o5)
  }
}
extension PathZip6_VVOOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVOOVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVOOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVOOVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output,
    P3.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o2, o3)
  }
}
extension PathZip6_VVOOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(output.1),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVOOVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVOOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVOVOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o2, o4, o5)
  }
}
extension PathZip6_VVOVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVOVOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVOVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVOVOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o2, o4)
  }
}
extension PathZip6_VVOVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(()),
      let i4 = p4.print(output.1),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVOVOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVOVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVOVVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o2, o5)
  }
}
extension PathZip6_VVOVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output.0),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVOVVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVOVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVOVVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P2.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let o2 = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o2)
  }
}
extension PathZip6_VVOVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(output),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVOVVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVOVVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVVOOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P3.Output,
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o3, o4, o5)
  }
}
extension PathZip6_VVVOOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.0),
      let i4 = p4.print(output.1),
      let i5 = p5.print(output.2)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVVOOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVVOOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVVOOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P3.Output,
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o3, o4)
  }
}
extension PathZip6_VVVOOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.0),
      let i4 = p4.print(output.1),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVVOOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVVOOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVVOVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P3.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o3, o5)
  }
}
extension PathZip6_VVVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output.0),
      let i4 = p4.print(()),
      let i5 = p5.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVVOVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVVOVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVVOVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P3.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let o3 = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o3)
  }
}
extension PathZip6_VVVOVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(output),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVVOVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVVOVV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVVVOO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P4.Output,
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o4, o5)
  }
}
extension PathZip6_VVVVOO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output.0),
      let i5 = p5.print(output.1)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVVVOO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVVVOO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVVVOV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P4.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let o4 = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o4)
  }
}
extension PathZip6_VVVVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(output),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVVVOV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVVVOV(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVVVVO<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (
    P5.Output
  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let o5 = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return (o5)
  }
}
extension PathZip6_VVVVVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(output)
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVVVVO<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVVVVO(p0, p1, p2, p3, p4, p5)
  }
}
public struct PathZip6_VVVVVV<P0, P1, P2, P3, P4, P5>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P3: Parser,
  P4: Parser,
  P5: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P3.Input == Substring,
  P4.Input == Substring,
  P5.Input == Substring,
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
  @inlinable public func parse(_ input: inout URLRequestData) -> (

  )? {
    guard
      input.path.count >= 6,
      case var c0 = input.path[input.path.startIndex], let _ = p0.parse(&c0), c0.isEmpty,
      case var c1 = input.path[input.path.startIndex + 1], let _ = p1.parse(&c1), c1.isEmpty,
      case var c2 = input.path[input.path.startIndex + 2], let _ = p2.parse(&c2), c2.isEmpty,
      case var c3 = input.path[input.path.startIndex + 3], let _ = p3.parse(&c3), c3.isEmpty,
      case var c4 = input.path[input.path.startIndex + 4], let _ = p4.parse(&c4), c4.isEmpty,
      case var c5 = input.path[input.path.startIndex + 5], let _ = p5.parse(&c5), c5.isEmpty
    else { return nil }
    input.path.removeFirst(6)
    return ()
  }
}
extension PathZip6_VVVVVV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P5: Printer,
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
  ) -> URLRequestData? {
    guard
      let i0 = p0.print(()),
      let i1 = p1.print(()),
      let i2 = p2.print(()),
      let i3 = p3.print(()),
      let i4 = p4.print(()),
      let i5 = p5.print(())
    else { return nil }
    return .init(path: [i0, i1, i2, i3, i4, i5])
  }
}
extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZip6_VVVVVV<P0, P1, P2, P3, P4, P5> {
    PathZip6_VVVVVV(p0, p1, p2, p3, p4, p5)
  }
}

// END AUTO-GENERATED CONTENT