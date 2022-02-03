import Parsing

struct Color {
  let red, green, blue: UInt8
}

let hexPrimary = Prefix(2)
  .compactMap { UInt8($0, radix: 16) }

let hexColor = Parse(Color.init(red:green:blue:)) {
  "#"
  hexPrimary
  hexPrimary
  hexPrimary
}

do {
  var hex = "#000000"[...]
  print(hex.debugDescription, "->", try hexColor.parse(&hex), terminator: "\n ...\n\n")
}

do {
  var hex = "#FF0000"[...]
  print(hex.debugDescription, "->", try hexColor.parse(&hex), terminator: "\n ...\n\n")
}

do {
  var bad = "#BADHEX"[...]
  try hexColor.parse(&bad)
} catch {
  print(error)
}

import _URLRouting

struct Component<Downstream>: Parser
where
  Downstream: Conversion,
  Downstream.Input: Collection,
  Downstream.Input.SubSequence == Downstream.Input
{
  let conversion: Downstream

  init(_ conversion: Downstream) {
    self.conversion = conversion
  }

  func parse(_ input: inout Downstream.Input) rethrows -> Downstream.Output {
    let output = try self.conversion.apply(input)
    input = input[input.endIndex...]
    return output
  }
}

extension Component: Printer where Downstream.Input: AppendableCollection {
  func print(_ output: Downstream.Output, to input: inout Downstream.Input) rethrows {
    input.append(contentsOf: try self.conversion.unapply(output))
  }
}

dump(
  try Path {
    Int.parser()
    Component(.string.converted(to: Int.self))
    "Hello"
  }
  .parse(URLRequestData(string: "12/34/Hello/123")!)
)
