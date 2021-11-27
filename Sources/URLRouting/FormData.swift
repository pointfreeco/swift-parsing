import Foundation

public struct FormData<FieldParsers>: Parser
where
  FieldParsers: Parser,
  FieldParsers.Input == [String: ArraySlice<Substring?>]
{
  @usableFromInline
  let fieldParsers: FieldParsers

  @inlinable
  public init(@ParserBuilder build: () -> FieldParsers) {
    self.fieldParsers = build()
  }

  @inlinable
  public func parse(_ input: inout ArraySlice<UInt8>) -> FieldParsers.Output? {
    var fields: FieldParsers.Input = String(decoding: input, as: UTF8.self)
      .split(separator: "&")
      .reduce(into: [:]) { fields, field in
        let pair = field
          .split(separator: "=", maxSplits: 1, omittingEmptySubsequences: false)
          .compactMap { $0.replacingOccurrences(of: "+", with: " ").removingPercentEncoding }
        let name = pair[0]
        let value = pair.count == 2 ? pair[1][...] : nil
        fields[name, default: []].append(value)
      }

    guard let output = self.fieldParsers.parse(&fields)
    else { return nil }

    input = .init(encoding: fields)
    return output
  }
}

extension FormData: Printer where FieldParsers: Printer {
  @inlinable
  public func print(_ output: FieldParsers.Output) -> ArraySlice<UInt8>? {
    self.fieldParsers.print(output).map(ArraySlice.init(encoding:))
  }
}

extension ArraySlice where Element == UInt8 {
  @usableFromInline
  init(encoding fields: [String: ArraySlice<Substring?>]) {
    self.init(
      fields
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
