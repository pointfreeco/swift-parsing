// BEGIN AUTO-GENERATED CONTENT

public struct PathZipOO<P0, P1>: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == Substring,
  P1.Input == Substring
{
  public let p0: P0, p1: P1

  @inlinable public init(_ p0: P0, _ p1: P1) {
    self.p0 = p0
    self.p1 = p1
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output
  ) {
    guard input.path.count >= 2 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1)
  }
}

extension PathZipOO: Printer
where
  P0: Printer,
  P1: Printer
{
  @inlinable public func print(
    _ output: (
      P0.Output,
      P1.Output
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> PathZipOO<P0, P1> {
    PathZipOO(p0, p1)
  }
}

public struct PathZipOV<P0, P1>: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P1.Output == Void
{
  public let p0: P0, p1: P1

  @inlinable public init(_ p0: P0, _ p1: P1) {
    self.p0 = p0
    self.p1 = p1
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output
  ) {
    guard input.path.count >= 2 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    return (o0)
  }
}

extension PathZipOV: Printer
where
  P0: Printer,
  P1: Printer,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (
      P0.Output
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> PathZipOV<P0, P1> {
    PathZipOV(p0, p1)
  }
}

public struct PathZipVO<P0, P1>: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P0.Output == Void
{
  public let p0: P0, p1: P1

  @inlinable public init(_ p0: P0, _ p1: P1) {
    self.p0 = p0
    self.p1 = p1
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output
  ) {
    guard input.path.count >= 2 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    return (o1)
  }
}

extension PathZipVO: Printer
where
  P0: Printer,
  P1: Printer,
  P0.Output == Void
{
  @inlinable public func print(
    _ output: (
      P1.Output
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p1.print(output))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> PathZipVO<P0, P1> {
    PathZipVO(p0, p1)
  }
}

public struct PathZipVV<P0, P1>: Parser
where
  P0: Parser,
  P1: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P0.Output == Void,
  P1.Output == Void
{
  public let p0: P0, p1: P1

  @inlinable public init(_ p0: P0, _ p1: P1) {
    self.p0 = p0
    self.p1 = p1
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws {
    guard input.path.count >= 2 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    return ()
  }
}

extension PathZipVV: Printer
where
  P0: Printer,
  P1: Printer,
  P0.Output == Void,
  P1.Output == Void
{
  @inlinable public func print(
    _ output: (

    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1>(
    _ p0: P0, _ p1: P1
  ) -> PathZipVV<P0, P1> {
    PathZipVV(p0, p1)
  }
}

public struct PathZipOOO<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring
{
  public let p0: P0, p1: P1, p2: P2

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output
  ) {
    guard input.path.count >= 3 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2)
  }
}

extension PathZipOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZipOOO<P0, P1, P2> {
    PathZipOOO(p0, p1, p2)
  }
}

public struct PathZipOOV<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P2.Output == Void
{
  public let p0: P0, p1: P1, p2: P2

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output
  ) {
    guard input.path.count >= 3 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1)
  }
}

extension PathZipOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZipOOV<P0, P1, P2> {
    PathZipOOV(p0, p1, p2)
  }
}

public struct PathZipOVO<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P1.Output == Void
{
  public let p0: P0, p1: P1, p2: P2

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output
  ) {
    guard input.path.count >= 3 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2)
  }
}

extension PathZipOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZipOVO<P0, P1, P2> {
    PathZipOVO(p0, p1, p2)
  }
}

public struct PathZipOVV<P0, P1, P2>: Parser
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
  public let p0: P0, p1: P1, p2: P2

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output
  ) {
    guard input.path.count >= 3 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    return (o0)
  }
}

extension PathZipOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZipOVV<P0, P1, P2> {
    PathZipOVV(p0, p1, p2)
  }
}

