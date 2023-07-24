import Benchmark
import Foundation
import Parsing

#if swift(>=5.8)
  struct DateTime: Parser {
    var body: some Parser<Substring.UTF8View, Date> {
      Parse(Date.init(year:month:day:hour:minute:second:nanosecond:timeZone:)) {
        Digits(4)
        "-".utf8
        Digits(2).filter { (1...12).contains($0) }
        "-".utf8
        Digits(2).filter { (1...31).contains($0) }
        "T".utf8
        Digits(2).filter { $0 < 24 }
        ":".utf8
        Digits(2).filter { $0 < 60 }
        ":".utf8
        Digits(2).filter { $0 <= 60 }
        Parse {
          ".".utf8
          Prefix(1...9, while: (UInt8(ascii: "0")...UInt8(ascii: "9")).contains)
            .compactMap { n in Int(Substring(n)).map { $0 * Int(pow(10, 9 - Double(n.count))) } }
        }
        .replaceError(with: 0)
        OneOf {
          "Z".utf8.map { 0 }
          Parse {
            OneOf {
              "+".utf8.map { 1 }
              "-".utf8.map { -1 }
            }
            Digits(2).filter { $0 < 24 }.map { $0 * 60 * 60 }
            ":".utf8
            Digits(2).filter { $0 < 60 }.map { $0 * 60 }
          }
          .map { $0 * ($1 + $2) }
        }
      }
    }
  }

  extension Date {
    fileprivate init(
      year: Int,
      month: Int,
      day: Int,
      hour: Int,
      minute: Int,
      second: Int,
      nanosecond: Int,
      timeZone: Int
    ) {
      var components = tm(
        tm_sec: Int32(second),
        tm_min: Int32(minute),
        tm_hour: Int32(hour),
        tm_mday: Int32(day),
        tm_mon: Int32(month - 1),
        tm_year: Int32(year - 1900),
        tm_wday: 0,
        tm_yday: 0,
        tm_isdst: 0,
        tm_gmtoff: 0,
        tm_zone: nil
      )
      let time = timegm(&components)
      var timeIntervalSince1970 = TimeInterval(time - timeZone)
      timeIntervalSince1970 += TimeInterval(nanosecond) / 1_000_000_000
      self.init(timeIntervalSince1970: timeIntervalSince1970)
    }
  }
#endif

/// This benchmarks implements an [RFC-3339-compliant](https://www.ietf.org/rfc/rfc3339.txt) date
/// parser in a relatively naive way and pits it against `DateFormatter` and `ISO8601DateFormatter`.
///
/// Not only is the parser faster than both formatters, it is more flexible and accurate: it will
/// parse fractional seconds and time zone offsets automatically, and it will parse to the
/// nanosecond, while the formatters do not parse beyond the millisecond.
let dateSuite = BenchmarkSuite(name: "Date") { suite in
  #if swift(>=5.8)
    let input = "1979-05-27T00:32:00Z"
    let expected = Date(timeIntervalSince1970: 296_613_120)
    var output: Date!

    suite.benchmark("Parser") {
      output = try DateTime().parse(input)
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
