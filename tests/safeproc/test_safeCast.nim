discard """
  action: "reject"
"""
import ../commons

# Forbid unsafe usage
proc safeProc() {.tags:[].} =
  var x = 123456789
  use_safeCast(x)
