discard """
  action: "compile"
"""
import ../../parachute
import ../commons

# Normal code
proc classicProc() =
  block:
    var x = @[1, 2, 3]
    use_addr(x)

  block:
    var x = @[1, 2, 3]
    use_unsafeAddr(x)

  block:
    var x = 14
    use_castTag(x)

  block:
    var x ="123"
    use_unsafeTemplate(x)

# Explicitly unsafe code
proc explicitUnsafeProc() {.tags: [Unsafe].} =
  block:
    var x = @[1, 2, 3]
    use_unsafeAddr(x)

  block:
    var x = 14
    use_castTag(x)

  block:
    var x ="123"
    use_unsafeTemplate(x)

classicProc()
explicitUnsafeProc()
