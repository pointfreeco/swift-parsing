import Foundation

struct Format<Upstream>: Codable, Hashable, ParserPrinter, ParseableFormatStyle, ParseStrategy
where
  Upstream: ParserPrinter,
  Upstream.Input == Substring
{
  var parseStrategy: Self { self }

  func parse(_ value: String) throws -> Output {
    var value = value[...]
    return self.parse(&value)!
  }

  typealias Strategy = Self

  func format(_ value: Output) -> String {
    String(self.print(value)!)
  }

  static func == (lhs: Self, rhs: Self) -> Bool {
    false
  }

  func hash(into hasher: inout Hasher) {
  }

  init(_ upstream: Upstream) {
    self.upstream = upstream
  }

  init(from decoder: Decoder) throws {
    fatalError()
  }

  func encode(to encoder: Encoder) throws {
  }

  typealias Output = Upstream.Output

  typealias FormatInput = Output

  typealias FormatOutput = String

  let upstream: Upstream

  func parse(_ input: inout Substring) -> Output? {
    self.upstream.parse(&input)
  }

  func print(_ output: Output) -> Substring? {
    self.upstream.print(output)
  }
}

import SwiftUI

@available(macOS 10.15, iOS 13, *)
struct MyView: View {
  @State var number: Int?

  var body: some View {
    if #available(macOS 12.0, iOS 15,  *) {
      TextField("", value: self.$number, format: Format(Int.parser(of: Substring.self)))
    } else {
      // Fallback on earlier versions
    }
  }
}

@available(macOS 10.15, iOS 13, *)
struct MyPreviews: PreviewProvider {
  static var previews: some View {
    MyView()
  }
}
