discard """
  action: "reject"
"""
import ../commons

# Forbid unsafe usage
proc safeProc() {.forbids:[Unsafe].} =
  var x = 123456789
  use_castTag(x)

safeProc()
