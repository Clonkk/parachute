import macros
type Unsafe* = object

template unsafe*(body) =
  ## Mark the outer scope as unsafe
  {.push tags:[Unsafe] .}
  body
  {.pop.}

proc addrTag*[T](x: var T): ptr T {.tags: [Unsafe].}=
  ## Used exactly like ``addr``
  result = system.addr(x)

proc unsafeAddrTag*[T](x: var T): ptr T {.tags: [Unsafe].}=
  ## Used exactly like ``unsafeAddr``
  result = system.unsafeAddr(x)

# No choice but to use this one explicitly
template castTag*[T](expr) : T =
  ## Used exactly like ``cast``
  runnableExamples:
    var x : int = 123456789
    let y = castTag[float](x)

  {.push tags:[Unsafe] .}
  let res = cast[T](expr)
  {.pop.}
  res

macro openParachute*() : untyped =
  runnableExamples:
    # Used to replace addr and unsafeAddr
    import system except addr
    import parachute
    openParachute

  result = newStmtList()
  result.add quote do:
    template addr(x) : untyped =
      parachute.addrTag(x)
    template unsafeAddr(x) : untyped =
      parachute.unsafeAddrTag(x)
