//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2021 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

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

func list<S>(
  _ sequence: S,
  separator: String = ", ",
  terminator: String = "",
  @StringBuilder _ component: @escaping (S.Element) -> String
) -> String where S: Sequence {
  sequence.map(component).joined(separator: separator) + terminator
}

var output = [String]()

struct VariadicsGenerator: ParsableCommand {
  func run() throws {
    output.append("// BEGIN AUTO-GENERATED CONTENT\n")

    for arity in 2...6 {
      emitZipDeclarations(arity: arity)
    }

    for arity in 2...10 {
      emitOneOfDeclaration(arity: arity)
    }

    output.append("// END AUTO-GENERATED CONTENT\n")
    print(output.joined(separator: "\n"))
  }

  func emitZipDeclarations(arity: Int) {
    for permutation in Permutations(arity: arity) {
      let typeName = "Zip\(permutation.identifier)"

      output.append(
        String.build {
          // Emit type declarations.
          "extension Parsers {"
          "  public struct \(typeName)<" + list(0..<arity){ "P\($0)" } + ">: Parser"
          "  where"
          for i in 0..<arity {
            "    P\(i): Parser,"
          }
          list(
            zip(0..<arity, (0..<arity).dropFirst()), separator: ",\n",
            terminator: permutation.hasCaptureless ? "," : ""
          ) {
            "    P\($0).Input == P\($1).Input"
          }
          if permutation.hasCaptureless {
            list(permutation.capturelessIndices, separator: ",\n") {
              "    P\($0).Output == Void"
            }
          }
          "  {"
          "    public let " + list(0..<arity) { "p\($0): P\($0)" }
          ""
          "    @inlinable public init(" + list(0..<arity) { "_ p\($0): P\($0)" } + ") {"
          for i in 0..<arity {
            "      self.p\(i) = p\(i)"
          }
          "    }"
          ""
          "    @inlinable public func parse(_ input: inout P0.Input) -> ("
          list(permutation.captureIndices, separator: ",\n") {
            "      P\($0).Output"
          }
          "    )? {"
          "      guard "
          list(0..<arity, separator: ",\n") {
            "        let \(permutation.isCaptureless(at: $0) ? "_" : "o\($0)") = p\($0).parse(&input)"
          }
          "      else {"
          "        return nil"
          "      }"
          "      return (" + list(permutation.captureIndices){ "o\($0)" } + ")"
          "    }"
          "  }"
          "}"
          ""
          // Emit builders.
          "extension ParserBuilder {"
          "  @inlinable public static func buildBlock<" + list(0..<arity){ "P\($0)" } + ">("
          "    " + list(0..<arity) { "_ p\($0): P\($0)" }
          "  ) -> Parsers.\(typeName)<" + list(0..<arity){ "P\($0)" } + "> {"
          "    Parsers.\(typeName)(" + list(0..<arity){ "p\($0)" } + ")"
          "  }"
          "}"
          ""
        }
      )
    }
  }

  func emitOneOfDeclaration(arity: Int) {
    let typeName = "OneOf\(arity)"
    output.append(
      String.build {
        // Emit type declarations.
        "extension Parsers {\n  public struct \(typeName)<" + list(0..<arity) { "P\($0)" } + ">: Parser"
        "  where"
        for i in 0..<arity {
          "    P\(i): Parser,"
        }
        for (i, j) in zip(0..<arity, (0..<arity).dropFirst()) {
          "    P\(i).Input == P\(j).Input,"
        }
        list(zip(0..<arity, (0..<arity).dropFirst()), separator: ",\n") {
          "    P\($0).Output == P\($1).Output"
        }
        "  {"
        "    public let " + list(0..<arity) { "p\($0): P\($0)" }
        ""
        "    @inlinable public init(" + list(0..<arity) { "_ p\($0): P\($0)" } + ") {"
        for i in 0..<arity {
          "      self.p\(i) = p\(i)"
        }
        "    }"
        ""
        "    @inlinable public func parse(_ input: inout P0.Input) -> P0.Output? {"
        for i in 0..<arity {
          "      var i\(i) = input"
          "      if let output = self.p\(i).parse(&i\(i)) {"
          "        input = i\(i)"
          "        return output"
          "      }"
        }
        "      return nil"
        "    }"
        "  }"
        "}"
        ""
        // Emit type declarations.
        "extension OneOfBuilder {"
        "  @inlinable public static func buildBlock<" + list(0..<arity){ "P\($0)" } + ">("
        "    " + list(0..<arity) { "_ p\($0): P\($0)" }
        "  ) -> Parsers.\(typeName)<" + list(0..<arity){ "P\($0)" } + "> {"
        "    Parsers.\(typeName)(" + list(0..<arity){ "p\($0)" } + ")"
        "  }"
        "}"
        ""
      }
    )
  }
}
