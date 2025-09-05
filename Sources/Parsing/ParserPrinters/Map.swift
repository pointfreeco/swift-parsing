extension Parser {
  /// Returns a parser that transforms the output of this parser with a given closure.
  ///
  /// This method is similar to `Sequence.map`, `Optional.map`, and `Result.map` in the Swift
  /// standard library, as well as `Publisher.map` in the Combine framework.
  ///
  /// ## Printability
  ///
  /// Mapping a parser with a transform function results in a parser that cannot print. If you need
  /// to transform the output of a parser and retain printability, use the ``Conversion``-based
  /// ``Parser/map(_:)-18m9d`` operator instead.
  ///
  /// - Parameter transform: A closure that transforms values of this parser's output.
  /// - Returns: A parser of transformed outputs.
  @_disfavoredOverload
  @inlinable @preconcurrency
  public func map<NewOutput>(
    _ transform: @Sendable @escaping (Output) -> NewOutput
  ) -> Parsers.Map<Self, NewOutput> {
    .init(upstream: self, transform: transform)
  }

  /// Returns a parser that replaces the `Void` output of this parser with the output of a given
  /// closure.
  ///
  /// A printer-friendly version of ``Parser/map(_:)-2e6si`` for `Void` outputs, so long as
  /// `NewOutput` conforms to `Equatable`.
  ///
  /// ```swift
  /// enum Role: String {
  ///   case admin
  ///   case guest
  ///   case member
  /// }
  ///
  /// let role = OneOf {
  ///   "admin".map { Role.admin }
  ///   "guest".map { Role.guest }
  ///   "member".map { Role.member }
  /// }
  ///
  /// try role.parse("admin")  // Role.admin
  /// role.print(.guest)       // "guest"
  /// ```
  ///
  /// - Parameter transform: A closure that returns an output.
  /// - Returns: A parser of outputs.
  @_disfavoredOverload
  @inlinable
  public func map<NewOutput>(
    _ transform: () -> NewOutput
  ) -> Parsers.MapConstant<Self, NewOutput> {
    .init(upstream: self, output: transform())
  }

  /// Returns a parser-printer that transforms the output of this parser with a given conversion.
  ///
  /// This is a printer-friendly version of ``Parser/map(_:)-18m9d`` that transforms this parser's
  /// output using the conversion's ``Conversion/apply(_:)`` method, and prints using the
  /// conversion's ``Conversion/unapply(_:)`` method.
  ///
  /// - Parameter conversion: A conversion that transforms the output of this parser.
  /// - Returns: A parser of outputs.
  @inlinable
  public func map<C>(_ conversion: C) -> Parsers.MapConversion<Self, C> {
    .init(upstream: self, downstream: conversion)
  }
}

extension Parsers {
  /// A parser that transforms the output of another parser with a given closure.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/map(_:)-4hsj5`` operation, which constructs this type.
  public struct Map<Upstream: Parser, NewOutput>: Parser {
    /// The parser from which this parser receives output.
    public let upstream: Upstream

    /// The closure that transforms output from the upstream parser.
    public let transform: @Sendable (Upstream.Output) -> NewOutput

    @inlinable @preconcurrency
    public init(upstream: Upstream, transform: @Sendable @escaping (Upstream.Output) -> NewOutput) {
      self.upstream = upstream
      self.transform = transform
    }

    @inlinable
    @inline(__always)
    public func parse(_ input: inout Upstream.Input) rethrows -> NewOutput {
      self.transform(try self.upstream.parse(&input))
    }
  }

  /// A parser that replaces another parser's `Void` output with some new output.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/map(_:)-2e6si`` operation, which constructs this type.
  public struct MapConstant<Upstream: Parser, Output>: Parser where Upstream.Output == Void {
    public let upstream: Upstream
    public let output: Output

    @inlinable
    public init(upstream: Upstream, output: Output) {
      self.upstream = upstream
      self.output = output
    }

    @inlinable
    @inline(__always)
    public func parse(_ input: inout Upstream.Input) rethrows -> Output {
      try self.upstream.parse(&input)
      return self.output
    }
  }

  /// A parser that transforms the output of another parser with a given conversion.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/map(_:)-4hsj5`` operation, which constructs this type.
  public struct MapConversion<Upstream: ParserPrinter, Downstream: Conversion>: ParserPrinter
  where Downstream.Input == Upstream.Output {
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
      try self.downstream.apply(try self.upstream.parse(&input))
    }

    @inlinable
    public func print(_ output: Downstream.Output, into input: inout Upstream.Input) rethrows {
      try self.upstream.print(self.downstream.unapply(output), into: &input)
    }
  }
}

extension Parsers.MapConstant: ParserPrinter where Upstream: ParserPrinter, Output: Equatable {
  @inlinable
  public func print(_ output: Output, into input: inout Upstream.Input) throws {
    guard output == self.output else {
      throw PrintingError.failed(
        summary: """
          expected \(self.output)
          """,
        input: input
      )
    }
    try self.upstream.print((), into: &input)
  }
}

extension Parsers.Map: Sendable where Upstream: Sendable { } // TODO: Language does not support checking if a closure is Sendable.
extension Parsers.MapConstant: Sendable where Upstream: Sendable, Output: Sendable { }
extension Parsers.MapConversion: Sendable where Upstream: Sendable, Downstream: Sendable { }
