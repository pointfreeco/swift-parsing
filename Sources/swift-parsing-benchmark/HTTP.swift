import Benchmark
import Parsing

/// This benchmark reproduces an HTTP parser from [a Rust parser benchmark suite][rust-parser].
///
/// [rust-parser]: https://github.com/rust-bakery/parser_benchmarks/tree/master/http
///
/// In particular, it benchmarks the same HTTP header as that defined in `one_test`.
let httpSuite = BenchmarkSuite(name: "HTTP") { suite in
  #if swift(>=5.8)
    struct RequestParser: ParserPrinter {
      var body: some ParserPrinter<Substring.UTF8View, Request> {
        let newline = OneOf {
          "\r\n".utf8
          "\n".utf8
        }
        let token = Prefix { $0.isToken }.map(.substring)

        ParsePrint(.memberwise(Request.init(method:uri:version:headers:))) {
          token
          " ".utf8
          ParsePrint(.substring) { Prefix { $0 != UInt8(ascii: " ") } }
          " HTTP/".utf8
          Prefix { $0.isVersion }.map(.substring)
          newline
          Many(1...) {
            ParsePrint(.memberwise(Header.init(name:value:))) {
              token
              ":".utf8
              Many(1...) {
                Skip { Prefix(1...) { $0.isHorizontalWhitespace } }.printing(" ".utf8)
                Prefix { !$0.isNewline }.map(.substring)
                newline
              }
            }
          }
        }
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
    let parser = RequestParser()

    suite.benchmark("HTTP") {
      var input = input[...].utf8
      output = try parser.parse(&input)
    } tearDown: {
      precondition(output == expected)
      precondition(Substring(try! parser.print(output)) == input)
    }
  #endif
}

private struct Header: Equatable {
  let name: Substring
  let value: [Substring]
}

private struct Request: Equatable {
  let method: Substring
  let uri: Substring
  let version: Substring
  let headers: [Header]
}

extension UTF8.CodeUnit {
  fileprivate var isHorizontalWhitespace: Bool {
    self == Self(ascii: " ") || self == Self(ascii: "\t")
  }

  fileprivate var isNewline: Bool {
    self == Self(ascii: "\n") || self == Self(ascii: "\r")
  }

  fileprivate var isToken: Bool {
    switch self {
    case 128...,
      ...31,
      Self(ascii: "("),
      Self(ascii: ")"),
      Self(ascii: "<"),
      Self(ascii: ">"),
      Self(ascii: "@"),
      Self(ascii: ","),
      Self(ascii: ";"),
      Self(ascii: ":"),
      Self(ascii: "\\"),
      Self(ascii: "'"),
      Self(ascii: "/"),
      Self(ascii: "["),
      Self(ascii: "]"),
      Self(ascii: "?"),
      Self(ascii: "="),
      Self(ascii: "{"),
      Self(ascii: "}"),
      Self(ascii: " "):
      return false
    default:
      return true
    }
  }

  fileprivate var isVersion: Bool {
    (Self(ascii: "0")...Self(ascii: "9")).contains(self) || self == Self(ascii: ".")
  }
}
