import Benchmark
import Parsing

/// This benchmark reproduces an HTTP parser from [a Rust parser benchmark suite][rust-parser].
///
/// [rust-parser]: https://github.com/rust-bakery/parser_benchmarks/tree/master/http
///
/// In particular, it benchmarks the same HTTP header as that defined in `one_test`.
let httpSuite = BenchmarkSuite(name: "HTTP") { suite in
  let method = ParsePrint(.substring) { Prefix { $0.isToken } }

  let uri = ParsePrint(.substring) { Prefix { $0 != .init(ascii: " ") } }

  let httpVersion = ParsePrint(.substring) {
    "HTTP/".utf8
    Prefix { $0.isVersion }
  }

  let requestLine = ParsePrint(.struct(Request.init(method:uri:version:))) {
    method
    " ".utf8
    uri
    " ".utf8
    httpVersion
    Newline()
  }

  let headerValue = ParsePrint(.substring) {
    Skip {
      Prefix(1...) { $0.isHorizontalSpace }
    }
    .printing(" ".utf8)
    Prefix { $0.isNewline }
    Newline()
  }

  let header = ParsePrint(.struct(Header.init(name:value:))) {
    Prefix { $0.isToken }.map(.substring)
    ":".utf8
    Many {
      headerValue
    }
  }

  let request = ParsePrint {
    requestLine
    Many {
      header
    }
  }

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
    Request(
      method: "GET",
      uri: "/",
      version: "1.1"
    ),
    headers: [
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

  suite.benchmark("HTTP") {
    var input = input[...].utf8
    output = try request.parse(&input)
  } tearDown: {
    precondition(output == expected)
    precondition(Substring(try! request.print(output)) == input)
  }
}

private struct Request: Equatable {
  let method: Substring
  let uri: Substring
  let version: Substring
}

private struct Header: Equatable {
  let name: Substring
  let value: [Substring]
}

extension UTF8.CodeUnit {
  fileprivate var isHorizontalSpace: Bool {
    self == .init(ascii: " ") || self == .init(ascii: "\t")
  }

  fileprivate var isNewline: Bool {
    self == .init(ascii: "\n") || self == .init(ascii: "\r")
  }

  fileprivate var isToken: Bool {
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

  fileprivate var isVersion: Bool {
    (.init(ascii: "0") ... .init(ascii: "9")).contains(self) || self == .init(ascii: ".")
  }
}
