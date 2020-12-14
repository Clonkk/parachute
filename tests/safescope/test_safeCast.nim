discard """
  action: "reject"
"""
import ../commons

proc safeProc() =
  {.push tags:[] .}
  var x = 1222
  use_castTag(x)

safeProc()
