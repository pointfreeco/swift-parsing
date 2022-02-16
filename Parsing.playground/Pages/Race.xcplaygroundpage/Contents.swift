import Parsing

struct Coordinate {
  let latitude: Double
  let longitude: Double
}

enum Currency { case eur, gbp, usd }

struct Money {
  let currency: Currency
  let dollars: Int
}

struct Race {
  let location: String
  let entranceFee: Money
  let difficulty: Int
  let path: [Coordinate]
}

let northSouth = OneOf {
  "N".utf8.map { 1.0 }
  "S".utf8.map { -1.0 }
}

let eastWest = OneOf {
  "E".utf8.map { 1.0 }
  "W".utf8.map { -1.0 }
}

var input = ""[...].utf8
try northSouth.print(1, to: &input)
Substring(input)
input = ""[...].utf8
try northSouth.print(-1, to: &input)
Substring(input)

input = ""[...].utf8
try eastWest.print(1, to: &input)
Substring(input)
input = ""[...].utf8
try eastWest.print(-1, to: &input)
Substring(input)

//input = ""[...].utf8
//try eastWest.print(2, to: &input)
//Substring(input)

let magnitudeSign = Conversion<(Double, Double), Double>(
  apply: *,
  unapply: { value in
    value < 0 ? (-value, -1) : (value, 1)
  }
)

let latitude = ParsePrint(magnitudeSign) {
  Double.parser()
  "° ".utf8
  northSouth
}

let longitude = ParsePrint(magnitudeSign) {
  Double.parser()
  "° ".utf8
  eastWest
}

input = ""[...].utf8
try latitude.print(42, to: &input)
Substring(input)
input = ""[...].utf8
try latitude.print(-42, to: &input)
Substring(input)

input = ""[...].utf8
try longitude.print(42, to: &input)
Substring(input)
input = ""[...].utf8
try longitude.print(-42, to: &input)
Substring(input)

let zeroOrMoreSpaces = Prefix { $0 == .init(ascii: " ") }
  .printing(" "[...].utf8)

let coord = ParsePrint(.struct(Coordinate.init(latitude:longitude:))) {
  latitude
  Skip {
    ",".utf8
    zeroOrMoreSpaces
  }
  longitude
}

input = ""[...].utf8
try coord.print(.init(latitude: 42, longitude: -10), to: &input)
Substring(input)

let currency = OneOf {
  "€".utf8.map { Currency.eur }
  "£".utf8.map { Currency.gbp }
  "$".utf8.map { Currency.usd }
}

input = ""[...].utf8
try currency.print(.gbp, to: &input)
Substring(input)

let money = ParsePrint(.struct(Money.init(currency:dollars:))) {
  currency
  Int.parser()
}

input = ""[...].utf8
try money.print(.init(currency: .eur, dollars: 100), to: &input)
Substring(input)


let locationName = Prefix { $0 != .init(ascii: ",") }

let count = Conversion<[Void], Int>(
  apply: \.count,
  unapply: { count in Array(repeating: (), count: count) }
)

let difficulty = Many { "🥵".utf8 }.map(count)

try difficulty.parse("🥵🥵🥵🥵".utf8) // 4

input = ""[...].utf8
try difficulty.print(5, to: &input) // "🥵🥵🥵🥵🥵"
Substring(input)

//Many { "🥵".utf8 }.print(<#T##output: [()]##[()]#>, to: &<#T##Substring.UTF8View#>)


let race = ParsePrint(.struct(Race.init(location:entranceFee:difficulty:path:))) {
  locationName.map(.string)
  Skip {
    ",".utf8
    zeroOrMoreSpaces
  }
  money
  Skip {
    ",".utf8
    zeroOrMoreSpaces
  }
  ParsePrint {
    difficulty
    "\n".utf8
  }
  Many {
    coord
  } separator: {
    "\n".utf8
  }
}

input = ""[...].utf8
try race.print(
  .init(
    location: "New York",
    entranceFee: .init(currency: .usd, dollars: 300),
    difficulty: 3,
    path: [
      .init(latitude: 42, longitude: -10)
    ]
  ),
  to: &input
)
Substring(input) // "New York, $300\n42.0° N, 10.0° W"

let races = Many {
  race
} separator: {
  "\n---\n".utf8
}

input = ""[...].utf8
try races.print(
  [
    .init(
      location: "New York",
      entranceFee: .init(currency: .usd, dollars: 300),
      difficulty: 3,
      path: [
        .init(latitude: 42, longitude: -10)
      ]
    ),
    .init(
      location: "New York",
      entranceFee: .init(currency: .usd, dollars: 300),
      difficulty: 3,
      path: [
        .init(latitude: 42, longitude: -10)
      ]
    )
  ],
  to: &input
)
Substring(input) // "New York, $300\n42.0° N, 10.0° W\n---\nNew York, $300\n42.0° N, 10.0° W"


func print(coordinate: Coordinate) -> String {
  "\(abs(coordinate.latitude))° \(coordinate.latitude < 0 ? "S" : "N"), \(abs(coordinate.longitude))° \(coordinate.longitude < 0 ? "E" : "W")"
}


