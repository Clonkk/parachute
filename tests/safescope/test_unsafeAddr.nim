discard """
  action: "reject"
"""
import ../commons

proc safeProc() =
  {.push tags:[] .}
  var x = @[1, 2, 3]
  use_unsafeAddr(x)

safeProc()
