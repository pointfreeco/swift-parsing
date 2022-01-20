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

    // TODO: rethrows
    @inlinable
    @inline(__always)
    public func parse(_ input: inout Upstream.Input) throws -> Downstream.Output {
      let original = input

      let downstreamInput = try self.upstream.parse(&input)

      guard let output = self.downstream.apply(downstreamInput)
      else {
        input = original
        throw ParsingError()
      }

      return output
    }
  }
}

extension Parsers.MapConversion: Printer where Upstream: Printer {
  @inlinable
  public func print(_ output: Downstream.Output) -> Upstream.Input? {
    self.downstream.unapply(output).flatMap(self.upstream.print)
  }
}
