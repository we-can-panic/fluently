discard """
  exitcode: 0
"""

include ../fluently/procs

import unittest


block:
  procs:
    plus1 (a, b: int): int
    minus1 (a, b: int): int = a - b

  proc plus1 (a, b: int): int = a + b

  check 1.plus1(1) == 2
  check 1.minus1(1) == 0


block:
  funcs:
    plus2 (a, b: int): int
    minus2 (a, b: int): int = a - b

  funcs:
    plus2 (a, b: int): int = a + b

  check plus2()


type
  Number = object
    a, b: int


block:
  procs Number:
    plus3 (a: Number): int
    minus3 (_: type Number, a, b: int): int = a - b

  proc plus3(a: Number): int = a.a + a.b

  expect ProcTypeError:
    procs Number:
      eeee (a: int) = echo a


  funcs Number:
    plus4 (a: Number): int
    minus4 (a, b: int): int =
      a - b

  funcs Number:
    plus4 (a: Number): int = a.a + a.b