extension Parser {
  // FIXME: Symbol fails when referenced from `pointfreeco`/`isowords`
//  @inlinable
  public func print(_ output: Output) rethrows -> URLRequestData
  where Self: Printer, Input == URLRequestData {
    var request = URLRequestData()
    try self.print(output, to: &request)
    return request
  }
}
