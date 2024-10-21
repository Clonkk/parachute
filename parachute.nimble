# Package

version       = "1.0.0"
author        = "Clonkk"
description   = "Basic nimble package that uses tags systen to track usage of addr, unsafeAddr and cast"
license       = "MIT"


# Dependencies

requires "nim >= 1.4.0"

task gendoc, "gen doc":
    exec("nimble doc --project src/parachute.nim --out:docs/")

task runtest, "Run all tests":
     exec "nim c -r --mm:orc tests/safeproc/test_addr.nim"
     exec "nim c -r --mm:orc tests/safeproc/test_safeCast.nim"
     exec "nim c -r --mm:orc tests/safeproc/test_unsafeAddr.nim"
     exec "nim c -r --mm:orc tests/safeproc/test_unsafeScope.nim"
     exec "nim c -r --mm:orc tests/safescope/test_addr.nim"
     exec "nim c -r --mm:orc tests/safescope/test_safeCast.nim"
     exec "nim c -r --mm:orc tests/safescope/test_unsafeAddr.nim"
     exec "nim c -r --mm:orc tests/safescope/test_unsafeScope.nim"
     exec "nim c -r --mm:orc tests/unsafe/test_allowUnsafe.nim"
