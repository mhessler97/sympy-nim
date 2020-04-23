import macroutils
import macros
import nimpy

proc sympy (): PyObject =
  result = pyImport("sympy")

let sp* = sympy()

macro symbols *(input: untyped): untyped =
  result = StmtList()
  var l = LetSection()
  for sym in input:
    
    l.add(IdentDefs(
      newIdentNode(sym.repr),
      newEmptyNode(),
      Call(
        DotExpr(
          newIdentNode("sp"),
          newIdentNode("symbols")),
        
          newLit(sym.repr))
      )
    )
  result.add(l)
 
proc `+` *(x:Pyobject, y:SomeNumber): PyObject =
    result = sp.sympify($x & "+" & $y)
proc `+` *(x:SomeNumber, y:PyObject): PyObject =
    result = sp.sympify($x & "+" & $y)
proc `+` *(x:PyObject, y:PyObject): PyObject =
    result = sp.sympify($x & "+" & $y)
proc `-` *(x:Pyobject, y:SomeNumber): PyObject =
    result = sp.sympify($x & "-" & $y)  
proc `-` *(x:SomeNumber, y:PyObject): PyObject =
    result = sp.sympify($x & "-" & $y) 
proc `-` *(x:PyObject, y:PyObject): PyObject =
    result = sp.sympify($x & "-" & $y) 
proc `*` *(x:Pyobject, y:SomeNumber): PyObject =
    result = sp.sympify($x & "*" & $y)
proc `*` *(x:SomeNumber, y:PyObject): PyObject =
    result = sp.sympify($x & "*" & $y)
proc `*` *(x:PyObject, y:PyObject): PyObject =
    result = sp.sympify($x & "*" & $y)
proc `/` *(x:Pyobject, y:SomeNumber): PyObject =
    result = sp.sympify($x & "/" & $y)
proc `/` *(x:SomeNumber, y:PyObject): PyObject =
    result = sp.sympify($x & "/" & $y)
proc `/` *(x:PyObject, y:PyObject): PyObject =
    result = sp.sympify($x & "/" & $y)
proc `**` *(x:Pyobject, y:SomeNumber): PyObject =
    result = sp.sympify($x & "**" & $y)
proc `**` *(x:SomeNumber, y:PyObject): PyObject =
    result = sp.sympify($x & "**" & $y)
proc `**` *(x:PyObject, y:PyObject): PyObject =
    result = sp.sympify($x & "**" & $y)
