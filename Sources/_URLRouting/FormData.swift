import Foundation

/// Parser form-encoded data using field parsers.
public struct FormData<FieldParsers: Parser>: Parser
where FieldParsers.Input == URLRequestData.Fields {
  @usableFromInline
  let fieldParsers: FieldParsers

  @inlinable
  public init(@ParserBuilder build: () -> FieldParsers) {
    self.fieldParsers = build()
  }

  @inlinable
  public func parse(_ input: inout Data) rethrows -> FieldParsers.Output {
    var fields: FieldParsers.Input = String(decoding: input, as: UTF8.self)
      .split(separator: "&")
      .reduce(into: .init([:], isNameCaseSensitive: true)) { fields, field in
        let pair =
          field
          .split(separator: "=", maxSplits: 1, omittingEmptySubsequences: false)
          .compactMap { $0.replacingOccurrences(of: "+", with: " ").removingPercentEncoding }
        let name = pair[0]
        let value = pair.count == 2 ? pair[1][...] : nil
        fields[name, default: []].append(value)
      }

    let output = try self.fieldParsers.parse(&fields)

    input = .init(encoding: fields)
    return output
  }
}

extension FormData: ParserPrinter where FieldParsers: ParserPrinter {
  @inlinable
  public func print(_ output: FieldParsers.Output, into input: inout Data) rethrows {
    var fields = URLRequestData.Fields()
    try self.fieldParsers.print(output, into: &fields)
    input = .init(encoding: fields)
  }
}

extension Data {
  @usableFromInline
  init(encoding fields: URLRequestData.Fields) {
    self.init(
      fields
        .sorted(by: { $0.key < $1.key })
        .flatMap { pair -> [String] in
          let (name, values) = pair
          guard let name = name.addingPercentEncoding(withAllowedCharacters: .urlQueryParamAllowed)
          else { return [] }

          return values.compactMap { value in
            guard let value = value
            else { return name }

            guard
              let value = value.addingPercentEncoding(withAllowedCharacters: .urlQueryParamAllowed)
            else { return nil }

            return "\(name)=\(value)"
          }
        }
        .joined(separator: "&")
        .utf8
    )
  }
}

extension CharacterSet {
  @usableFromInline
  static let urlQueryParamAllowed = CharacterSet
    .urlQueryAllowed
    .subtracting(Self(charactersIn: ":#[]@!$&'()*+,;="))
}
