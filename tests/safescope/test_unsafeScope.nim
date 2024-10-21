discard """
  action: "reject"
"""
import ../commons

proc safeProc() {.forbirds:[Unsafe].} =
  var x = "123"
  use_unsafeTemplate(x)

safeProc()