public struct PathZipVOO<P0, P1, P2>: Parser
where
  P0: Parser,
  P1: Parser,
  P2: Parser,
  P0.Input == Substring,
  P1.Input == Substring,
  P2.Input == Substring,
  P0.Output == Void
{
  public let p0: P0, p1: P1, p2: P2

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output
  ) {
    guard input.path.count >= 3 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2)
  }
}

extension PathZipVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZipVOO<P0, P1, P2> {
    PathZipVOO(p0, p1, p2)
  }
}

public struct PathZipVOV<P0, P1, P2>: Parser
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
  public let p0: P0, p1: P1, p2: P2

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output
  ) {
    guard input.path.count >= 3 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    return (o1)
  }
}

extension PathZipVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZipVOV<P0, P1, P2> {
    PathZipVOV(p0, p1, p2)
  }
}

public struct PathZipVVO<P0, P1, P2>: Parser
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
  public let p0: P0, p1: P1, p2: P2

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output
  ) {
    guard input.path.count >= 3 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    return (o2)
  }
}

extension PathZipVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p2.print(output))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZipVVO<P0, P1, P2> {
    PathZipVVO(p0, p1, p2)
  }
}

public struct PathZipVVV<P0, P1, P2>: Parser
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
  public let p0: P0, p1: P1, p2: P2

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws {
    guard input.path.count >= 3 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    return ()
  }
}

extension PathZipVVV: Printer
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

    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> PathZipVVV<P0, P1, P2> {
    PathZipVVV(p0, p1, p2)
  }
}

public struct PathZipOOOO<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2, o3)
  }
}

extension PathZipOOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print(output.3))
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipOOOO<P0, P1, P2, P3> {
    PathZipOOOO(p0, p1, p2, p3)
  }
}

public struct PathZipOOOV<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2)
  }
}

extension PathZipOOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipOOOV<P0, P1, P2, P3> {
    PathZipOOOV(p0, p1, p2, p3)
  }
}

public struct PathZipOOVO<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P3.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o3)
  }
}

extension PathZipOOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipOOVO<P0, P1, P2, P3> {
    PathZipOOVO(p0, p1, p2, p3)
  }
}

public struct PathZipOOVV<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1)
  }
}

extension PathZipOOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipOOVV<P0, P1, P2, P3> {
    PathZipOOVV(p0, p1, p2, p3)
  }
}

public struct PathZipOVOO<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2, o3)
  }
}

extension PathZipOVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipOVOO<P0, P1, P2, P3> {
    PathZipOVOO(p0, p1, p2, p3)
  }
}

public struct PathZipOVOV<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2)
  }
}

extension PathZipOVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipOVOV<P0, P1, P2, P3> {
    PathZipOVOV(p0, p1, p2, p3)
  }
}

public struct PathZipOVVO<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P3.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o0, o3)
  }
}

extension PathZipOVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipOVVO<P0, P1, P2, P3> {
    PathZipOVVO(p0, p1, p2, p3)
  }
}

public struct PathZipOVVV<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o0)
  }
}

extension PathZipOVVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipOVVV<P0, P1, P2, P3> {
    PathZipOVVV(p0, p1, p2, p3)
  }
}

public struct PathZipVOOO<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2, o3)
  }
}

extension PathZipVOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipVOOO<P0, P1, P2, P3> {
    PathZipVOOO(p0, p1, p2, p3)
  }
}

public struct PathZipVOOV<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2)
  }
}

extension PathZipVOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipVOOV<P0, P1, P2, P3> {
    PathZipVOOV(p0, p1, p2, p3)
  }
}

public struct PathZipVOVO<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P3.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o1, o3)
  }
}

extension PathZipVOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipVOVO<P0, P1, P2, P3> {
    PathZipVOVO(p0, p1, p2, p3)
  }
}

public struct PathZipVOVV<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o1)
  }
}

extension PathZipVOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipVOVV<P0, P1, P2, P3> {
    PathZipVOVV(p0, p1, p2, p3)
  }
}

public struct PathZipVVOO<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o2, o3)
  }
}

