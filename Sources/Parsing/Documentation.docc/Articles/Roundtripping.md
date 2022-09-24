# Round-tripping

An important property that parser-printers must satisfy in order to guarantee that large, complex
parser-printers build from simpler ones will behave as you expect.

A parser printer `p` is said to be round-tripping if:

For every `input` for which `p.parse(input)` does not throw, `p.print(p.parse(input))` is equal to
`input`.

And:

For every `output` for which `p.print(output)` does not throw, `p.parse(p.print(output))` is equal
to `output`.
