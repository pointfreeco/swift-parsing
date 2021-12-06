public struct Host<Upstream>: Parser
where
Upstream: Parser,
Upstream.Input == Substring
{
  @Environment(\.host) var defaultHost
  public let upstream: Upstream

  public init(_ upstream: Upstream) {
    self.upstream = upstream
  }

  public func parse(_ input: inout URLRequestData) -> Upstream.Output? {
    guard var host = input.host
    else { return nil }
    let output = upstream.parse(&host)
    input.host = host
    return output
  }
}

extension Host: Printer
where
  Upstream: Printer
{
  public func print(_ output: Upstream.Output) -> URLRequestData? {
    if let host = self.defaultHost {
      return URLRequestData(host: host[...])
    }
    return self.upstream.print(output).map { URLRequestData(host: $0) }
  }
}


private enum HostKey: EnvironmentKey {
  static var value = String?.none
}
extension EnvironmentValues {
  public var host: String? {
    get { self[HostKey.self] }
    set { self[HostKey.self] = newValue }
  }
}