extension PathZipVVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print(output.0))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipVVOO<P0, P1, P2, P3> {
    PathZipVVOO(p0, p1, p2, p3)
  }
}

public struct PathZipVVOV<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o2)
  }
}

extension PathZipVVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipVVOV<P0, P1, P2, P3> {
    PathZipVVOV(p0, p1, p2, p3)
  }
}

public struct PathZipVVVO<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P3.Output
  ) {
    guard input.path.count >= 4 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return (o3)
  }
}

extension PathZipVVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print(output))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipVVVO<P0, P1, P2, P3> {
    PathZipVVVO(p0, p1, p2, p3)
  }
}

public struct PathZipVVVV<P0, P1, P2, P3>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws {
    guard input.path.count >= 4 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    return ()
  }
}

extension PathZipVVVV: Printer
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

    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3
  ) -> PathZipVVVV<P0, P1, P2, P3> {
    PathZipVVVV(p0, p1, p2, p3)
  }
}

public struct PathZipOOOOO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2, o3, o4)
  }
}

extension PathZipOOOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.4))
    input.path.prepend(try p3.print(output.3))
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOOOOO<P0, P1, P2, P3, P4> {
    PathZipOOOOO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOOOOV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2, o3)
  }
}

extension PathZipOOOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.3))
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOOOOV<P0, P1, P2, P3, P4> {
    PathZipOOOOV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOOOVO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2, o4)
  }
}

extension PathZipOOOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOOOVO<P0, P1, P2, P3, P4> {
    PathZipOOOVO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOOOVV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2)
  }
}

extension PathZipOOOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOOOVV<P0, P1, P2, P3, P4> {
    PathZipOOOVV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOOVOO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o3, o4)
  }
}

extension PathZipOOVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOOVOO<P0, P1, P2, P3, P4> {
    PathZipOOVOO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOOVOV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P3.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o3)
  }
}

extension PathZipOOVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOOVOV<P0, P1, P2, P3, P4> {
    PathZipOOVOV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOOVVO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o4)
  }
}

extension PathZipOOVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOOVVO<P0, P1, P2, P3, P4> {
    PathZipOOVVO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOOVVV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1)
  }
}

extension PathZipOOVVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOOVVV<P0, P1, P2, P3, P4> {
    PathZipOOVVV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOVOOO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2, o3, o4)
  }
}

extension PathZipOVOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOVOOO<P0, P1, P2, P3, P4> {
    PathZipOVOOO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOVOOV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2, o3)
  }
}

extension PathZipOVOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOVOOV<P0, P1, P2, P3, P4> {
    PathZipOVOOV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOVOVO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2, o4)
  }
}

extension PathZipOVOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOVOVO<P0, P1, P2, P3, P4> {
    PathZipOVOVO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOVOVV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2)
  }
}

extension PathZipOVOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOVOVV<P0, P1, P2, P3, P4> {
    PathZipOVOVV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOVVOO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o3, o4)
  }
}

extension PathZipOVVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOVVOO<P0, P1, P2, P3, P4> {
    PathZipOVVOO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOVVOV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P3.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o3)
  }
}

extension PathZipOVVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOVVOV<P0, P1, P2, P3, P4> {
    PathZipOVVOV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOVVVO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0, o4)
  }
}

extension PathZipOVVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOVVVO<P0, P1, P2, P3, P4> {
    PathZipOVVVO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOVVVV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o0)
  }
}

extension PathZipOVVVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipOVVVV<P0, P1, P2, P3, P4> {
    PathZipOVVVV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVOOOO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2, o3, o4)
  }
}

extension PathZipVOOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVOOOO<P0, P1, P2, P3, P4> {
    PathZipVOOOO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVOOOV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2, o3)
  }
}

extension PathZipVOOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVOOOV<P0, P1, P2, P3, P4> {
    PathZipVOOOV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVOOVO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2, o4)
  }
}

extension PathZipVOOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVOOVO<P0, P1, P2, P3, P4> {
    PathZipVOOVO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVOOVV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2)
  }
}

