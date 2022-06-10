import Benchmark
import Parsing

/// This benchmark reproduces an HTTP parser from [a Rust parser benchmark suite][rust-parser].
///
/// [rust-parser]: https://github.com/rust-bakery/parser_benchmarks/tree/master/http
///
/// In particular, it benchmarks the same HTTP header as that defined in `one_test`.
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
  let expected = Request(
    method: "GET",
    uri: "/",
    version: "1.1",
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
  var output: Request!

  suite.benchmark("HTTP") {
    var input = input[...].utf8
    output = try Request.parser().parse(&input)
  } tearDown: {
    precondition(output == expected)
    precondition(Substring(try! Request.parser().print(output)) == input)
  }
}

private struct Request: Equatable {
  let method: Substring
  let uri: Substring
  let version: Substring
  let headers: [Header]
}

private struct Header: Equatable {
  let name: Substring
  let value: [Substring]
}

extension Request {
  @ParserBuilder
  static func parser() -> some ParserPrinter<Substring.UTF8View, Self> {
    ParsePrint(.memberwise(Request.init(method:uri:version:headers:))) {
      // Method, e.g. "GET"
      Prefix { $0.isToken }.map(.substring)
      " ".utf8
      // URI, e.g. "/"
      Prefix { $0 != .init(ascii: " ") }.map(.substring)
      " HTTP/".utf8
      // Version, e.g. "1"
      Prefix { $0.isVersion }.map(.substring)
      Whitespace(1, .vertical)
      Many {
        ParsePrint(.memberwise(Header.init(name:value:))) {
          // Header name, e.g. "Content-Type"
          Prefix { $0.isToken }.map(.substring)
          ":".utf8
          // Header value
          Many {
            Whitespace(1..., .horizontal)
              .printing(" ".utf8)
            Prefix { !$0.isNewline }.map(.substring)
            Whitespace(1, .vertical)
          }
        }
      }
    }
  }
}

extension UTF8.CodeUnit {
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
