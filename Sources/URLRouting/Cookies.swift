public struct Cookies<CookieParsers>: Parser
where
  CookieParsers: Parser,
  CookieParsers.Input == URLRequestData.Fields
{
  @usableFromInline
  let cookieParsers: CookieParsers

  @inlinable
  public init(@ParserBuilder build: () -> CookieParsers) {
    self.cookieParsers = build()
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> CookieParsers.Output? {
    guard let cookie = input.headers["cookie"]
    else { return nil }

    var fields: CookieParsers.Input = cookie.reduce(into: [:]) { fields, field in
      guard let cookies = field?.components(separatedBy: "; ")
      else { return }

      for cookie in cookies {
        let pair = cookie.split(separator: "=", maxSplits: 1, omittingEmptySubsequences: false)
        guard pair.count == 2 else { continue }
        fields[String(pair[0]), default: []].append(pair[1])
      }
    }

    guard let output = self.cookieParsers.parse(&fields)
    else { return nil }

    return output
  }
}

extension Cookies: Printer where CookieParsers: Printer {
  @inlinable
  public func print(_ output: CookieParsers.Output) -> URLRequestData? {
    guard let cookies = self.cookieParsers.print(output)
    else { return nil }

    return .init(
      headers: [
        "cookie": [
          cookies
            .sorted(by: { $0.key < $1.key })
            .flatMap { name, values in values.map { "\(name)=\($0 ?? "")" } }
            .joined(separator: "; ")[...]
        ]
      ]
    )
  }
}
