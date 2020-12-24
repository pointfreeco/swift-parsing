import Parsing

struct Color {
  let red, green, blue: UInt8
}

let hexPrimary = Prefix<Substring.UTF8View>(2)
  .compactMap { UInt8(Substring($0), radix: 16) }

let hexColor = StartsWith("#".utf8)
  .take(hexPrimary)
  .take(hexPrimary)
  .take(hexPrimary)
  .map(Color.init)

do {
  var hex = "#000000"[...].utf8
  print(hexColor.parse(&hex)!)
}

do {
  var hex = "#FF0000"[...].utf8
  print(hexColor.parse(&hex)!)
}
