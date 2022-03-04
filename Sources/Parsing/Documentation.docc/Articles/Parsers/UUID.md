# UUID

A parser that consumes a `UUID` value from the beginning of a string.

For example:

```swift
Parse {
  UUID.parser()
  ","
  Bool.parser()
}
.parse("deadbeef-dead-beef-dead-beefdeadbeef,true") // (UUID(deadbeef-dead-beef-dead-beefdeadbeef), true)
```
