# Remove addr from scope since it can't be overloaded
import ../parachute
# Replace addr & unsafeAddr
# Since cast is a keyword of the language it is impossible to replace it
openParachute()

proc use_addr*(x : var seq[int])=
  let y = addr(x[0])
  echo y.repr

proc use_unsafeAddr*(x : var seq[int])=
  let y = unsafeAddr(x)
  echo y.repr

proc use_castTag*(x: var int) =
  let y = castTag[float](x)
  echo y

proc use_unsafeTemplate*(x: string) =
  unsafe:
    echo "This is echo from unsafe zone"
    echo x

