import Parsing

/*
 This playground builds a parser for [day 13][AoC13] of the Advent of Code 2021 challenge.

 [AoC13]: https://adventofcode.com/2021/day/13
 */

/// Sample input to be parsed.
let input = """
  6,10
  0,14
  9,10
  0,3
  10,4
  4,11
  6,0
  6,12
  4,1
  0,13
  10,12
  3,4
  3,0
  8,4
  1,10
  2,14
  8,10
  9,0

  fold along y=7
  fold along x=5
  """

// MARK: - Models

struct Dot {
  let x, y: Int
}

enum Direction: String, CaseIterable {
  case x, y
}

struct Fold {
  let direction: Direction
  let position: Int
}

struct Instructions {
  let dots: [Dot]
  let folds: [Fold]
}

// MARK: - Parsers

let dot = ParsePrint(.memberwise(Dot.init)) {
  Digits()
  ","
  Digits()
}

let fold = ParsePrint(.memberwise(Fold.init)) {
  "fold along "
  Direction.parser()
  "="
  Digits()
}

let instructions = ParsePrint(.memberwise(Instructions.init)) {
  Many {
    dot
  } separator: {
    "\n"
  } terminator: {
    "\n\n"
  }
  Many {
    fold
  } separator: {
    "\n"
  }
}

// MARK: Round-trip

let parsed = try instructions.parse(input)
let printed = try instructions.print(parsed)

input == printed
