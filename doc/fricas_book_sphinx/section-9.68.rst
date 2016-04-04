.. status: ok


9.68 RomanNumeral
-----------------

The Roman numeral package was added to FriCAS in MCMLXXXVI for use in
denoting higher order derivatives.

For example, let f be a symbolic operator.


.. spadInput
::

	f := operator 'f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| f   |
+-----+




.. spadType

:sub:`Type: BasicOperator`



This is the seventh derivative of f with respect to x.


.. spadInput
::

	D(f x,x,7)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| f(vii)(x)   |
+-------------+




.. spadType

:sub:`Type: Expression Integer`



You can have integers printed as Roman numerals by declaring variables
to be of type RomanNumeral (abbreviation ROMAN).


.. spadInput
::

	a := roman(1978 - 1965)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| XIII   |
+--------+




.. spadType

:sub:`Type: RomanNumeral`



This package now has a small but devoted group of followers that claim
this domain has shown its efficacy in many other contexts. They claim
that Roman numerals are every bit as useful as ordinary integers.

In a sense, they are correct, because Roman numerals form a ring and you
can therefore construct polynomials with Roman numeral coefficients,
matrices over Roman numerals, etc..


.. spadInput
::

	x : UTS(ROMAN,'x,0) := x


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| x   |
+-----+




.. spadType

:sub:`Type: UnivariateTaylorSeries(RomanNumeral,x,0)`



Was Fibonacci Italian or ROMAN?


.. spadInput
::

	recip(1 - x - x^2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------+
| I+x+IIx2+IIIx3+Vx4+VIIIx5+XIIIx6+XXIx7+XXXIVx8+LVx9+LXXXIXx10+O(x11)   |
+------------------------------------------------------------------------+




.. spadType

:sub:`Type: Union(UnivariateTaylorSeries(RomanNumeral,x,0),...)`



You can also construct fractions with Roman numeral numerators and
denominators, as this matrix Hilberticus illustrates.


.. spadInput
::

	m : MATRIX FRAC ROMAN


.. spadMathAnswer
.. spadType

Void




.. spadInput
::

	m := matrix [ [1/(i + j) for i in 1..3] for j in 1..3]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------+
| [IIIIIIIIIVIIIIIIVIVIIVIVIVI]   |
+---------------------------------+




.. spadType

:sub:`Type: Matrix Fraction RomanNumeral`



Note that the inverse of the matrix has integral ROMAN entries.


.. spadInput
::

	inverse m


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------+
| [LXXII-CCXLCLXXX-CCXLCM-DCCXXCLXXX-DCCXXDC]   |
+-----------------------------------------------+




.. spadType

:sub:`Type: Union(Matrix Fraction RomanNumeral,...)`



Unfortunately, the spoil-sports say that the fun stops when the numbers
get big---mostly because the Romans didn't establish conventions about
representing very large numbers.


.. spadInput
::

	y := factorial 10


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 3628800   |
+-----------+




.. spadType

:sub:`Type: PositiveInteger`



You work it out!


.. spadInput
::

	roman y


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------+
| ((((I))))((((I))))((((I))))(((I)))(((I)))(((I)))(((I)))(((I)))(((I)))((I))((I))MMMMMMMMDCCC   |
+-----------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: RomanNumeral`



Issue the system command )show RomanNumeral to display the full list of
operations defined by RomanNumeral.



