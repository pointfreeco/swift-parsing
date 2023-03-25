import Benchmark
import Foundation
import Parsing

/// This benchmarks implements an [RFC-3339-compliant](https://www.ietf.org/rfc/rfc3339.txt) date
/// parser in a relatively naive way and pits it against `DateFormatter` and `ISO8601DateFormatter`.
///
/// Not only is the parser faster than both formatters, it is more flexible and accurate: it will
/// parse fractional seconds and time zone offsets automatically, and it will parse to the
/// nanosecond, while the formatters do not parse beyond the millisecond.
let dateSuite = BenchmarkSuite(name: "Date") { suite in
#if swift(>=5.8)
  struct DateTime: Parser {
    var body: some Parser<Substring.UTF8View, DateComponents> {
      Parse { year, month, day, hour, minute, second, nanosecond, timeZone in
        DateComponents(
          timeZone: timeZone,
          year: year,
          month: month,
          day: day,
          hour: hour,
          minute: minute,
          second: second,
          nanosecond: nanosecond
        )
      } with: {
        Digits(4)
        "-".utf8
        Digits(2)
        "-".utf8
        Digits(2)
        "T".utf8
        Digits(2)
        ":".utf8
        Digits(2)
        ":".utf8
        Digits(2)
        Optionally {
          ".".utf8
          Prefix(1...9, while: (UInt8(ascii: "0")...UInt8(ascii: "9")).contains)
            .compactMap { n in Int(Substring(n)).map { $0 * Int(pow(10, 9 - Double(n.count))) } }
        }
        OneOf {
          "Z".utf8.map { 0 }
          Parse {
            OneOf {
              "+".utf8.map { 1 }
              "-".utf8.map { -1 }
            }
            Digits(2).map { $0 * 60 }
            ":".utf8
            Digits(2)
          }
          .map { $0 * ($1 + $2) }
        }
        .map { TimeZone(secondsFromGMT: $0) }
      }
    }
  }

  let input = "1979-05-27T00:32:00Z"
  let expected = Date(timeIntervalSince1970: 296_613_120)
  var output: Date!

  let dateTimeParser = DateTime().compactMap(Calendar.current.date(from:))
  suite.benchmark("Parser") {
    var input = input[...].utf8
    output = try dateTimeParser.parse(&input)
  } tearDown: {
    precondition(output == expected)
  }

  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
  dateFormatter.locale = Locale(identifier: "en_US_POSIX")
  dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)!
  suite.benchmark("DateFormatter") {
    output = dateFormatter.date(from: input)
  } tearDown: {
    precondition(output == expected)
  }

  if #available(macOS 10.12, *) {
    let iso8601DateFormatter = ISO8601DateFormatter()
    iso8601DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    suite.benchmark("ISO8601DateFormatter") {
      output = iso8601DateFormatter.date(from: input)
    } tearDown: {
      precondition(output == expected)
    }
  }
  #endif
}
