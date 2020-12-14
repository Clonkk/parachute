discard """
  action: "reject"
"""
import parachute
import ../commons

proc safeProc() =
  safe:
    var x = @[1, 2, 3]
    use_addr(x)