extension PathZipVOOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVOOVV<P0, P1, P2, P3, P4> {
    PathZipVOOVV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVOVOO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o1, o3, o4)
  }
}

extension PathZipVOVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVOVOO<P0, P1, P2, P3, P4> {
    PathZipVOVOO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVOVOV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P3.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o1, o3)
  }
}

extension PathZipVOVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVOVOV<P0, P1, P2, P3, P4> {
    PathZipVOVOV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVOVVO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o1, o4)
  }
}

extension PathZipVOVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVOVVO<P0, P1, P2, P3, P4> {
    PathZipVOVVO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVOVVV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o1)
  }
}

extension PathZipVOVVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVOVVV<P0, P1, P2, P3, P4> {
    PathZipVOVVV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVVOOO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o2, o3, o4)
  }
}

extension PathZipVVOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print(output.0))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVVOOO<P0, P1, P2, P3, P4> {
    PathZipVVOOO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVVOOV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o2, o3)
  }
}

extension PathZipVVOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print(output.0))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVVOOV<P0, P1, P2, P3, P4> {
    PathZipVVOOV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVVOVO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o2, o4)
  }
}

extension PathZipVVOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.0))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVVOVO<P0, P1, P2, P3, P4> {
    PathZipVVOVO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVVOVV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o2)
  }
}

extension PathZipVVOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVVOVV<P0, P1, P2, P3, P4> {
    PathZipVVOVV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVVVOO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o3, o4)
  }
}

extension PathZipVVVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print(output.0))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVVVOO<P0, P1, P2, P3, P4> {
    PathZipVVVOO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVVVOV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P3.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o3)
  }
}

extension PathZipVVVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVVVOV<P0, P1, P2, P3, P4> {
    PathZipVVVOV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVVVVO<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P4.Output
  ) {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return (o4)
  }
}

extension PathZipVVVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print(output))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVVVVO<P0, P1, P2, P3, P4> {
    PathZipVVVVO(p0, p1, p2, p3, p4)
  }
}

public struct PathZipVVVVV<P0, P1, P2, P3, P4>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws {
    guard input.path.count >= 5 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    return ()
  }
}

extension PathZipVVVVV: Printer
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

    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4
  ) -> PathZipVVVVV<P0, P1, P2, P3, P4> {
    PathZipVVVVV(p0, p1, p2, p3, p4)
  }
}

public struct PathZipOOOOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2, o3, o4, o5)
  }
}

extension PathZipOOOOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.5))
    input.path.prepend(try p4.print(output.4))
    input.path.prepend(try p3.print(output.3))
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOOOOO<P0, P1, P2, P3, P4, P5> {
    PathZipOOOOOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOOOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2, o3, o4)
  }
}

extension PathZipOOOOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.4))
    input.path.prepend(try p3.print(output.3))
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOOOOV<P0, P1, P2, P3, P4, P5> {
    PathZipOOOOOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOOOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2, o3, o5)
  }
}

extension PathZipOOOOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.4))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.3))
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOOOVO<P0, P1, P2, P3, P4, P5> {
    PathZipOOOOVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOOOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2, o3)
  }
}

extension PathZipOOOOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.3))
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOOOVV<P0, P1, P2, P3, P4, P5> {
    PathZipOOOOVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOOVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2, o4, o5)
  }
}

extension PathZipOOOVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.4))
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOOVOO<P0, P1, P2, P3, P4, P5> {
    PathZipOOOVOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOOVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2, o4)
  }
}

extension PathZipOOOVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOOVOV<P0, P1, P2, P3, P4, P5> {
    PathZipOOOVOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOOVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2, o5)
  }
}

extension PathZipOOOVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.3))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOOVVO<P0, P1, P2, P3, P4, P5> {
    PathZipOOOVVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOOVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P2.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o2)
  }
}

