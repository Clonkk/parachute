## Tracking unsafe operation (so far ``addr``, ``cast``, ``unsafeAddr``), using Tags.
##
## Read more about `tag tracking <https://nim-lang.org/docs/manual.html#effect-system-tag-tracking>`_ .
##
## There are some more advanced examples in the tests.

import macros

type
  Unsafe* = object ## Type defined to be used with ``tags``, in order to track the Unsafe tags through procedure.
                   ##
                   ## .. code-block:: nim
                   ##   proc unsafeproc() {.tags: [Unsafe].} =
                   ##     # do unsafe stuff...
                   ##     discard
                   ##
                   ## Tracking tags that are not ``Unsafe`` or no tag at all will explicitly prevent the usage of the tag ``Unsafe`` during compilation.
                   ##
                   ## .. code-block:: nim
                   ##   proc procThatForbidUnsafeCode() {.tags: [].} =
                   ##     # Cannot call proc with the tag ``Unsafe`` here
                   ##     discard

proc addrTag*[T](x: var T): ptr T {.tags: [Unsafe].} =
  ## Used exactly like ``addr``.
  result = system.addr(x)

proc unsafeAddrTag*[T](x: T): ptr T {.tags: [Unsafe].} =
  ## Used exactly like ``unsafeAddr``.
  result = system.addr(x)

# No choice but to use this one explicitly
template castTagImpl[T](expr): T =
  let res = cast[T](expr)
  res

proc castTag*[T](expr: auto): T {.tags: [Unsafe]}=
  ## Used exactly like ``cast``
  runnableExamples:
    var x: int = 123456789
    let y = castTag[float](x)

  castTagImpl[T](expr)

macro openParachute*(): untyped =
  runnableExamples:
    # Used to replace addr and unsafeAddr
    import system except addr
    import parachute
    openParachute

  result = newStmtList()
  result.add quote do:
    template addr(x): untyped =
      parachute.addrTag(x)

    template unsafeAddr(x): untyped =
      parachute.unsafeAddrTag(x)
