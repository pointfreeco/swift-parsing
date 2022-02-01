import Benchmark
import Parsing

/*
 This benchmark reproduces an HTTP parser from a Rust parser benchmark suite:

 https://github.com/rust-bakery/parser_benchmarks/tree/master/http

 In particular, it benchmarks the same HTTP header as that defined in `one_test`.
 */

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

extension Request {
  init(string: String) throws {
    let method = Prefix { $0.isToken }
      .map(Substring.init)

    let uri = Prefix { $0 != .init(ascii: " ") }
      .map(Substring.init)

    let httpVersion = Parse {
      "HTTP/".utf8
      Prefix { (.init(ascii: "0") ... .init(ascii: "9")).contains($0) || $0 == .init(ascii: ".") }
    }
    .map(Substring.init)

    let headerValue = Parse {
      Skip {
        Prefix(1...) { $0 == .init(ascii: " ") || $0 == .init(ascii: "\t") }
      }
      Prefix { $0 != .init(ascii: "\r") && $0 != .init(ascii: "\n") }
        .map(Substring.init)
      Skip {
        Newline()
      }
    }

    let header = Parse(Header.init(name:value:)) {
      Prefix { $0.isToken }.map(Substring.init)
      ":".utf8
      Many {
        headerValue
      }
    }

    let request = Parse(Request.init(method:uri:version:headers:)) {
      method
      " ".utf8
      uri
      " ".utf8
      httpVersion

      Parse {
        Newline()
        Many {
          header
        } terminator: {
          End()
        }
      }
    }

    self = try request.parse(string)
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
  suite.benchmark(
    name: "HTTP",
    run: { output = try Request(string: input) },
    tearDown: { precondition(output == expected) }
  )
}
