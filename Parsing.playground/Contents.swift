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
  print(try hexColor.parse(&hex))
}

do {
  var hex = "#FF0000"[...]
  print(try hexColor.parse(&hex))
}
