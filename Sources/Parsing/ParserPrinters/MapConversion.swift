extension Parser {
  @_disfavoredOverload
  @inlinable
  public func map<C>(_ conversion: C) -> Parsers.MapConversion<Self, C>  {
    .init(upstream: self, downstream: conversion)
  }
}

extension Parsers {
  public struct MapConversion<Upstream, Downstream>: Parser
  where
    Upstream: Parser,
    Downstream: Conversion,
    Downstream.Input == Upstream.Output
  {
    public let upstream: Upstream
    public let downstream: Downstream

    @inlinable
    public init(upstream: Upstream, downstream: Downstream) {
      self.upstream = upstream
      self.downstream = downstream
    }

    @inlinable
    @inline(__always)
    public func parse(_ input: inout Upstream.Input) rethrows -> Downstream.Output {
      let original = input

      let downstreamInput = try self.upstream.parse(&input)

      do {
        return try self.downstream.apply(downstreamInput)
      } catch {
        input = original
        throw error
      }
    }
  }
}

extension Parsers.MapConversion: Printer where Upstream: Printer {
  @inlinable
  public func print(_ output: Downstream.Output) -> Upstream.Input? {
    (try? self.downstream.unapply(output)).flatMap(self.upstream.print)
  }
}
