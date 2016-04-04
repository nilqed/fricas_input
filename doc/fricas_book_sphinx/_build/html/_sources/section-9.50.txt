.. status: ok



9.50 MakeFunction
-----------------

It is sometimes useful to be able to define a function given by the
result of a calculation.

Suppose that you have obtained the following expression after several
computations and that you now want to tabulate the numerical values of f
for x between -1 and +1 with increment 0.1.


.. spadInput
::

	expr := (x - exp x + 1)^2 * (sin(x^2) * x + 1)^3


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------------------------+
| (x3ex2+(-2x4-2x3)ex+x5+2x4+x3)sin(x2)3+(3x2ex2+(-6x3-6x2)ex+3x4+6x3+3x2)sin(x2)2+(3xex2+(-6x2-6x)ex+3x3+6x2+3x)sin(x2)+ex2+(-2x-2)ex+x2+2x+1   |
+------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Expression Integer`



You could, of course, use the function evalevalExpression within a loop
and evaluate expr twenty-one times, but this would be quite slow. A
better way is to create a numerical function f such that f(x) is defined
by the expression expr above, but without retyping expr! The package
MakeFunction provides the operation functionfunctionMakeFunction which
does exactly this.

Issue this to create the function f(x) given by expr.


.. spadInput
::

	function(expr, f, x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| f   |
+-----+




.. spadType

:sub:`Type: Symbol`



To tabulate expr, we can now quickly evaluate f 21 times.


.. spadInput
::

	tbl := [f(0.1 * i - 1) for i in 0..20];


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| [0.00053918440362701574,0.00396575511844206653,0.008854518748339836892,0.01165248830907069695,0.010861822092457513645,0.0076366823212086996506,0.0040584985759782206255,0.0015349542891050083648,0.00034249031549879905716,0.000023330482760988196001,0.0,0.000026818687828625994229,0.00046915713720051642621,0.0026924576596851958608,0.010148688173691351488,0.031383372585438105643,0.087699114451546152979,0.23130197893439968362,0.5843743955958098772,1.4114930171992819197,3.221694827675164252]   |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: List Float`



Use the list [x1,...,xn] as the third argument to
functionfunctionMakeFunction to create a multivariate function
f(x1,...,xn).


.. spadInput
::

	e := (x - y + 1)^2 * (x^2 * y + 1)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------+
| x4y4+(-2x5-2x4+2x2)y3+(x6+2x5+x4-4x3-4x2+1)y2+(2x4+4x3+2x2-2x-2)y+x2+2x+1   |
+-----------------------------------------------------------------------------+




.. spadType

:sub:`Type: Polynomial Integer`




.. spadInput
::

	function(e, g, [x, y])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| g   |
+-----+




.. spadType

:sub:`Type: Symbol`



In the case of just two variables, they can be given as arguments
without making them into a list.


.. spadInput
::

	function(e, h, x, y)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| h   |
+-----+




.. spadType

:sub:`Type: Symbol`



Note that the functions created by functionfunctionMakeFunction are not
limited to floating point numbers, but can be applied to any type for
which they are defined.


.. spadInput
::

	m1 := squareMatrix [ [1, 2], [3, 4] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [1234]   |
+----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`




.. spadInput
::

	m2 := squareMatrix [ [1, 0], [-1, 1] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| [10-11]   |
+-----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`




.. spadInput
::

	h(m1, m2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| [-78368960-1713219588]   |
+--------------------------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`



For more information, see `ugUserMakePage <ugUserMakePage>`__ in Section
`ugUserMakeNumber <ugUserMakeNumber>`__ .



