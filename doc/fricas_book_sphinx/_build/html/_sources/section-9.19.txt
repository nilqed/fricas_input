.. status: ok


9.19 Equation
-------------

The Equation domain provides equations as mathematical objects. These
are used, for example, as the input to various
solvesolveTransSolvePackage operations.

Equations are created using the equals symbol, =.


.. spadInput
::

	eq1 := 3*x + 4*y = 5


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 4y+3x=5   |
+-----------+




.. spadType

:sub:`Type: Equation Polynomial Integer`




.. spadInput
::

	eq2 := 2*x + 2*y = 3


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 2y+2x=3   |
+-----------+




.. spadType

:sub:`Type: Equation Polynomial Integer`



The left- and right-hand sides of an equation are accessible using the
operations lhslhsEquation and rhsrhsEquation.


.. spadInput
::

	lhs eq1


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 4y+3x   |
+---------+




.. spadType

:sub:`Type: Polynomial Integer`




.. spadInput
::

	rhs eq1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 5   |
+-----+




.. spadType

:sub:`Type: Polynomial Integer`



Arithmetic operations are supported and operate on both sides of the
equation.


.. spadInput
::

	eq1 + eq2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 6y+5x=8   |
+-----------+




.. spadType

:sub:`Type: Equation Polynomial Integer`




.. spadInput
::

	eq1 * eq2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| 8y2+14xy+6x2=15   |
+-------------------+




.. spadType

:sub:`Type: Equation Polynomial Integer`




.. spadInput
::

	2*eq2 - eq1


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| x=1   |
+-------+




.. spadType

:sub:`Type: Equation Polynomial Integer`



Equations may be created for any type so the arithmetic operations will
be defined only when they make sense. For example, exponentiation is not
defined for equations involving non-square matrices.


.. spadInput
::

	eq1^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| 16y2+24xy+9x2=25   |
+--------------------+




.. spadType

:sub:`Type: Equation Polynomial Integer`



Note that an equals symbol is also used to test for equality of values
in certain contexts. For example, x+1 and y are unequal as polynomials.


.. spadInput
::

	if x+1 = y then "equal" else "unequal"


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| "unequal"   |
+-------------+




.. spadType

:sub:`Type: String`




.. spadInput
::

	eqpol := x+1 = y


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| x+1=y   |
+---------+




.. spadType

:sub:`Type: Equation Polynomial Integer`



If an equation is used where a Boolean value is required, then it is
evaluated using the equality test from the operand type.


.. spadInput
::

	if eqpol then "equal" else "unequal"


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| "unequal"   |
+-------------+




.. spadType

:sub:`Type: String`



If one wants a Boolean value rather than an equation, all one has to do
is ask!


.. spadInput
::

	eqpol::Boolean


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`





