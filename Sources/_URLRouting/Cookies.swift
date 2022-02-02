// FIXME: Should this be a `Conversion`?

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
  public func parse(_ input: inout URLRequestData) throws -> CookieParsers.Output {
    guard let cookie = input.headers["cookie"]
    else { throw RoutingError() }

    var fields: CookieParsers.Input = cookie.reduce(into: [:]) { fields, field in
      guard let cookies = field?.components(separatedBy: "; ")
      else { return }

      for cookie in cookies {
        let pair = cookie.split(separator: "=", maxSplits: 1, omittingEmptySubsequences: false)
        guard pair.count == 2 else { continue }
        fields[String(pair[0]), default: []].append(pair[1])
      }
    }

    return try self.cookieParsers.parse(&fields)
  }
}

extension Cookies: Printer where CookieParsers: Printer {
  @inlinable
  public func print(_ output: CookieParsers.Output, to input: inout URLRequestData) rethrows {
    var cookies = URLRequestData.Fields()
    try self.cookieParsers.print(output, to: &cookies)

    input.headers["cookie", default: []].append(
      cookies
        .sorted(by: { $0.key < $1.key })
        .flatMap { name, values in values.map { "\(name)=\($0 ?? "")" } }
        .joined(separator: "; ")[...]
    )
  }
}
