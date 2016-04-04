.. status: ok


9.61 PartialFraction
--------------------

A partial fraction is a decomposition of a quotient into a sum of
quotients where the denominators of the summands are powers of
primes.Most people first encounter partial fractions when they are
learning integral calculus. For a technical discussion of partial
fractions, see, for example, Lang's Algebra. For example, the rational
number 1/6 is decomposed into 1/2-1/3. You can compute partial fractions
of quotients of objects from domains belonging to the category
EuclideanDomain. For example, Integer, Complex Integer, and
UnivariatePolynomial(x, Fraction Integer) all belong to EuclideanDomain.
In the examples following, we demonstrate how to decompose quotients of
each of these kinds of object into partial fractions. Issue the system
command )show PartialFraction to display the full list of operations
defined by PartialFraction.

It is necessary that we know how to factor the denominator when we want
to compute a partial fraction. Although the interpreter can often do
this automatically, it may be necessary for you to include a call to
factor. In these examples, it is not necessary to factor the
denominators explicitly.

The main operation for computing partial fractions is called
partialFractionpartialFractionPartialFraction and we use this to compute
a decomposition of 1 / 10!. The first argument to
partialFractionpartialFractionPartialFraction is the numerator of the
quotient and the second argument is the factored denominator.


.. spadInput
::

	partialFraction(1,factorial 10)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| 15928-2334-1252+17   |
+----------------------+




.. spadType

:sub:`Type: PartialFraction Integer`



Since the denominators are powers of primes, it may be possible to
expand the numerators further with respect to those primes. Use the
operation padicFractionpadicFractionPartialFraction to do this.


.. spadInput
::

	f := padicFraction(%)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------+
| 12+124+125+126+127+128-232-133-234-25-252+17   |
+------------------------------------------------+




.. spadType

:sub:`Type: PartialFraction Integer`



The operation compactFractioncompactFractionPartialFraction returns an
expanded fraction into the usual form. The compacted version is used
internally for computational efficiency.


.. spadInput
::

	compactFraction(f)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------+
| 15928-2334-1252+17   |
+----------------------+




.. spadType

:sub:`Type: PartialFraction Integer`



You can add, subtract, multiply and divide partial fractions. In
addition, you can extract the parts of the decomposition.
numberOfFractionalTermsnumberOfFractionalTermsPartialFraction computes
the number of terms in the fractional part. This does not include the
whole part of the fraction, which you get by calling
wholePartwholePartPartialFraction. In this example, the whole part is
just 0.


.. spadInput
::

	numberOfFractionalTerms(f)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 12   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



The operation nthFractionalTermnthFractionalTermPartialFraction returns
the individual terms in the decomposition. Notice that the object
returned is a partial fraction itself.
firstNumerfirstNumerPartialFraction and
firstDenomfirstDenomPartialFraction extract the numerator and
denominator of the first term of the fraction.


.. spadInput
::

	nthFractionalTerm(f,3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 125   |
+-------+




.. spadType

:sub:`Type: PartialFraction Integer`



Given two gaussian integers (see
`ComplexXmpPage <section-9.11.html#ComplexXmpPage>`__ ), you can
decompose their quotient into a partial fraction.


.. spadInput
::

	partialFraction(1,- 13 + 14 * %i)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------+
| -11+2i+43+8i   |
+----------------+




.. spadType

:sub:`Type: PartialFraction Complex Integer`



To convert back to a quotient, simply use a conversion.


.. spadInput
::

	% :: Fraction Complex Integer


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| -i14+13i   |
+------------+




.. spadType

:sub:`Type: Fraction Complex Integer`



To conclude this section, we compute the decomposition of


.. spadVerbatim

::

                    1
      -------------------------------
                    2       3       4
      (x + 1)(x + 2) (x + 3) (x + 4)



The polynomials in this object have type UnivariatePolynomial(x,
Fraction Integer).

We use the primeFactorprimeFactorFactored operation (see
`FactoredXmpPage <section-9.22.html#FactoredXmpPage>`__ ) to create the
denominator in factored form directly.


.. spadInput
::

	u : FR UP(x, FRAC INT) := reduce(*,[primeFactor(x+i,i) for i in 1..4])


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| (x+1)(x+2)2(x+3)3(x+4)4   |
+---------------------------+




.. spadType

:sub:`Type: Factored UnivariatePolynomial(x,Fraction Integer)`



These are the compact and expanded partial fractions for the quotient.


.. spadInput
::

	partialFraction(1,u)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------+
| 1648x+1+14x+716(x+2)2+-178x2-12x-1398(x+3)3+607324x3+10115432x2+3914x+44179324(x+4)4   |
+----------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: PartialFraction UnivariatePolynomial(x,Fraction Integer)`




.. spadInput
::

	padicFraction %


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------------------------------------------------------------------------+
| 1648x+1+14x+2-116(x+2)2-178x+3+34(x+3)2-12(x+3)3+607324x+4+403432(x+4)2+1336(x+4)3+112(x+4)4   |
+------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: PartialFraction UnivariatePolynomial(x,Fraction Integer)`



All see
`FullPartialFractionExpansionXmpPage <section-9.29.html#FullPartialFractionExpansionXmpPage>`__
for examples of factor-free conversion of quotients to full partial
fractions.



