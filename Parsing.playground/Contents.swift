import Parsing

let input = """
Wordle 267 4/6*

⬛⬛⬛⬛⬛
⬛🟩⬛⬛⬛
⬛🟩🟩⬛🟩
🟩🟩🟩🟩🟩
"""

enum LetterSpot {
  case correct
  case wrong
  case none
}

struct Wordle {
  var gameNumber: Int
  var guessedInCount: Int?
  var isHardMode: Bool
  var guesses: [[LetterSpot]]
}

let summary = ParsePrint {
  "Wordle "
  Int.parser()
  " "
  guessedInCount
  "/6"
  "*".map { true }.replaceError(with: false)
}

let guessedInCount = OneOf {
  Int.parser().map(.case(Int?.some))
  "X".map { Int?.none }
}

let letter = OneOf {
  "🟩".map { LetterSpot.correct }
  "🟨".map { LetterSpot.wrong }
  OneOf { "⬜️"; "⬛" }.map { LetterSpot.none }
}

let guess = Many(atLeast: 5, atMost: 5) {
  letter
}

let guesses = Many(atLeast: 1, atMost: 6) {
  guess
} separator: {
  "\n"
} terminator: {
  OneOf { "\n"; End() }
}

let wordle = ParsePrint {
  summary
  "\n\n"
  guesses
}

//var i = input[...]
//try wordle.parse(&i)
