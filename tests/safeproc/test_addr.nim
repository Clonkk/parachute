discard """
  action: "reject"
"""
import ../commons

proc safeProc() {.tags:[].} =
  var x = @[1, 2, 3]
  use_addr(x)