extension PathZipOOOVVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.2))
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOOVVV<P0, P1, P2, P3, P4, P5> {
    PathZipOOOVVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOVOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P3.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o3, o4, o5)
  }
}

extension PathZipOOVOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.4))
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOVOOO<P0, P1, P2, P3, P4, P5> {
    PathZipOOVOOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOVOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o3, o4)
  }
}

extension PathZipOOVOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOVOOV<P0, P1, P2, P3, P4, P5> {
    PathZipOOVOOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOVOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P3.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o3, o5)
  }
}

extension PathZipOOVOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.3))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOVOVO<P0, P1, P2, P3, P4, P5> {
    PathZipOOVOVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOVOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P3.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o3)
  }
}

extension PathZipOOVOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOVOVV<P0, P1, P2, P3, P4, P5> {
    PathZipOOVOVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOVVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o4, o5)
  }
}

extension PathZipOOVVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.3))
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOVVOO<P0, P1, P2, P3, P4, P5> {
    PathZipOOVVOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOVVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o4)
  }
}

extension PathZipOOVVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOVVOV<P0, P1, P2, P3, P4, P5> {
    PathZipOOVVOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOVVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1, o5)
  }
}

extension PathZipOOVVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.2))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOVVVO<P0, P1, P2, P3, P4, P5> {
    PathZipOOVVVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOOVVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P1.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o1)
  }
}

extension PathZipOOVVVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.1))
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOOVVVV<P0, P1, P2, P3, P4, P5> {
    PathZipOOVVVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVOOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output,
    P3.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2, o3, o4, o5)
  }
}

extension PathZipOVOOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.4))
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVOOOO<P0, P1, P2, P3, P4, P5> {
    PathZipOVOOOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVOOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2, o3, o4)
  }
}

extension PathZipOVOOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVOOOV<P0, P1, P2, P3, P4, P5> {
    PathZipOVOOOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVOOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output,
    P3.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2, o3, o5)
  }
}

extension PathZipOVOOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.3))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVOOVO<P0, P1, P2, P3, P4, P5> {
    PathZipOVOOVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVOOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2, o3)
  }
}

extension PathZipOVOOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVOOVV<P0, P1, P2, P3, P4, P5> {
    PathZipOVOOVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVOVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2, o4, o5)
  }
}

extension PathZipOVOVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.3))
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVOVOO<P0, P1, P2, P3, P4, P5> {
    PathZipOVOVOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVOVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2, o4)
  }
}

extension PathZipOVOVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVOVOV<P0, P1, P2, P3, P4, P5> {
    PathZipOVOVOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVOVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2, o5)
  }
}

extension PathZipOVOVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.2))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVOVVO<P0, P1, P2, P3, P4, P5> {
    PathZipOVOVVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVOVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P2.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o2)
  }
}

extension PathZipOVOVVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVOVVV<P0, P1, P2, P3, P4, P5> {
    PathZipOVOVVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVVOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P3.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o3, o4, o5)
  }
}

extension PathZipOVVOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.3))
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVVOOO<P0, P1, P2, P3, P4, P5> {
    PathZipOVVOOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVVOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o3, o4)
  }
}

extension PathZipOVVOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVVOOV<P0, P1, P2, P3, P4, P5> {
    PathZipOVVOOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVVOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P3.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o3, o5)
  }
}

extension PathZipOVVOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.2))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVVOVO<P0, P1, P2, P3, P4, P5> {
    PathZipOVVOVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVVOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P3.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o3)
  }
}

extension PathZipOVVOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVVOVV<P0, P1, P2, P3, P4, P5> {
    PathZipOVVOVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVVVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o4, o5)
  }
}

extension PathZipOVVVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.2))
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVVVOO<P0, P1, P2, P3, P4, P5> {
    PathZipOVVVOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVVVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o4)
  }
}

extension PathZipOVVVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVVVOV<P0, P1, P2, P3, P4, P5> {
    PathZipOVVVOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVVVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0, o5)
  }
}

