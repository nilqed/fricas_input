.. status: ok



9.58 Operator
-------------

Given any ring R, the ring of the Integer-linear operators over R is
called Operator(R). To create an operator over R, first create a basic
operator using the operation operator, and then convert it to
Operator(R) for the R you want.

We choose R to be the two by two matrices over the integers.


.. spadInput
::

	R := SQMATRIX(2, INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| SquareMatrix(2,Integer)   |
+---------------------------+




.. spadType

:sub:`Type: Domain`



Create the operator tilde on R.


.. spadInput
::

	t := operator("tilde") :: OP(R)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| tilde   |
+---------+




.. spadType

:sub:`Type: Operator SquareMatrix(2,Integer)`



Since Operator is unexposed we must either package-call operations from
it, or expose it explicitly. For convenience we will do the latter.

Expose Operator.


.. spadInput
::

	)set expose add constructor Operator


.. spadMathAnswer
.. spadVerbatim

::

    Operator is now explicitly exposed in frame G82322 



To attach an evaluation function (from R to R) to an operator over R,
use evaluate(op, f) where op is an operator over R and f is a function R
-> R. This needs to be done only once when the operator is defined. Note
that f must be Integer-linear (that is, f(ax+y) = a f(x) + f(y) for any
integer a, and any x and y in R).

We now attach the transpose map to the above operator t.


.. spadInput
::

	evaluate(t, m +-> transpose m)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| tilde   |
+---------+




.. spadType

:sub:`Type: Operator SquareMatrix(2,Integer)`



Operators can be manipulated formally as in any ring: + is the pointwise
addition and * is composition. Any element x of R can be converted to
an operator opx over R, and the evaluation function of opx is
left-multiplication by x.

Multiplying on the left by this matrix swaps the two rows.


.. spadInput
::

	s : R := matrix [ [0, 1], [1, 0] ]


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [0110]   |
+----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`



Can you guess what is the action of the following operator?


.. spadInput
::

	rho := t * s


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| tilde[0110]   |
+---------------+




.. spadType

:sub:`Type: Operator SquareMatrix(2,Integer)`



Hint: applying rho four times gives the identity, so rho^4-1 should
return 0 when applied to any two by two matrix.


.. spadInput
::

	z := rho^4 - 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------+
| -1+tilde[0110]tilde[0110]tilde[0110]tilde[0110]   |
+---------------------------------------------------+




.. spadType

:sub:`Type: Operator SquareMatrix(2,Integer)`



Now check with this matrix.


.. spadInput
::

	m:R := matrix [ [1, 2], [3, 4] ]


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

	z m


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [0000]   |
+----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`



As you have probably guessed by now, rho acts on matrices by rotating
the elements clockwise.


.. spadInput
::

	rho m


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [3142]   |
+----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`




.. spadInput
::

	rho rho m


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [4321]   |
+----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`




.. spadInput
::

	(rho^3) m


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| [2413]   |
+----------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`



Do the swapping of rows and transposition commute? We can check by
computing their bracket.


.. spadInput
::

	b := t * s - s * t


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| -[0110]tilde+tilde[0110]   |
+----------------------------+




.. spadType

:sub:`Type: Operator SquareMatrix(2,Integer)`



Now apply it to m.


.. spadInput
::

	b m


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| [1-33-1]   |
+------------+




.. spadType

:sub:`Type: SquareMatrix(2,Integer)`



Next we demonstrate how to define a differential operator on a
polynomial ring.

This is the recursive definition of the n-th Legendre polynomial.


.. spadVerbatim

::

 L n ==
   n = 0 => 1
   n = 1 => x
   (2*n-1)/n * x * L(n-1) - (n-1)/n * L(n-2)




.. spadType

Void



Create the differential operator ddx on polynomials in x over the
rational numbers.


.. spadInput
::

	dx := operator("D") :: OP(POLY FRAC INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| D   |
+-----+




.. spadType

:sub:`Type: Operator Polynomial Fraction Integer`



Now attach the map to it.


.. spadInput
::

	evaluate(dx, p +-> D(p, 'x))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| D   |
+-----+




.. spadType

:sub:`Type: Operator Polynomial Fraction Integer`



This is the differential equation satisfied by the n-th Legendre
polynomial.


.. spadInput
::

	E n == (1 - x^2) * dx^2 - 2 * x * dx + n*(n+1)


.. spadMathAnswer
.. spadType

Void



Now we verify this for n = 15. Here is the polynomial.


.. spadInput
::

	L 15


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------+
| 96948452048x15-351020252048x13+507029252048x11-371821452048x9+145495352048x7-29099072048x5+2552552048x3-64352048x   |
+---------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Polynomial Fraction Integer`



Here is the operator.


.. spadInput
::

	E 15


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------+
| 240-2xD-(x2-1)D2   |
+--------------------+




.. spadType

:sub:`Type: Operator Polynomial Fraction Integer`



Here is the evaluation.


.. spadInput
::

	(E 15)(L 15)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Polynomial Fraction Integer`





