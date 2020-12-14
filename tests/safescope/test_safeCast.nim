discard """
  action: "reject"
"""
import parachute
import ../commons

proc safeProc() =
  safe:
    var x = 1222
    use_safeCast(x)
