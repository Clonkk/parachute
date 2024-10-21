discard """
  action: "reject"
"""
import ../commons

proc safeProc() {.forbids: [Unsafe].}=
  var x = @[1, 2, 3]
  use_addr(x)

safeProc()
