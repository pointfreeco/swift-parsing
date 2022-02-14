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
<<<<<<< HEAD
=======
}

do {
  var bad = "#BADHEX"[...]
  try hexColor.parse(&bad)
} catch {
  print(error)
>>>>>>> main
}

do {
  var bad = "#BADHEX"[...]
  try hexColor.parse(&bad)
} catch {
  print(error)
}

//import _URLRouting
//
//struct EpisodeID: RawRepresentable {
//  var rawValue: Int
//}
//
//enum EpisodeRoute {
//  case comments(page: Int, perPage: Int)
//}
//
//enum AppRoute {
//  case episode(id: EpisodeID, route: EpisodeRoute)
//}
//
//let episodeRouter = Route(/EpisodeRoute.comments) {
//  Path { "comments" }
//  Query {
//    Field("page", Int.parser()).replaceError(with: 1)
//    Field("per-page", Int.parser()).replaceError(with: 10)
//  }
//}
//
////let router = Route(/AppRoute.episode) {
////  Path {
////    "episodes"
//////    Parse(.rawRepresentable(as: EpisodeID.self)) { Int.parser() }
////    Parse(.string.losslessStringConvertible(to: Int.self).rawRepresentable(as: EpisodeID.self)) {
////      Rest()
////    }
////  }
////
////  episodeRouter
////}
//
//let x = Path {
//  Int.parser().map(.rawValue(of: EpisodeID.self))
//
//  Parse(.rawValue(of: EpisodeID.self)) { Int.parser() }
//
//  Parse(.string.losslessString(of: Int.self).rawValue(of: EpisodeID.self))
//
//  // Should `Path` speak `Conversion` instead? What does that mean for dot syntax?
//  // Should `Query` speak `Conversion` instead?
//  // Should parser printers conform to `Conversion` whenever possible?
//  // Should conversions conform to `ParserPrinter` whenever possible?
//}
//
//struct Login: Codable {
//  var username: String
//  var password: String
//}
//
//let y = Body { Parse(.data.json(Login.self)) }
