extension Parser {
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
        // TODO: throw `ParsingError`
        input = original
        throw error
      }
    }
  }
}

extension Parsers.MapConversion: Printer where Upstream: Printer {
  @inlinable
  public func print(_ output: Downstream.Output, to input: inout Upstream.Input) rethrows {
    try self.upstream.print(self.downstream.unapply(output), to: &input)
  }
}