extension PathZipOVVVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.1))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output.0))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVVVVO<P0, P1, P2, P3, P4, P5> {
    PathZipOVVVVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipOVVVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P0.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    let o0 = try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o0)
  }
}

extension PathZipOVVVVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print(output))
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipOVVVVV<P0, P1, P2, P3, P4, P5> {
    PathZipOVVVVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOOOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2, o3, o4, o5)
  }
}

extension PathZipVOOOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.4))
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOOOOO<P0, P1, P2, P3, P4, P5> {
    PathZipVOOOOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOOOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2, o3, o4)
  }
}

extension PathZipVOOOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.3))
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOOOOV<P0, P1, P2, P3, P4, P5> {
    PathZipVOOOOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOOOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output,
    P3.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2, o3, o5)
  }
}

extension PathZipVOOOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.3))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOOOVO<P0, P1, P2, P3, P4, P5> {
    PathZipVOOOVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOOOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2, o3)
  }
}

extension PathZipVOOOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.2))
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOOOVV<P0, P1, P2, P3, P4, P5> {
    PathZipVOOOVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOOVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2, o4, o5)
  }
}

extension PathZipVOOVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.3))
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOOVOO<P0, P1, P2, P3, P4, P5> {
    PathZipVOOVOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOOVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2, o4)
  }
}

extension PathZipVOOVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOOVOV<P0, P1, P2, P3, P4, P5> {
    PathZipVOOVOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOOVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2, o5)
  }
}

extension PathZipVOOVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.2))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOOVVO<P0, P1, P2, P3, P4, P5> {
    PathZipVOOVVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOOVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P2.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o2)
  }
}

extension PathZipVOOVVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.1))
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOOVVV<P0, P1, P2, P3, P4, P5> {
    PathZipVOOVVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOVOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P3.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o3, o4, o5)
  }
}

extension PathZipVOVOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.3))
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOVOOO<P0, P1, P2, P3, P4, P5> {
    PathZipVOVOOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOVOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o3, o4)
  }
}

extension PathZipVOVOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOVOOV<P0, P1, P2, P3, P4, P5> {
    PathZipVOVOOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOVOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P3.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o3, o5)
  }
}

extension PathZipVOVOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.2))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOVOVO<P0, P1, P2, P3, P4, P5> {
    PathZipVOVOVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOVOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P3.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o3)
  }
}

extension PathZipVOVOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOVOVV<P0, P1, P2, P3, P4, P5> {
    PathZipVOVOVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOVVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o4, o5)
  }
}

extension PathZipVOVVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.2))
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOVVOO<P0, P1, P2, P3, P4, P5> {
    PathZipVOVVOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOVVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o4)
  }
}

extension PathZipVOVVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOVVOV<P0, P1, P2, P3, P4, P5> {
    PathZipVOVVOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOVVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1, o5)
  }
}

extension PathZipVOVVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.1))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output.0))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOVVVO<P0, P1, P2, P3, P4, P5> {
    PathZipVOVVVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVOVVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P1.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    let o1 = try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o1)
  }
}

extension PathZipVOVVVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print(output))
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVOVVVV<P0, P1, P2, P3, P4, P5> {
    PathZipVOVVVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVOOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output,
    P3.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o2, o3, o4, o5)
  }
}

extension PathZipVVOOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.3))
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print(output.0))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVOOOO<P0, P1, P2, P3, P4, P5> {
    PathZipVVOOOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVOOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output,
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o2, o3, o4)
  }
}

extension PathZipVVOOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.2))
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print(output.0))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVOOOV<P0, P1, P2, P3, P4, P5> {
    PathZipVVOOOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVOOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output,
    P3.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o2, o3, o5)
  }
}

extension PathZipVVOOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.2))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print(output.0))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVOOVO<P0, P1, P2, P3, P4, P5> {
    PathZipVVOOVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVOOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output,
    P3.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o2, o3)
  }
}

