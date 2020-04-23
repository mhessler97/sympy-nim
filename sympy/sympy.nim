import macroutils
import macros
import nimpy

proc Sympy*(): PyObject = pyImport("sympy")

let sympy* = Sympy()

macro symbols *(input: untyped): untyped =
  result = StmtList()
  var l = LetSection()
  for sym in input:
    
    l.add(IdentDefs(
      newIdentNode(sym.repr),
      newEmptyNode(),
      Call(
        DotExpr(
          newIdentNode("sympy"),
          newIdentNode("symbols")),
        
          newLit(sym.repr))
      )
    )
  result.add(l)
 
proc `+` *(x:Pyobject, y:SomeNumber): PyObject =
    result = sympy.sympify($x & "+" & $y)
proc `+` *(x:SomeNumber, y:PyObject): PyObject =
    result = sympy.sympify($x & "+" & $y)
proc `+` *(x:PyObject, y:PyObject): PyObject =
    result = sympy.sympify($x & "+" & $y)
proc `-` *(x:Pyobject, y:SomeNumber): PyObject =
    result = sympy.sympify($x & "-" & $y)  
proc `-` *(x:SomeNumber, y:PyObject): PyObject =
    result = sympy.sympify($x & "-" & $y) 
proc `-` *(x:PyObject, y:PyObject): PyObject =
    result = sympy.sympify($x & "-" & $y) 
proc `*` *(x:Pyobject, y:SomeNumber): PyObject =
    result = sympy.sympify($x & "*" & $y)
proc `*` *(x:SomeNumber, y:PyObject): PyObject =
    result = sympy.sympify($x & "*" & $y)
proc `*` *(x:PyObject, y:PyObject): PyObject =
    result = sympy.sympify($x & "*" & $y)
proc `/` *(x:Pyobject, y:SomeNumber): PyObject =
    result = sympy.sympify($x & "/" & $y)
proc `/` *(x:SomeNumber, y:PyObject): PyObject =
    result = sympy.sympify($x & "/" & $y)
proc `/` *(x:PyObject, y:PyObject): PyObject =
    result = sympy.sympify($x & "/" & $y)
proc `**` *(x:Pyobject, y:SomeNumber): PyObject =
    result = sympy.sympify($x & "**" & $y)
proc `**` *(x:SomeNumber, y:PyObject): PyObject =
    result = sympy.sympify($x & "**" & $y)
proc `**` *(x:PyObject, y:PyObject): PyObject =
    result = sympy.sympify($x & "**" & $y)

if isMainModule:
    symbols:
        x
        y
        z
    echo x**2 + y**2 + z**2 - 1
