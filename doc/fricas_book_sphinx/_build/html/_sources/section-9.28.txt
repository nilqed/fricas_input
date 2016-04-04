.. status: ok



9.28 Fraction
-------------

The Fraction domain implements quotients. The elements must belong to a
domain of category IntegralDomain: multiplication must be commutative
and the product of two non-zero elements must not be zero. This allows
you to make fractions of most things you would think of, but don't
expect to create a fraction of two matrices! The abbreviation for
Fraction is FRAC.

Use / to create a fraction.


.. spadInput
::

	a := 11/12


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 1112   |
+--------+




.. spadType

:sub:`Type: Fraction Integer`




.. spadInput
::

	b := 23/24


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| 2324   |
+--------+




.. spadType

:sub:`Type: Fraction Integer`



The standard arithmetic operations are available.


.. spadInput
::

	3 - a*b^2 + a + b/a


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------+
| 31327176032   |
+---------------+




.. spadType

:sub:`Type: Fraction Integer`



Extract the numerator and denominator by using numernumerFraction and
denomdenomFraction, respectively.


.. spadInput
::

	numer(a)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 11   |
+------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	denom(b)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 24   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



Operations like maxmaxFraction, minminFraction,
negative?negative?Fraction, positive?positive?Fraction and
zero?zero?Fraction are all available if they are provided for the
numerators and denominators. See
`IntegerXmpPage <section-9.34.html#IntegerXmpPage>`__ for examples.

Don't expect a useful answer from factorfactorFraction, gcdgcdFraction
or lcmlcmFraction if you apply them to fractions.


.. spadInput
::

	r := (x^2 + 2*x + 1)/(x^2 - 2*x + 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| x2+2x+1x2-2x+1   |
+------------------+




.. spadType

:sub:`Type: Fraction Polynomial Integer`



Since all non-zero fractions are invertible, these operations have
trivial definitions.


.. spadInput
::

	factor(r)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------+
| x2+2x+1x2-2x+1   |
+------------------+




.. spadType

:sub:`Type: Factored Fraction Polynomial Integer`



Use mapmapFraction to apply factorfactorFraction to the numerator and
denominator, which is probably what you mean.


.. spadInput
::

	map(factor,r)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| (x+1)2(x-1)2   |
+----------------+




.. spadType

:sub:`Type: Fraction Factored Polynomial Integer`



Other forms of fractions are available. Use continuedFraction to create
a continued fraction.


.. spadInput
::

	continuedFraction(7/12)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------------------------------+
+--------------------------------------------------------------------------+




.. spadType

:sub:`Type: ContinuedFraction Integer`



Use partialFraction to create a partial fraction. See
`ContinuedFractionXmpPage <section-9.12.html#ContinuedFractionXmpPage>`__
and
`PartialFractionXmpPage <section-9.61.html#PartialFractionXmpPage>`__
for additional information and examples.


.. spadInput
::

	partialFraction(7,12)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| 1-322+13   |
+------------+




.. spadType

:sub:`Type: PartialFraction Integer`



Use conversion to create alternative views of fractions with objects
moved in and out of the numerator and denominator.


.. spadInput
::

	g := 2/3 + 4/5*%i


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------+
| 23+45i   |
+----------+




.. spadType

:sub:`Type: Complex Fraction Integer`



Conversion is discussed in detail in Section
`ugTypesConvertPage <ugTypesConvertPage>`__ .


.. spadInput
::

	g :: FRAC COMPLEX INT


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| 10+12i15   |
+------------+




.. spadType

:sub:`Type: Fraction Complex Integer`





