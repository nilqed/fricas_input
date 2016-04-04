.. status: ok



9.45 LinearOrdinaryDifferentialOperator1
----------------------------------------

LinearOrdinaryDifferentialOperator1(A) is the domain of linear ordinary
differential operators with coefficients in the differential ring A.



9.45.1 Differential Operators with Rational Function Coefficients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This example shows differential operators with rational function
coefficients. In this case operator multiplication is non-commutative
and, since the coefficients form a field, an operator division algorithm
exists.

We begin by defining RFZ to be the rational functions in x with integer
coefficients and Dx to be the differential operator for d/dx.


.. spadInput
::

	RFZ := Fraction UnivariatePolynomial('x, Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------+
| FractionUnivariatePolynomial(x,Integer)   |
+-------------------------------------------+




.. spadType

:sub:`Type: Domain`




.. spadInput
::

	x : RFZ := 'x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Integer)`




.. spadInput
::

	Dx : LODO1 RFZ := D()


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| D   |
+-----+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)



Operators are created using the usual arithmetic operations.


.. spadInput
::

	b : LODO1 RFZ := 3*x^2*Dx^2 + 2*Dx + 1/x


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| 3x2D2+2D+1x   |
+---------------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)




.. spadInput
::

	a : LODO1 RFZ := b*(5*x*Dx + 7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| 15x3D3+(51x2+10x)D2+29D+7x   |
+------------------------------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)



Operator multiplication corresponds to functional composition.


.. spadInput
::

	p := x^2 + 1/x^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| x4+1x2   |
+----------+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Integer)`



Since operator coefficients depend on x, the multiplication is not
commutative.


.. spadInput
::

	(a*b - b*a) p


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| -75x4+540x-75x4   |
+-------------------+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Integer)`



When the coefficients of operator polynomials come from a field, as in
this case, it is possible to define operator division. Division on the
left and division on the right yield different results when the
multiplication is non-commutative.

| The results of leftDivideleftDivideLinearOrdinaryDifferentialOperator1
and rightDividerightDivideLinearOrdinaryDifferentialOperator1 are
quotient-remainder pairs satisfying:

| leftDivide(a,b) = [q, r] such that a = b*q + r
|  rightDivide(a,b) = [q, r] such that a = q*b + r

In both cases, the degreedegreeLinearOrdinaryDifferentialOperator1 of
the remainder, r, is less than the degree of b.


.. spadInput
::

	ld := leftDivide(a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| [quotient=5xD+7,remainder=0]   |
+--------------------------------+




.. spadType

:sub:`Type: Record(quotient: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer), remainder:
LinearOrdinaryDifferentialOperator1 Fraction
UnivariatePolynomial(x,Integer))




.. spadInput
::

	a = b * ld.quotient + ld.remainder


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------+
| 15x3D3+(51x2+10x)D2+29D+7x=15x3D3+(51x2+10x)D2+29D+7x   |
+---------------------------------------------------------+




.. spadType

:sub:`Type: Equation LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)



The operations of left and right division are so-called because the
quotient is obtained by dividing a on that side by b.


.. spadInput
::

	rd := rightDivide(a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------+
| [quotient=5xD+7,remainder=10D+5x]   |
+-------------------------------------+




.. spadType

:sub:`Type: Record(quotient: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer), remainder:
LinearOrdinaryDifferentialOperator1 Fraction
UnivariatePolynomial(x,Integer))




.. spadInput
::

	a = rd.quotient * b + rd.remainder


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------+
| 15x3D3+(51x2+10x)D2+29D+7x=15x3D3+(51x2+10x)D2+29D+7x   |
+---------------------------------------------------------+




.. spadType

:sub:`Type: Equation LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)



Operations rightQuotientrightQuotientLinearOrdinaryDifferentialOperator1
and rightRemainderrightRemainderLinearOrdinaryDifferentialOperator1 are
available if only one of the quotient or remainder are of interest to
you. This is the quotient from right division.


.. spadInput
::

	rightQuotient(a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 5xD+7   |
+---------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)



This is the remainder from right division. The corresponding left
functions leftQuotientleftQuotientLinearOrdinaryDifferentialOperator1
and leftRemainderleftRemainderLinearOrdinaryDifferentialOperator1 are
also available.


.. spadInput
::

	rightRemainder(a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 10D+5x   |
+----------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)



For exact division, the operations
leftExactQuotientleftExactQuotientLinearOrdinaryDifferentialOperator1
and
rightExactQuotientrightExactQuotientLinearOrdinaryDifferentialOperator1
are supplied. These return the quotient but only if the remainder is
zero. The call rightExactQuotient(a,b) would yield an error.


.. spadInput
::

	leftExactQuotient(a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 5xD+7   |
+---------+




.. spadType

:sub:`Type: Union(LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer),...)



The division operations allow the computation of left and right greatest
common divisors (leftGcdleftGcdLinearOrdinaryDifferentialOperator1 and
rightGcdrightGcdLinearOrdinaryDifferentialOperator1) via remainder
sequences, and consequently the computation of left and right least
common multiples (rightLcmrightLcmLinearOrdinaryDifferentialOperator1
and leftLcmleftLcmLinearOrdinaryDifferentialOperator1).


.. spadInput
::

	e := leftGcd(a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| 3x2D2+2D+1x   |
+---------------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)



Note that a greatest common divisor doesn't necessarily divide a and b
on both sides. Here the left greatest common divisor does not divide a
on the right.


.. spadInput
::

	leftRemainder(a, e)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)




.. spadInput
::

	rightRemainder(a, e)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 10D+5x   |
+----------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)



Similarly, a least common multiple is not necessarily divisible from
both sides.


.. spadInput
::

	f := rightLcm(a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| 15x3D3+(51x2+10x)D2+29D+7x   |
+------------------------------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)




.. spadInput
::

	rightRemainder(f, b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 10D+5x   |
+----------+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)




.. spadInput
::

	leftRemainder(f, b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: LinearOrdinaryDifferentialOperator1 Fraction`
UnivariatePolynomial(x,Integer)







