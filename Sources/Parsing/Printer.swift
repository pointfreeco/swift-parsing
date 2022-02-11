
public protocol Printer {
  associatedtype Input
  associatedtype Output
  func print(_ output: Output, to input: inout Input) throws
}

public struct Conversion<Input, Output> {
  public let apply: (Input) throws -> Output
  public let unapply: (Output) throws -> Input
  public init(
    apply: @escaping (Input) throws -> Output,
    unapply: @escaping (Output) throws -> Input
  ) {
    self.apply = apply
    self.unapply = unapply
  }
}

extension Parsers.Map: Printer
where
Upstream: Printer,
Upstream.Output == Void,
Output: Equatable
{
  public func print(_ output: Output, to input: inout Upstream.Input) throws {
    guard self.transform(()) == output
    else {
      throw PrintingError()
    }
    try self.upstream.print((), to: &input)
  }
}

extension Parsers.OneOf3: Printer where P0: Printer, P1: Printer, P2: Printer {
  public func print(_ output: P0.Output, to input: inout P0.Input) throws {
    do {
      try self.p2.print(output, to: &input)
    } catch {
      do {
        try self.p1.print(output, to: &input)
      } catch {
        try self.p0.print(output, to: &input)
      }
    }
  }
}

struct ConversionError: Error {}

extension Conversion where Input == Void, Output: Equatable {
  public static func exactly(_ output: Output) -> Self {
    .init(
      apply: { output },
      unapply: {
        guard $0 == output
        else { throw ConversionError() }
      }
    )
  }
}

extension Parsers {
  public struct Printing<Upstream: Parser>: Parser, Printer where Upstream.Input: AppendableCollection {
    let upstream: Upstream
    let input: Upstream.Input

    public func parse(_ input: inout Upstream.Input) throws -> Upstream.Output {
      try self.upstream.parse(&input)
    }

    public func print(_ output: Upstream.Output, to input: inout Upstream.Input) {
      input.append(contentsOf: self.input)
    }
  }
}

extension Parser {
  public func printing(_ input: Input) -> Parsers.Printing<Self> where Input: AppendableCollection {
    .init(upstream: self, input: input)
  }
}

extension Parse {
  public init<Upstream, NewOutput>(
    _ conversion: Conversion<Upstream.Output, NewOutput>,
    @ParserBuilder with build: () -> Upstream
  ) where Parsers == Parsing.Parsers.ReversibleMap<Upstream, NewOutput> {
    self.init { build().map(conversion) }
  }
}
struct PrintingError: Error {}

extension Prefix: Printer where Input: AppendableCollection {
  public func print(_ output: Input, to input: inout Input) throws {
    guard output.allSatisfy(self.predicate!)
    else {
      throw PrintingError()
    }

    input.append(contentsOf: output)
  }
}

extension Parse: Printer where Parsers: Printer {
  public func print(_ output: Parsers.Output, to input: inout Parsers.Input) throws {
    try self.parsers.print(output, to: &input)
  }
}


extension Parsers.ZipVOV: Printer
where
P0: Printer,
P1: Printer,
P2: Printer
{
  public func print(_ output: (P1.Output), to input: inout P0.Input) throws {
    try self.p0.print((), to: &input)
    try self.p1.print(output, to: &input)
    try self.p2.print((), to: &input)
  }
}

extension OneOf: Printer where Parsers: Printer {
  public func print(_ output: Parsers.Output, to input: inout Parsers.Input) throws {
    try self.parsers.print(output, to: &input)
  }
}

extension Parsers.OneOf2: Printer where P0: Printer, P1: Printer {
  public func print(_ output: P0.Output, to input: inout P0.Input) throws {
    do {
      try self.p1.print(output, to: &input)
    } catch {
      try self.p0.print(output, to: &input)
    }
  }
}

extension Skip: Printer where Parsers: Printer, Parsers.Output == Void {
  public func print(_ output: (), to input: inout Parsers.Input) throws {
    try self.parsers.print((), to: &input)
  }
}

extension Parsers.ZipVV: Printer where P0: Printer, P1: Printer {
  public func print(_ output: (), to input: inout P0.Input) throws {
    try self.p0.print((), to: &input)
    try self.p1.print((), to: &input)
  }
}


extension Parsers.IntParser: Printer where Input: AppendableCollection {
  public func print(_ output: Output, to input: inout Input) throws {
    input.append(contentsOf: String(output, radix: self.radix).utf8)
  }
}

extension FromUTF8View: Printer where UTF8Parser: Printer {
  public func print(_ output: UTF8Parser.Output, to input: inout Input) throws {
    var utf8Input = self.toUTF8(input)
    defer { input = self.fromUTF8(utf8Input) }
    try self.utf8Parser.print(output, to: &utf8Input)
  }
}

extension Parsers.BoolParser: Printer where Input: AppendableCollection {
  public func print(_ output: Bool, to input: inout Input) throws {
    input.append(contentsOf: String(output).utf8)
  }
}

