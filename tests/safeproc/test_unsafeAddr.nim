discard """
  action: "reject"
"""
import ../commons

# Forbid unsafe usage
proc safeProc() {.tags:[].} =
  var x = @[1, 2, 3]
  use_unsafeAddr(x)
