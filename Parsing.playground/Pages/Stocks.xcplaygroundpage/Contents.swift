import Parsing

// Inspired by https://github.com/Flight-School/RegularExpressionDecoder
// Let's build a parser for stock prices that are stored in plain text.

// This is the data structure that we want to parse into and print from. For
// example, the string "AAPL 170.69▲0.51" would parse into the value
//
//   Stock{symbol: AAPL, price: 170.69, sign: .gain, .change: 0.51}
//
// and then that value would print back into the string "AAPL 170.69▲0.51".
struct Stock {
  let symbol: String
  let price: Double
  let sign: Sign
  let change: Double

  enum Sign: String, CaseIterable {
    case gain = "▲"
    case unchanged = "="
    case loss = "▼"
  }
}

// Some domain specific parsers for dealing with stocker symbol and sign.
let symbol = Prefix(while: { $0 != " " })
  .map(String.fromSubsequence)
//let sign = Prefix(1)
//  .map(String.fromSubsequence)
//  .map(Stock.Sign.fromRawValue)
let sign = Stock.Sign.fromRawCase

// A parser for a single ticker line
let stock = symbol
  .skip(Prefix(while: \.isWhitespace).printing(" "))
  .take(Double.parser())
  .take(sign)
  .take(Double.parser())
  .map(Conversion.unsafeBitCast(to: Stock.init(symbol:price:sign:change:)))

// Try running the parser on a few sample stock strings.
print(stock.parse("AAPL 170.69▲0.51")!)
print(stock.parse("GOOG 1122.57▲2.41")!)
print(stock.parse("AMZN 1621.48▼18.52")!)
print(stock.parse("MSFT 106.57=0.00")!)

// Try printing a stock string from a Stock value.
stock.print(Stock(symbol: "FB", price: 100, sign: .loss, change: 90))!

// A parser for a full ticker by combining multiple stock parsers separated by newlines.
let ticker = Many(stock, separator: StartsWith("\n"))

// Parse an entire ticker stream.
ticker.parse("""
AAPL 170.69▲0.51
GOOG 1122.57▲2.41
AMZN 1621.48▼18.52
MSFT 106.57=0.00
""")

// Parse and then print the ticker stream to make sure we get the same thing back.
print(
  ticker.print(
    ticker.parse("""
    AAPL 170.69▲0.51
    GOOG 1122.57▲2.41
    AMZN 1621.48▼18.52
    MSFT 106.57=0.00
    """)!
    )!
)
