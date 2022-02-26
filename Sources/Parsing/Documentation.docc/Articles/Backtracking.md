# Backtracking

Learn what backtracking is, how it affects the performance of your parsers, and how to avoid it 
when unnecessary.

## Backtracking

Backtracking is the process of restoring an input to its original value when parsing fails. It can 
be very useful, but doing it can cause parsers' logic to be more complicated than necessary, and
backtracking too much can cause performance issues. For this reason, most parsers are not required 
to backtrack, and can therefore fail _and_ still consume from the input.

The primary way to make use of backtracking in your parsers is through the `OneOf` parser, which
tries many parsers on an input choosing the first that succeeds.



, and the `Optionally` parser, which
tries a parser and coalesces any failures into a `nil` output. Both of these parsers backtrack 

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
particular, the first integer will get parsed twice, unnecessarily repeating that work. On the 
other hand, we can factor out the common work of the parser and localize the backtracking `OneOf` 
work to make a much more performant parser:

```swift
Parse {
  Int.parser()
  OneOf { "-"; "/" }
  Int.parser()
}
```
