import Parsing
import Foundation

extension ParserPrinter where Input == URLRequestData {
  @inlinable
  public func baseURL(_ urlString: String) -> BaseURLPrinter<Self> {
    guard let defaultRequestData = URLRequestData(string: urlString)
    else { fatalError("Invalid base URL: \(urlString.debugDescription)") }
    return BaseURLPrinter(defaultRequestData: defaultRequestData, upstream: self)
  }

  @inlinable
  public func baseRequestData(_ requestData: URLRequestData) -> BaseURLPrinter<Self> {
    BaseURLPrinter(defaultRequestData: requestData, upstream: self)
  }
}

public struct BaseURLPrinter<Upstream: ParserPrinter>: ParserPrinter
where Upstream.Input == URLRequestData {
  @usableFromInline
  let defaultRequestData: URLRequestData

  @usableFromInline
  let upstream: Upstream

  @usableFromInline
  init(defaultRequestData: URLRequestData, upstream: Upstream) {
    self.defaultRequestData = defaultRequestData
    self.upstream = upstream
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) rethrows -> Upstream.Output {
    try self.upstream.parse(&input)
  }

  @inlinable
  public func print(_ output: Upstream.Output, into input: inout URLRequestData) rethrows {
    try self.upstream.print(output, into: &input)
    if let scheme = self.defaultRequestData.scheme { input.scheme = scheme }
    if let user = self.defaultRequestData.user { input.user = user }
    if let password = self.defaultRequestData.password { input.password = password }
    if let host = self.defaultRequestData.host { input.host = host }
    input.headers.fields.merge(self.defaultRequestData.headers.fields) { $1 + $0 }
    input.path.prepend(contentsOf: self.defaultRequestData.path)
    input.query.fields.merge(self.defaultRequestData.query.fields) { $1 + $0 }
  }
}
