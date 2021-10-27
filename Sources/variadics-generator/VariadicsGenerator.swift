import ArgumentParser

struct Permutation {
  let arity: Int
  // 1 ->
  // 0 -> where P.Output == Void
  let bits: Int64

  func isCaptureless(at index: Int) -> Bool {
    bits & (1 << (-index + arity - 1)) != 0
  }

  var hasCaptureless: Bool {
    bits != 0
  }

  var identifier: String {
    var result = ""
    for i in 0..<arity {
      result.append(isCaptureless(at: i) ? "V" : "O")
    }
    return result
  }

  var capturelessIndices: [Int] {
    (0..<arity).filter { isCaptureless(at: $0) }
  }

  var captureIndices: [Int] {
    (0..<arity).filter { !isCaptureless(at: $0) }
  }
}

struct Permutations: Sequence {
  let arity: Int

  struct Iterator: IteratorProtocol {
    let arity: Int
    var counter = Int64(0)

    mutating func next() -> Permutation? {
      guard counter & (1 << arity) == 0 else {
        return nil
      }
      defer { counter += 1 }
      return Permutation(arity: arity, bits: counter)
    }
  }

  public func makeIterator() -> Iterator {
    Iterator(arity: arity)
  }
}

func output(_ content: String) {
  print(content, terminator: "")
}

func outputForEach<C: Collection>(
  _ elements: C, separator: String, _ content: (C.Element) -> String
) {
  for i in elements.indices {
    output(content(elements[i]))
    if elements.index(after: i) != elements.endIndex {
      output(separator)
    }
  }
}

@main
struct VariadicsGenerator: ParsableCommand {
  @Option(help: "The minimum arity of declarations to generate.")
  var minArity: Int = 2

  @Option(help: "The maximum arity of declarations to generate.")
  var maxArity: Int = 6

  func run() throws {
    precondition(minArity > 0)
    precondition(maxArity > 1)
    precondition(maxArity < Int64.bitWidth)

    output("// BEGIN AUTO-GENERATED CONTENT\n\n")

    for arity in minArity...maxArity {
      emitZipDeclarations(arity: arity)
    }

    for arity in minArity...(maxArity + 3) {
      emitOneOfDeclaration(arity: arity)
    }

    output("// END AUTO-GENERATED CONTENT")
  }

  func emitZipDeclarations(arity: Int) {
    for permutation in Permutations(arity: arity) {
      // Emit type declarations.
      let typeName = "Zip\(arity)_\(permutation.identifier)"
      output("public struct \(typeName)<")
      outputForEach(0..<arity, separator: ", ") { "P\($0)" }
      output(">: Parser\nwhere\n  ")
      outputForEach(0..<arity, separator: ",\n  ") { "P\($0): Parser" }
      output(",\n  ")
      outputForEach(Array(zip(0..<arity, (0..<arity).dropFirst())), separator: ",\n  ") {
        "P\($0).Input == P\($1).Input"
      }
      if permutation.hasCaptureless {
        output(",\n  ")
        outputForEach(permutation.capturelessIndices, separator: ",\n  ") {
          "P\($0).Output == Void"
        }
      }
      output("\n{\n  @usableFromInline let ")
      outputForEach(0..<arity, separator: ", ") { "p\($0): P\($0)" }
      output("\n\n  @inlinable init(")
      outputForEach(0..<arity, separator: ", ") { "_ p\($0): P\($0)" }
      output(") {\n    ")
      outputForEach(0..<arity, separator: "\n    ") { "self.p\($0) = p\($0)" }
      output("\n  }\n\n  @inlinable public func parse(_ input: inout P0.Input) -> (\n    ")
      outputForEach(permutation.captureIndices, separator: ",\n    ") { "P\($0).Output" }
      output("\n  )? {\n    let original = input\n    guard\n      ")
      outputForEach(0..<arity, separator: ",\n      ") {
        "let \(permutation.isCaptureless(at: $0) ? "_" : "o\($0)") = p\($0).parse(&input)"
      }
      output("\n    else {\n      input = original\n      return nil\n    }\n    return (")
      outputForEach(permutation.captureIndices, separator: ", ") { "o\($0)" }
      output(")\n  }\n}\n\n")

      // Emit builders.
      output("extension ParserBuilder {\n")
      output("  @inlinable public static func buildBlock<")
      outputForEach(0..<arity, separator: ", ") { "P\($0)" }
      output(">(\n    ")
      outputForEach(0..<arity, separator: ", ") { "_ p\($0): P\($0)" }
      output("\n  ) -> \(typeName)<")
      outputForEach(0..<arity, separator: ", ") { "P\($0)" }
      output("> {\n")
      output("    \(typeName)(")
      outputForEach(0..<arity, separator: ", ") { "p\($0)" }
      output(")\n  }\n}\n\n")
    }
  }

  func emitOneOfDeclaration(arity: Int) {
    let typeName = "OneOf\(arity)"
    output("public struct \(typeName)<")
    outputForEach(0..<arity, separator: ", ") { "P\($0)" }
    output(">: Parser\nwhere\n  ")
    outputForEach(0..<arity, separator: ",\n  ") { "P\($0): Parser" }
    output(",\n  ")
    outputForEach(Array(zip(0..<arity, (0..<arity).dropFirst())), separator: ",\n  ") {
      "P\($0).Input == P\($1).Input"
    }
    output(",\n  ")
    outputForEach(Array(zip(0..<arity, (0..<arity).dropFirst())), separator: ",\n  ") {
      "P\($0).Output == P\($1).Output"
    }
    output("\n{\n  @usableFromInline let ")
    outputForEach(0..<arity, separator: ", ") { "p\($0): P\($0)" }
    output("\n\n  @inlinable init(")
    outputForEach(0..<arity, separator: ", ") { "_ p\($0): P\($0)" }
    output(") {\n    ")
    outputForEach(0..<arity, separator: "\n    ") { "self.p\($0) = p\($0)" }
    output("\n  }\n\n  @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {\n    ")
    outputForEach(0..<arity, separator: "\n    ") {
      "if let output = self.p\($0).parse(&input) { return output }"
    }
    output("\n    return nil\n  }\n}\n\n")

    // Emit builders.
    output("extension OneOfBuilder {\n")
    output("  @inlinable public static func buildBlock<")
    outputForEach(0..<arity, separator: ", ") { "P\($0)" }
    output(">(\n    ")
    outputForEach(0..<arity, separator: ", ") { "_ p\($0): P\($0)" }
    output("\n  ) -> \(typeName)<")
    outputForEach(0..<arity, separator: ", ") { "P\($0)" }
    output("> {\n")
    output("    \(typeName)(")
    outputForEach(0..<arity, separator: ", ") { "p\($0)" }
    output(")\n  }\n}\n\n")
  }
}
