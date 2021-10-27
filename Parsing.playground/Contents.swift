import Parsing

struct Color {
  let red, green, blue: UInt8
}

let hexPrimary = Prefix<Substring>(2)
  .compactMap { UInt8($0, radix: 16) }

let hexColor = "#"
  .take(hexPrimary)
  .take(hexPrimary)
  .take(hexPrimary)
  .map(Color.init)

do {
  var hex = "#000000"[...]
  print(hexColor.parse(&hex)!)
}

do {
  var hex = "#FF0000"[...]
  print(hexColor.parse(&hex)!)
}
