import Benchmark
import Parsing

/*
 This benchmark reproduces an HTTP parser from a Rust parser benchmark suite:

 https://github.com/rust-bakery/parser_benchmarks/tree/master/http

 In particular, it benchmarks the same HTTP header as that defined in `one_test`.
 */

private struct Request: Equatable {
  let method: String
  let uri: String
  let version: String
}

private struct Header: Equatable {
  let name: String
  let value: [String]
}

private extension UTF8.CodeUnit {
  var isToken: Bool {
    switch self {
    case 128...,
      ...31,
      .init(ascii: "("),
      .init(ascii: ")"),
      .init(ascii: "<"),
      .init(ascii: ">"),
      .init(ascii: "@"),
      .init(ascii: ","),
      .init(ascii: ";"),
      .init(ascii: ":"),
      .init(ascii: "\\"),
      .init(ascii: "'"),
      .init(ascii: "/"),
      .init(ascii: "["),
      .init(ascii: "]"),
      .init(ascii: "?"),
      .init(ascii: "="),
      .init(ascii: "{"),
      .init(ascii: "}"),
      .init(ascii: " "):
      return false
    default:
      return true
    }
  }
}

// MARK: - Parsers

private let method = Prefix { $0.isToken }
  .map { String(decoding: $0, as: UTF8.self) }

private let uri = Prefix { $0 != .init(ascii: " ") }
  .map { String(decoding: $0, as: UTF8.self) }

private let httpVersion = Parse {
  "HTTP/".utf8
  Prefix { (.init(ascii: "0") ... .init(ascii: "9")).contains($0) || $0 == .init(ascii: ".") }
}
.map { String(decoding: $0, as: UTF8.self) }

private let requestLine = Parse(Request.init(method:uri:version:)) {
  method
  " ".utf8
  uri
  " ".utf8
  httpVersion
  Newline()
}

private let headerValue = Parse {
  Skip {
    Prefix(1...) { $0 == .init(ascii: " ") || $0 == .init(ascii: "\t") }
  }
  Prefix { $0 != .init(ascii: "\r") && $0 != .init(ascii: "\n") }
    .map { String(decoding: $0, as: UTF8.self) }
  Skip {
    Newline()
  }
}

private let header = Parse(Header.init(name:value:)) {
  Prefix { $0.isToken }.map { String(decoding: $0, as: UTF8.self) }
  ":".utf8
  Many {
    headerValue
  }
}

private let request = Parse {
  requestLine
  Many {
    header
  } terminator: {
    End()
  }
}

let httpSuite = BenchmarkSuite(name: "HTTP") { suite in
  let input = """
    GET / HTTP/1.1
    Host: www.reddit.com
    User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:15.0) Gecko/20100101 Firefox/15.0.1
    Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
    Accept-Language: en-us,en;q=0.5
    Accept-Encoding: gzip, deflate
    Connection: keep-alive

    """
  let expected = (
    Request(method: "GET", uri: "/", version: "1.1"),
    [
      Header(name: "Host", value: ["www.reddit.com"]),
      Header(
        name: "User-Agent",
        value: [
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:15.0) Gecko/20100101 Firefox/15.0.1"
        ]
      ),
      Header(
        name: "Accept",
        value: ["text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"]
      ),
      Header(name: "Accept-Language", value: ["en-us,en;q=0.5"]),
      Header(name: "Accept-Encoding", value: ["gzip, deflate"]),
      Header(name: "Connection", value: ["keep-alive"]),
    ]
  )
  var output: (Request, [Header])!
  suite.benchmark(
    name: "HTTP",
    run: { output = try request.parse(input) },
    tearDown: { precondition(output == expected) }
  )
}
