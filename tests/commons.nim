# Remove addr from scope
import system except addr, unsafeAddr
import parachute

# Beware, openParachute replace addr and unsafeAddr
# template addr = parachute.addr
# template unsafeAddr = parachute.unsafeAddr
openParachute()

proc use_addr*(x : var seq[int])=
  let y = addr(x[0])
  echo y.repr

proc use_unsafeAddr*(x : var seq[int])=
  let y = unsafeAddr(x)
  echo y.repr

proc use_safeCast*(x: var int) =
  let y = safeCast[float](x)
  echo y

proc use_unsafeTemplate*(x: string) =
  unsafe:
    echo "This is echo from unsafe zone"
    echo x


