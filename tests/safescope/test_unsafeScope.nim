discard """
  action: "reject"
"""
import ../commons

proc safeProc() =
  {.push tags:[] .}
  var x = "123"
  use_unsafeTemplate(x)

safeProc()