extension PathZipVVOOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.1))
    input.path.prepend(try p2.print(output.0))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVOOVV<P0, P1, P2, P3, P4, P5> {
    PathZipVVOOVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVOVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o2, o4, o5)
  }
}

extension PathZipVVOVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.2))
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.0))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVOVOO<P0, P1, P2, P3, P4, P5> {
    PathZipVVOVOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVOVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o2, o4)
  }
}

extension PathZipVVOVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.0))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVOVOV<P0, P1, P2, P3, P4, P5> {
    PathZipVVOVOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVOVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o2, o5)
  }
}

extension PathZipVVOVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.1))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output.0))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVOVVO<P0, P1, P2, P3, P4, P5> {
    PathZipVVOVVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVOVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P2.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    let o2 = try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o2)
  }
}

extension PathZipVVOVVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print(output))
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVOVVV<P0, P1, P2, P3, P4, P5> {
    PathZipVVOVVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVVOOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P3.Output,
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o3, o4, o5)
  }
}

extension PathZipVVVOOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.2))
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print(output.0))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVVOOO<P0, P1, P2, P3, P4, P5> {
    PathZipVVVOOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVVOOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P3.Output,
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o3, o4)
  }
}

extension PathZipVVVOOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output.1))
    input.path.prepend(try p3.print(output.0))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVVOOV<P0, P1, P2, P3, P4, P5> {
    PathZipVVVOOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVVOVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P3.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o3, o5)
  }
}

extension PathZipVVVOVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.1))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output.0))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVVOVO<P0, P1, P2, P3, P4, P5> {
    PathZipVVVOVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVVOVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P3.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    let o3 = try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o3)
  }
}

extension PathZipVVVOVV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print(output))
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVVOVV<P0, P1, P2, P3, P4, P5> {
    PathZipVVVOVV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVVVOO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P4.Output,
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o4, o5)
  }
}

extension PathZipVVVVOO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output.1))
    input.path.prepend(try p4.print(output.0))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVVVOO<P0, P1, P2, P3, P4, P5> {
    PathZipVVVVOO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVVVOV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P4.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    let o4 = try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o4)
  }
}

extension PathZipVVVVOV: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print(output))
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVVVOV<P0, P1, P2, P3, P4, P5> {
    PathZipVVVVOV(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVVVVO<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws -> (
    P5.Output
  ) {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    let o5 = try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return (o5)
  }
}

extension PathZipVVVVVO: Printer
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
    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print(output))
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVVVVO<P0, P1, P2, P3, P4, P5> {
    PathZipVVVVVO(p0, p1, p2, p3, p4, p5)
  }
}

public struct PathZipVVVVVV<P0, P1, P2, P3, P4, P5>: Parser
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
  public let p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5

  @inlinable public init(_ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5) {
    self.p0 = p0
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
    self.p4 = p4
    self.p5 = p5
  }

  @inlinable public func parse(_ input: inout URLRequestData) throws {
    guard input.path.count >= 6 else { throw RoutingError() }
    try Parse {
      p0
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p1
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p2
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p3
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p4
      End()
    }.parse(input.path.removeFirst())
    try Parse {
      p5
      End()
    }.parse(input.path.removeFirst())
    return ()
  }
}

extension PathZipVVVVVV: Printer
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

    ),
    into input: inout URLRequestData
  ) rethrows {
    input.path.prepend(try p5.print())
    input.path.prepend(try p4.print())
    input.path.prepend(try p3.print())
    input.path.prepend(try p2.print())
    input.path.prepend(try p1.print())
    input.path.prepend(try p0.print())
  }
}

extension PathBuilder {
  @inlinable public static func buildBlock<P0, P1, P2, P3, P4, P5>(
    _ p0: P0, _ p1: P1, _ p2: P2, _ p3: P3, _ p4: P4, _ p5: P5
  ) -> PathZipVVVVVV<P0, P1, P2, P3, P4, P5> {
    PathZipVVVVVV(p0, p1, p2, p3, p4, p5)
  }
}

// END AUTO-GENERATED CONTENT
