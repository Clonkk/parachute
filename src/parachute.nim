import macros
type Unsafe* = object

template unsafe*(body) =
  {.push tags:[Unsafe] .}
  body
  {.pop.}

template safe*(body) =
  {.push tags:[] .}
  body
  {.pop.}

proc addrTagged*[T](x: var T): ptr T {.tags: [Unsafe].}=
  result = system.addr(x)

proc unsafeAddrTagged*[T](x: var T): ptr T {.tags: [Unsafe].}=
  result = system.unsafeAddr(x)


# No choise but to rename since cast a reserved word
template castTagged*[T](expr) : T =
  {.push tags:[Unsafe] .}
  let res = cast[T](expr)
  {.pop.}
  res

template addr* = addr_tagged
template unsafeAddr* = unsafeAddr_tagged

macro openParachute*() : untyped =
  result = newStmtList()

  result.add quote do:
    template addr = parachute.safeAddr
    template unsafeAddr = parachute.unsafeAddr
