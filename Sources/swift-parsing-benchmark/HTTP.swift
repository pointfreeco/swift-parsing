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
}

private struct Header: Equatable {
  let name: Substring
  let value: [Substring]
}

private struct Method: ParserPrinter {
  var body: some ParserPrinter<Substring.UTF8View, Substring> {
    ParsePrint(.substring) { Prefix { $0.isToken } }
  }
}

private struct URI: ParserPrinter {
  var body: some ParserPrinter<Substring.UTF8View, Substring> {
    ParsePrint(.substring) { Prefix { $0 != .init(ascii: " ") } }
  }
}

private struct HTTPVersion: ParserPrinter {
  var body: some ParserPrinter<Substring.UTF8View, Substring> {
    ParsePrint(.substring) {
      "HTTP/".utf8
      Prefix { $0.isVersion }
    }
  }
}

private struct RequestLine: ParserPrinter {
  var body: some ParserPrinter<Substring.UTF8View, Request> {
    ParsePrint(.memberwise(Request.init(method:uri:version:))) {
      Method()
      " ".utf8
      URI()
      " ".utf8
      HTTPVersion()
      Newline()
    }
  }
}

private struct HeaderValue: ParserPrinter {
  var body: some ParserPrinter<Substring.UTF8View, Substring> {
    ParsePrint(.substring) {
      Skip {
        Prefix(1...) { $0.isHorizontalSpace }
      }
      .printing(" ".utf8)
      Prefix { !$0.isNewline }
      Newline()
    }
  }
}

private extension Header {
  static func parser() -> some ParserPrinter<Substring.UTF8View, Self> {
    ParsePrint(.memberwise(Self.init)) {
      Prefix { $0.isToken }.map(.substring)
      ":".utf8
      Many {
        HeaderValue()
      }
    }
  }
}

private extension Request {
  static func parser() -> some ParserPrinter<Substring.UTF8View, (Self, [Header])> {
    ParsePrint {
      RequestLine()
      Many {
        Header.parser()
      }
    }
  }
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
