# Package

version       = "0.1.0"
author        = "Clonkk"
description   = "Nimnle package that uses tags to trrack usage of addr, unsafeAddr and cast"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.4.0"

task gendoc, "gen doc":
    exec("nimble doc --project src/parachute.nim --out:docs/")
