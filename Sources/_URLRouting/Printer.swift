extension Parser where Self: Printer, Input == URLRequestData {
  @inlinable
  public func print(_ output: Output) rethrows -> URLRequestData {
    var request = URLRequestData()
    try self.print(output, to: &request)
    return request
  }
}
