.. status: ok



9.29 FullPartialFractionExpansion
---------------------------------

The domain FullPartialFractionExpansion implements factor-free
conversion of quotients to full partial fractions.

Our examples will all involve quotients of univariate polynomials with
rational number coefficients.


.. spadInput
::

	Fx := FRAC UP(x, FRAC INT)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------+
| FractionUnivariatePolynomial(x,FractionInteger)   |
+---------------------------------------------------+




.. spadType

:sub:`Type: Domain`



Here is a simple-looking rational function.


.. spadInput
::

	f : Fx := 36 / (x^5-2*x^4-2*x^3+4*x^2+x-2)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| 36x5-2x4-2x3+4x2+x-2   |
+------------------------+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Fraction Integer)`



We use
fullPartialFractionfullPartialFractionFullPartialFractionExpansion to
convert it to an object of type FullPartialFractionExpansion.


.. spadInput
::

	g := fullPartialFraction f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| 4x-2-4x+1+∑%A2-1=0-3%A-6(x-%A)2   |
+-----------------------------------+




.. spadType

:sub:`Type: FullPartialFractionExpansion(Fraction`
Integer,UnivariatePolynomial(x,Fraction Integer))



Use a coercion to change it back into a quotient.


.. spadInput
::

	g :: Fx


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------+
| 36x5-2x4-2x3+4x2+x-2   |
+------------------------+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Fraction Integer)`



Full partial fractions differentiate faster than rational functions.


.. spadInput
::

	g5 := D(g, 5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------+
| -480(x-2)6+480(x+1)6+∑%A2-1=02160%A+4320(x-%A)7   |
+---------------------------------------------------+




.. spadType

:sub:`Type: FullPartialFractionExpansion(Fraction`
Integer,UnivariatePolynomial(x,Fraction Integer))




.. spadInput
::

	f5 := D(f, 5)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| (-544320x10+4354560x9-14696640x8+28615680x7-40085280x6+46656000x5-39411360x4+18247680x3-5870880x2+3317760x+246240)(x20-12x19+53x18-76x17-159x16+676x15-391x14-1596x13+2527x12+1148x11-4977x10+1372x9+4907x8-3444x7-2381x6+2924x5+276x4-1184x3+208x2+192x-64)   |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Fraction Integer)`



We can check that the two forms represent the same function.


.. spadInput
::

	g5::Fx - f5


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Fraction Integer)`



Here are some examples that are more complicated.


.. spadInput
::

	f : Fx := (x^5 * (x-1)) / ((x^2 + x + 1)^2 * (x-2)^3)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| x6-x5x7-4x6+3x5+9x3-6x2-4x-8   |
+--------------------------------+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Fraction Integer)`




.. spadInput
::

	g := fullPartialFraction f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------------------------------------------------+
| 19522401x-2+464343(x-2)2+3249(x-2)3+∑%A2+%A+1=0-1792401%A+1352401x-%A+∑%A2+%A+1=0371029%A+201029(x-%A)2   |
+-----------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: FullPartialFractionExpansion(Fraction`
Integer,UnivariatePolynomial(x,Fraction Integer))




.. spadInput
::

	g :: Fx - f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Fraction Integer)`




.. spadInput
::

	f : Fx := (2*x^7-7*x^5+26*x^3+8*x) / (x^8-5*x^6+6*x^4+4*x^2-8)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------+
| 2x7-7x5+26x3+8xx8-5x6+6x4+4x2-8   |
+-----------------------------------+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Fraction Integer)`




.. spadInput
::

	g := fullPartialFraction f


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------------------------+
| ∑%A2-2=012x-%A+∑%A2-2=01(x-%A)3+∑%A2+1=012x-%A   |
+--------------------------------------------------+




.. spadType

:sub:`Type: FullPartialFractionExpansion(Fraction`
Integer,UnivariatePolynomial(x,Fraction Integer))




.. spadInput
::

	g :: Fx - f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Fraction Integer)`




.. spadInput
::

	f:Fx := x^3 / (x^21 + 2*x^20 + 4*x^19 + 7*x^18 + 10*x^17 + 17*x^16
+ 22*x^15 + 30*x^14 + 36*x^13 + 40*x^12 + 47*x^11 + 46*x^10 +
49*x^9 + 43*x^8 + 38*x^7 + 32*x^6 + 23*x^5 + 19*x^4 + 10*x^3 +
7*x^2 + 2*x + 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------------------------------+
| x3(x21+2x20+4x19+7x18+10x17+22x15+30x14+36x13+40x12+47x11+46x10+49x9+43x8+38x7+32x6+23x5+19x4+10x3+7x2+2x+1)   |
+----------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Fraction Integer)`




.. spadInput
::

	g := fullPartialFraction f


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ∑%A2+1=012%Ax-%A+∑%A2+%A+1=019%A-1927x-%A+∑%A2+%A+1=0127%A-127(x-%A)2+∑%A5+%A2+1=0-96556567040912390759099%A4+420961732891912390759099%A3-59101056149912390759099%A2-373545875923912390759099%A+529673492498912390759099x-%A+∑%A5+%A2+1=0-558086894070601%A4-202444394070601%A3+432191994070601%A2-846141542141%A-507062094070601(x-%A)2+∑%A5+%A2+1=0161095794070601%A4+276301494070601%A3-201677594070601%A2+26695394070601%A+452935994070601(x-%A)3   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: FullPartialFractionExpansion(Fraction`
Integer,UnivariatePolynomial(x,Fraction Integer))



This verification takes much longer than the conversion to partial
fractions.


.. spadInput
::

	g :: Fx - f


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 0   |
+-----+




.. spadType

:sub:`Type: Fraction UnivariatePolynomial(x,Fraction Integer)`



For more information, see the paper: Bronstein, M and Salvy, B. Full
Partial Fraction Decomposition of Rational Functions, Proceedings of
ISSAC'93, Kiev, ACM Press. All see
`PartialFractionXmpPage <section-9.61.html#PartialFractionXmpPage>`__
for standard partial fraction decompositions.



