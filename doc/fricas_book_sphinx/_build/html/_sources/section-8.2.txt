.. status: ok



8.2 Polynomial Factorization
----------------------------

The FriCAS polynomial factorization polynomial:factorization facilities
are available for all polynomial types and a wide variety of coefficient
domains. factorization Here are some examples.



8.2.1 Integer and Rational Number Coefficients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Polynomials with integer polynomial:factorization:integer coefficients
coefficients can be be factored.


.. spadInput
::

	v := (4*x^3+2*y^2+1)*(12*x^5-x^3*y+12)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------+
| -2x3y3+(24x5+24)y2+(-4x6-x3)y+48x8+12x5+48x3+12   |
+---------------------------------------------------+




.. spadType

:sub:`Type: Polynomial Integer`




.. spadInput
::

	factor v


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------+
| -(x3y-12x5-12)(2y2+4x3+1)   |
+-----------------------------+




.. spadType

:sub:`Type: Factored Polynomial Integer`



Also, FriCAS can factor polynomials with
polynomial:factorization:rational number coefficients rational number
coefficients.


.. spadInput
::

	w := (4*x^3+(2/3)*x^2+1)*(12*x^5-(1/2)*x^3+12)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| 48x8+8x7-2x6+353x5+952x3+8x2+12   |
+-----------------------------------+




.. spadType

:sub:`Type: Polynomial Fraction Integer`




.. spadInput
::

	factor w


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| 48(x3+16x2+14)(x5-124x3+1)   |
+------------------------------+




.. spadType

:sub:`Type: Factored Polynomial Fraction Integer`







8.2.2 Finite Field Coefficients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Polynomials with coefficients in a finite field
polynomial:factorization:finite field coefficients can be also be
factored. finite field:factoring polynomial with coefficients in


.. spadInput
::

	u : POLY(PF(19)) :=3*x^4+2*x^2+15*x+18


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| 3x4+2x2+15x+18   |
+------------------+




.. spadType

:sub:`Type: Polynomial PrimeField 19`



These include the integers mod p, where p is prime, and extensions of
these fields.


.. spadInput
::

	factor u


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| 3(x+18)(x3+x2+8x+13)   |
+------------------------+




.. spadType

:sub:`Type: Factored Polynomial PrimeField 19`



Convert this to have coefficients in the finite field with 193 elements.
See `ugProblemFinite <section-8.11.html#ugProblemFinite>`__ for more
information about finite fields.


.. spadInput
::

	factor(u :: POLY FFX(PF 19,3))


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------+
| 3(x+18)(x+5%I2+3%I+13)(x+16%I2+14%I+13)(x+17%I2+2%I+13)   |
+-----------------------------------------------------------+




.. spadType

:sub:`Type: Factored Polynomial FiniteFieldExtension(PrimeField 19,3)`







8.2.3 Simple Algebraic Extension Field Coefficients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Polynomials with coefficients in simple algebraic extensions
polynomial:factorization:algebraic extension field coefficients of the
rational numbers can be factored. algebraic number number:algebraic

Here, aa and bb are symbolic roots of polynomials.


.. spadInput
::

	aa := rootOf(aa^2+aa+1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| aa   |
+------+




.. spadType

:sub:`Type: AlgebraicNumber`




.. spadInput
::

	p:=(x^3+aa^2*x+y)*(aa*x^2+aa*x+aa*y^2)^2


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| (-aa-1)y5+((-aa-1)x3+aax)y4+((-2aa-2)x2+(-2aa-2)x)y3+((-2aa-2)x5+(-2aa-2)x4+2aax3+2aax2)y2+((-aa-1)x4+(-2aa-2)x3+(-aa-1)x2)y+(-aa-1)x7+(-2aa-2)x6-x5+2aax4+aax3   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Polynomial AlgebraicNumber`



Note that the second argument to factor can be a list of algebraic
extensions to factor over.


.. spadInput
::

	factor(p,[aa])


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------+
| (-aa-1)(y+x3+(-aa-1)x)(y2+x2+x)2   |
+------------------------------------+




.. spadType

:sub:`Type: Factored Polynomial AlgebraicNumber`



This factors x**2+3 over the integers.


.. spadInput
::

	factor(x^2+3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| x2+3   |
+--------+




.. spadType

:sub:`Type: Factored Polynomial Integer`



Factor the same polynomial over the field obtained by adjoining aa to
the rational numbers.


.. spadInput
::

	factor(x^2+3,[aa])


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| (x-2aa-1)(x+2aa+1)   |
+----------------------+




.. spadType

:sub:`Type: Factored Polynomial AlgebraicNumber`



Factor x**6+108 over the same field.


.. spadInput
::

	factor(x^6+108,[aa])


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| (x3-12aa-6)(x3+12aa+6)   |
+--------------------------+




.. spadType

:sub:`Type: Factored Polynomial AlgebraicNumber`




.. spadInput
::

	bb:=rootOf(bb^3-2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| bb   |
+------+




.. spadType

:sub:`Type: AlgebraicNumber`




.. spadInput
::

	factor(x^6+108,[bb])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------+
| (x2-3bbx+3bb2)(x2+3bb2)(x2+3bbx+3bb2)   |
+-----------------------------------------+




.. spadType

:sub:`Type: Factored Polynomial AlgebraicNumber`



Factor again over the field obtained by adjoining both aa and bb to the
rational numbers.


.. spadInput
::

	factor(x^6+108,[aa,bb])


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------+
| (x+(-2aa-1)bb)(x+(-aa-2)bb)(x+(-aa+1)bb)(x+(aa-1)bb)(x+(aa+2)bb)(x+(2aa+1)bb)   |
+---------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Factored Polynomial AlgebraicNumber`







8.2.4 Factoring Rational Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since fractions of polynomials form a field, every element (other than
zero) rational function:factoring divides any other, so there is no
useful notion of irreducible factors. Thus the factor operation is not
very useful for fractions of polynomials.

There is, instead, a specific operation factorFraction that separately
factors the numerator and denominator and returns a fraction of the
factored results.


.. spadInput
::

	factorFraction((x^2-4)/(y^2-4))


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| (x-2)(x+2)(y-2)(y+2)   |
+------------------------+




.. spadType

:sub:`Type: Fraction Factored Polynomial Integer`



You can also use map. This expression applies the factor operation to
the numerator and denominator.


.. spadInput
::

	map(factor,(x^2-4)/(y^2-4))


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| (x-2)(x+2)(y-2)(y+2)   |
+------------------------+




.. spadType

:sub:`Type: Fraction Factored Polynomial Integer`







