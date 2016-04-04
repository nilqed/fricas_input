.. status: ok


9.79 Symbol
-----------

Symbols are one of the basic types manipulated by FriCAS. The Symbol
domain provides ways to create symbols of many varieties.

The simplest way to create a symbol is to single quote an identifier.


.. spadInput
::

	X: Symbol := 'x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: Symbol`



This gives the symbol even if x has been assigned a value. If x has not
been assigned a value, then it is possible to omit the quote.


.. spadInput
::

	XX: Symbol := x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: Symbol`



Declarations must be used when working with symbols, because otherwise
the interpreter tries to place values in a more specialized type
Variable.


.. spadInput
::

	A := 'a


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| a   |
+-----+




.. spadType

:sub:`Type: Variable a`




.. spadInput
::

	B := b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| b   |
+-----+




.. spadType

:sub:`Type: Variable b`



The normal way of entering polynomials uses this fact.


.. spadInput
::

	x^2 + 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| x2+1   |
+--------+




.. spadType

:sub:`Type: Polynomial Integer`



Another convenient way to create symbols is to convert a string. This is
useful when the name is to be constructed by a program.


.. spadInput
::

	"Hello"::Symbol


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| Hello   |
+---------+




.. spadType

:sub:`Type: Symbol`



Sometimes it is necessary to generate new unique symbols, for example,
to name constants of integration. The expression new() generates a
symbol starting with %.


.. spadInput
::

	new()$Symbol


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| %A   |
+------+




.. spadType

:sub:`Type: Symbol`



Successive calls to newnewSymbol produce different symbols.


.. spadInput
::

	new()$Symbol


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| %B   |
+------+




.. spadType

:sub:`Type: Symbol`



The expression new("s") produces a symbol starting with %s.


.. spadInput
::

	new("xyz")$Symbol


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| %xyz0   |
+---------+




.. spadType

:sub:`Type: Symbol`



A symbol can be adorned in various ways. The most basic thing is
applying a symbol to a list of subscripts.


.. spadInput
::

	X[i,j]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| xi,j   |
+--------+




.. spadType

:sub:`Type: Symbol`



Somewhat less pretty is to attach subscripts, superscripts or arguments.


.. spadInput
::

	U := subscript(u, [1,2,1,2])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| u1,2,1,2   |
+------------+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	V := superscript(v, [n])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| vn   |
+------+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	P := argscript(p, [t])


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| p(t)   |
+--------+




.. spadType

:sub:`Type: Symbol`



It is possible to test whether a symbol has scripts using the
scripted?scripted?Symbol test.


.. spadInput
::

	scripted? U


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	scripted? X


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



If a symbol is not scripted, then it may be converted to a string.


.. spadInput
::

	string X


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| "x"   |
+-------+




.. spadType

:sub:`Type: String`



The basic parts can always be extracted using the namenameSymbol and
scriptsscriptsSymbol operations.


.. spadInput
::

	name U


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| u   |
+-----+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	scripts U


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------+
| [sub=[1,2,1,2],sup=[],presup=[],presub=[],args=[]]   |
+------------------------------------------------------+




.. spadType

:sub:`Type: Record( sub: List OutputForm, sup: List OutputForm, presup: List`
OutputForm, presub: List OutputForm, args: List OutputForm)




.. spadInput
::

	name X


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	scripts X


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------+
| [sub=[],sup=[],presup=[],presub=[],args=[]]   |
+-----------------------------------------------+




.. spadType

:sub:`Type: Record( sub: List OutputForm, sup: List OutputForm, presup: List`
OutputForm, presub: List OutputForm, args: List OutputForm)



The most general form is obtained using the scriptscriptSymbol
operation. This operation takes an argument which is a list containing,
in this order, lists of subscripts, superscripts, presuperscripts,
presubscripts and arguments to a symbol.


.. spadInput
::

	M := script(Mammoth, [ [i,j],[k,l],[0,1],[2],[u,v,w] ])


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| 20,1Mammothi,jk,l(u,v,w)   |
+----------------------------+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	scripts M


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------+
| [sub=[i,j],sup=[k,l],presup=[0,1],presub=[2],args=[u,v,w]]   |
+--------------------------------------------------------------+




.. spadType

:sub:`Type: Record( sub: List OutputForm, sup: List OutputForm, presup: List`
OutputForm, presub: List OutputForm, args: List OutputForm)



If trailing lists of scripts are omitted, they are assumed to be empty.


.. spadInput
::

	N := script(Nut, [ [i,j],[k,l],[0,1] ])


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| 0,1Nuti,jk,l   |
+----------------+




.. spadType

:sub:`Type: Symbol`




.. spadInput
::

	scripts N


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------+
| [sub=[i,j],sup=[k,l],presup=[0,1],presub=[],args=[]]   |
+--------------------------------------------------------+




.. spadType

:sub:`Type: Record( sub: List OutputForm, sup: List OutputForm, presup: List`
OutputForm, presub: List OutputForm, args: List OutputForm)





