discard """
  action: "reject"
"""
import ../../parachute
import ../commons

proc unsafeProc() =
  unsafe:
    echo "This is unsafe"

# Forbid unsafe usage
proc safeProc() {.forbids:[Unsafe].} =
  unsafeProc()

safeProc()
