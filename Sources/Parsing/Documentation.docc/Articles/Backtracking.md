# Backtracking

Learn what backtracking is, how it affects the performance of your parsers, and how to avoid it 
when unnecessary.

## Overview

Backtracking is the process of restoring an input to its original value when parsing fails. It can 
be very useful, but doing it can cause parsers' logic to be more complicated than necessary, and
backtracking too much can cause performance issues. For this reason, most parsers are not required 
to backtrack, and can therefore fail _and_ still consume from the input.

The primary way to make use of backtracking in your parsers is through the ``OneOf`` parser, which
tries many parsers on an input choosing the first that succeeds. This allows you to try many parsers
on the same input, regardless of how much each parser consumes:

```swift
enum Currency { case eur, gbp, usd }

let currency = OneOf {
  "€".map { Currency.eur }
  "£".map { Currency.gbp }
  "$".map { Currency.usd }
}
```

## Performance

If used naively, backtracking can lead to less performant parsing code. For example, if we wanted to
parse two integers from a string that were separated by either a dash "-" or slash "/", then we 
could write this as:

```swift
OneOf {
  Parse { Int.parser(); "-"; Int.parser() } // 1️⃣
  Parse { Int.parser(); "/"; Int.parser() } // 2️⃣
}
```

However, parsing slash-separated integers is not going to be performant because it will first run 
the entire 1️⃣ parser until it fails, then backtrack to the beginning, and run the 2️⃣ parser. In 
particular, the first integer will get parsed twice, unnecessarily repeating that work. 

On the  other hand, we can factor out the common work of the parser and localize the backtracking 
``OneOf`` work to make a much more performant parser:

```swift
Parse {
  Int.parser()
  OneOf { "-"; "/" }
  Int.parser()
}
```

We can even write a benchmark to measure the performance difference:

```swift
let first = OneOf {
  Parse { Int.parser(); "-"; Int.parser() }
  Parse { Int.parser(); "/"; Int.parser() }
}
benchmark("First") {
  precondition(try! first.parse("100/200") == (100, 200))
}
let second = Parse {
  Int.parser()
  OneOf { "-"; "/" }
  Int.parser()
}
benchmark("Second") {
  precondition(try! second.parse("100/200") == (100, 200))
}
```

Running this produces the following results:

```
running First... done! (1527.00 ms)
running Second... done! (1075.69 ms)

name   time        std        iterations
----------------------------------------
First  1500.000 ns ±  19.75 %     856753
Second  917.000 ns ±  15.89 %    1000000
Program ended with exit code: 0
```

The second parser takes only 60% of the time to run that the first parser does.
