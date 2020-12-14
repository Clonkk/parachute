discard """
  action: "reject"
"""
import parachute
import ../commons


proc safeProc() =
  safe:
    var x = "123"
    use_unsafeTemplate(x)
