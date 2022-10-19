
template `:=`* [T] (a: untyped, b: T): T =
  ##[
    walrus operator
  ]##
  runnableExamples:
    func newValue(): int = 5
    block:
      var x = newValue()
      if x in 0..10:
        echo x, " is correct!"

    block:
      if (x:=newValue()) in 0..10:
        echo x, " is correct!"

  var `a` {.inject.} = `b`
  b


when isMainModule:
  echo a := 1
  echo b := "100"
  type Obj = object
    a: int
  echo c := Obj(a: 1)
