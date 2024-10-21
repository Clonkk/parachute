discard """
  action: "reject"
"""
import ../commons

proc safeProc() {.forbids:[Unsafe].}=
  var x = 1222
  use_castTag(x)

safeProc()