extension Parsers.ZipOVOVO: Printer where P0: Printer, P1: Printer, P2: Printer, P3: Printer, P4: Printer {
  public func print(_ output: (P0.Output, P2.Output, P4.Output), to input: inout P0.Input) throws {
    try self.p0.print(output.0, to: &input)
    try self.p1.print((), to: &input)
    try self.p2.print(output.1, to: &input)
    try self.p3.print((), to: &input)
    try self.p4.print(output.2, to: &input)
  }
}

extension Many: Printer
where
Element: Printer,
Result == [Element.Output],
Separator: Printer,
Separator.Output == Void
{
  public func print(_ output: [Element.Output], to input: inout Element.Input) throws {
    var firstElement = true
    for elementOutput in output {
      defer { firstElement = false }
      if !firstElement {
        try self.separator.print((), to: &input)
      }
      try self.element.print(elementOutput, to: &input)
    }
  }
}

extension Always: Printer {
  public func print(_ output: Output, to input: inout Input) throws {
  }
}


public protocol AppendableCollection: Collection {
  mutating func append<S: Sequence>(contentsOf elements: S) where S.Element == Element
}

extension Substring.UTF8View: AppendableCollection {
  public mutating func append<S>(contentsOf newElements: S)
  where
S: Sequence,
  String.UTF8View.Element == S.Element
  {
    var result = Substring(self)
    result.append(contentsOf: Substring(decoding: Array(newElements), as: UTF8.self))
    self = result.utf8
  }
}

import Foundation

extension Substring: AppendableCollection {}
extension ArraySlice: AppendableCollection {}
extension Data: AppendableCollection {}
extension Substring.UnicodeScalarView: AppendableCollection {}

extension String.UTF8View: Printer {
  public func print(_ output: (), to input: inout Substring.UTF8View) throws {
    input.append(contentsOf: self)
  }
}

extension Parsers {
  public struct ReversibleMap<Upstream, Output>: Parser, Printer where Upstream: Parser, Upstream: Printer {
    public let upstream: Upstream
    public let transform: (Upstream.Output) throws -> Output
    public let untransform: (Output) throws -> Upstream.Output

    public func parse(_ input: inout Upstream.Input) throws -> Output {
      try self.transform(self.upstream.parse(&input))
    }

    public func print(_ output: Output, to input: inout Upstream.Input) throws {
      try self.upstream.print(self.untransform(output), to: &input)
    }
  }
}

extension Parser {
  public func map<NewOutput>(
    transform: @escaping (Output) throws -> NewOutput,
    untransform: @escaping (NewOutput) throws -> Output
  ) -> Parsers.ReversibleMap<Self, NewOutput> {
    .init(upstream: self, transform: transform, untransform: untransform)
  }

  public func map<NewOutput>(
    _ conversion: Conversion<Output, NewOutput>
  ) -> Parsers.ReversibleMap<Self, NewOutput> {
    .init(upstream: self, transform: conversion.apply, untransform: conversion.unapply)
  }
}

extension Conversion where Input == Substring, Output == String {
  public static let string = Self(
    apply: { String($0) },
    unapply: { Substring($0) }
  )
}
extension Conversion where Input == Substring.UTF8View, Output == String {
  public static let string = Self(
    apply: { String(Substring($0)) },
    unapply: { Substring($0).utf8 }
  )
}

extension Parsers.ZipOVO: Printer where P0: Printer, P1: Printer, P2: Printer {
  public func print(_ output: (P0.Output, P2.Output), to input: inout P0.Input) throws {
    var i = input
    try self.p0.print(output.0, to: &i)
    try self.p1.print((), to: &i)
    try self.p2.print(output.1, to: &i)
    input = i
  }
}

extension String: Printer {
  public func print(_ output: (), to input: inout Substring) {
    input.append(contentsOf: self)
  }
}


public typealias ParsePrint<P> = Parse<P> where P: Parser & Printer

extension Conversion {
  public static func `struct`(_ `init`: @escaping (Input) -> Output) -> Self {
    .init(
      apply: `init`,
      unapply: {
        //        guard
        //          MemoryLayout<Input>.size == MemoryLayout<Output>.size,
        //          MemoryLayout<Input>.stride == MemoryLayout<Output>.stride,
        //          MemoryLayout<Input>.alignment == MemoryLayout<Output>.alignment,
        //          MemoryLayout<Input>.offset(of: <#T##PartialKeyPath<Input>#>)
        //        else {
        //          throw ...
        //        }

        unsafeBitCast($0, to: Input.self)
      }
    )
  }
}

extension Parsers.ZipOO: Printer where P0: Printer, P1: Printer {
  public func print(_ output: (P0.Output, P1.Output), to input: inout P0.Input) throws {
    try self.p0.print(output.0, to: &input)
    try self.p1.print(output.1, to: &input)
  }
}

extension Parsers.DoubleParser: Printer where Input: AppendableCollection {
  public func print(_ output: Double, to input: inout Input) throws {
    input.append(contentsOf: String(output).utf8)
  }
}
