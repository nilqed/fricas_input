.. status: ok


1.4 Numbers
-----------

FriCAS distinguishes very carefully between different kinds of numbers,
how they are represented and what their properties are. Here are a
sampling of some of these kinds of numbers and some things you can do
with them.

Integer arithmetic is always exact.


.. spadInput
::

	11^13 * 13^11 * 17^7 - 19^5 * 23^3


.. spadMathAnswer
.. spadMathOutput
.. math::

  25387751112538918594666224484237298   

.. spadType
:sub:`Type: PositiveInteger`



Integers can be represented in factored form.


.. spadInput
::

	factor 643238070748569023720594412551704344145570763243


.. spadMathAnswer
.. spadMathOutput
.. math::

  11131311177195233292

.. spadType
:sub:`Type: Factored Integer`



Results stay factored when you do arithmetic. Note that the 12 is
automatically factored for you.


.. spadInput
::

	% * 12


.. spadMathAnswer

  radix 22311131311177195233292


.. spadType
:sub:`Type: Factored Integer`



Integers can also be displayed to bases other than 10. This is an
integer in base 11.


.. spadInput
::

	radix(25937424601,11)


.. spadMathAnswer
.. spadMathOutput
.. math::

 10000000000   


.. spadType
:sub:`Type: RadixExpansion 11`



Roman numerals are also available for those special occasions. Roman
numerals


.. spadInput
::

	roman(1992)


.. spadMathAnswer
.. spadMathOutput
.. math::

 MCMXCII  


.. spadType
:sub:`Type: RomanNumeral`



Rational number arithmetic is also exact.


.. spadInput
::

	r := 10 + 9/2 + 8/3 + 7/4 + 6/5 + 5/6 + 4/7 + 3/8 + 2/9


.. spadMathAnswer
.. spadMathOutput
.. math::

 557392520 

.. spadType
:sub:`Type: Fraction Integer`



To factor fractions, you have to pmap factor onto the numerator and
denominator.


.. spadInput
::

	map(factor,r)


.. spadMathAnswer
.. spadMathOutput
.. math::

  139401233257   

.. spadType
:sub:`Type: Fraction Factored Integer`



SingleInteger refers to machine word-length integers.

In English, this expression means 11 as a small integer.


.. spadInput
::

	11@SingleInteger


.. spadMathAnswer
.. spadMathOutput
.. math::

  11

.. spadType
:sub:`Type: SingleInteger`



Machine double-precision floating-point numbers are also available for
numeric and graphical applications.


.. spadInput
::

	123.21@DoubleFloat


.. spadMathAnswer
.. spadMathOutput
.. math::

  123.21000000000001   

.. spadType
:sub:`Type: DoubleFloat`



The normal floating-point type in FriCAS, Float, is a software
implementation of floating-point numbers in which the exponent and the
mantissa may have any number of digits. The types Complex(Float) and
Complex(DoubleFloat) are the corresponding software implementations of
complex floating-point numbers.

This is a floating-point approximation to about twenty digits. floating
point The ``::`` is used here to change from one kind of object (here,
a rational number) to another (a floating-point number).


.. spadInput
::

	r :: Float


.. spadMathAnswer
.. spadMathOutput
.. math::

  22.118650793650793651   


.. spadType
:sub:`Type: Float`



Use *digits* to change the number of digits in the
representation. This operation returns the previous value so you can
reset it later.


.. spadInput
::

	digits(22)


.. spadMathAnswer
.. spadMathOutput
.. math::

  20

.. spadType
:sub:`Type: PositiveInteger`



To 22 digits of precision, the number eπ163.0 appears to be an integer.


.. spadInput
::

	exp(%pi * sqrt 163.0)


.. spadMathAnswer
.. spadMathOutput
.. math::

 262537412640768744.0


.. spadType
:sub:`Type: Float`



Increase the precision to forty digits and try again.


.. spadInput
::

	digits(40); exp(%pi * sqrt 163.0)


.. spadMathAnswer
.. spadMathOutput
.. math::

  262537412640768743.9999999999992500725976


.. spadType
:sub:`Type: Float`



Here are complex numbers with rational numbers as real and complex
numbers imaginary parts.


.. spadInput
::

	(2/3 + %i)^3


.. spadMathAnswer
.. spadMathOutput
.. math::
 
  -{{46} \over {27}}+{{1 \over 3} \  i}

.. spadType
:sub:`Type: Complex Fraction Integer`



The standard operations on complex numbers are available.


.. spadInput
::

	conjugate %


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{{46} \over {27}} -{{1 \over 3} \  i}

.. spadType
:sub:`Type: Complex Fraction Integer`



You can factor complex integers.


.. spadInput
::

	factor(89 - 23 * %i)


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{{\left( 1+i
  \right)}
  \  {{{\left( 2+i
  \right)}}
  ^ {2}} \  {{{\left( 3+{2 \  i}
  \right)}}
  ^ {2}}}

.. spadType
:sub:`Type: Factored Complex Integer`



Complex numbers with floating point parts are also available.


.. spadInput
::

	exp(%pi/4.0 * %i)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {0.7071067811865475244}+{{0.7071067811865475244} \  i}

.. spadType
:sub:`Type: Complex Float`



The real and imaginary parts can be symbolic.


.. spadInput
::

	complex(u,v)


.. spadMathAnswer
.. spadMathOutput
.. math::

  u+{v \  i}

.. spadType
:sub:`Type: Complex Polynomial Integer`



Of course, you can do complex arithmetic with these also.


.. spadInput
::

	% ^ 2


.. spadMathAnswer
.. spadMathOutput
.. math::

 -{{v} ^ {2}}+{{u} ^ {2}}+{2 \  u \  v \  i}

.. spadType
:sub:`Type: Complex Polynomial Integer`



Every rational number has an exact representation as a repeating decimal
expansion


.. spadInput
::

	decimal(1/352)


.. spadMathAnswer
.. spadMathOutput
.. math::

 0.{00284}{\overline {09}}

.. spadType
:sub:`Type: DecimalExpansion`



A rational number can also be expressed as a continued fraction.


.. spadInput
::

	continuedFraction(6543/210)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \def\zag#1#2{{{\left.{#1}\right|}\over{\left|{#2}\right.}}}

  {31}+ \zag{1}{6}+ \zag{1}{2}+ \zag{1}{1}+ \zag{1}{3}


.. spadType
:sub:`Type: ContinuedFraction Integer`



Also, partial fractions can be used and can be displayed in a partial
fraction compact format fraction:partial


.. spadInput
::

	partialFraction(1,factorial(10))


.. spadMathAnswer
.. spadMathOutput
.. math::

  {{159} \over {{2} ^ {8}}} -{{23} \over {{3} ^ {4}}} -{{12} \over {{5} ^
   {2}}}+{1 \over 7}


.. spadType
:sub:`Type: PartialFraction Integer`


or expanded format.


.. spadInput
::

	padicFraction(%)


.. spadMathAnswer
.. spadMathOutput
.. math::

  {1 \over 2}+{1 \over {{2} ^ {4}}}+{1 \over {{2} ^ {5}}}+{1 \over {{2} ^
  {6}}}+{1 \over {{2} ^ {7}}}+{1 \over {{2} ^ {8}}} -{2 \over {{3} ^
  {2}}} -{1 \over {{3} ^ {3}}} -{2 \over {{3} ^ {4}}} -{2 \over 5} -{2
  \over {{5} ^ {2}}}+{1 \over 7}


.. spadType
:sub:`Type: PartialFraction Integer`



Like integers, bases (radices) other than ten can be used for rational
numbers. Here we use base eight.


.. spadInput
::

	radix(4/7, 8)


.. spadMathAnswer
.. spadMathOutput
.. math::

  0.{\overline 4}

.. spadType
:sub:`Type: RadixExpansion 8`



Of course, there are complex versions of these as well. FriCAS decides
to make the result a complex rational number.


.. spadInput
::

	% + 2/3*%i


.. spadMathAnswer
.. spadMathOutput
.. math::

  {4 \over 7}+{{2 \over 3} \  i}

.. spadType
:sub:`Type: Complex Fraction Integer`


You can also use FriCAS to manipulate fractional powers.


.. spadInput
::

	(5 + sqrt 63 + sqrt 847)^(1/3)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \root {3} \of {{{{14} \  {\sqrt {7}}}+5}}

.. spadType
:sub:`Type: AlgebraicNumber`



You can also compute with integers modulo a prime.


.. spadInput
::

	x : PrimeField 7 := 5


.. spadMathAnswer
.. spadMathOutput
.. math::

  5

.. spadType
:sub:`Type: PrimeField 7`



Arithmetic is then done modulo 7.


.. spadInput
::

	x^3


.. spadMathAnswer
.. spadMathOutput
.. math::

  6

.. spadType
:sub:`Type: PrimeField 7`



Since 7 is prime, you can invert nonzero values.


.. spadInput
::

	1/x


.. spadMathAnswer
.. spadMathOutput
.. math::

  3

.. spadType
:sub:`Type: PrimeField 7`



You can also compute modulo an integer that is not a prime.


.. spadInput
::

	y : IntegerMod 6 := 5


.. spadMathAnswer
.. spadMathOutput
.. math::

  5

.. spadType
:sub:`Type: IntegerMod 6`



All of the usual arithmetic operations are available.


.. spadInput
::

	y^3


.. spadMathAnswer
.. spadMathOutput
.. math::

  5

.. spadType
:sub:`Type: IntegerMod 6`



Inversion is not available if the modulus is not a prime number. Modular
arithmetic and prime fields are discussed in Section
`ugxProblemFinitePrime <section-8.11.html#ugxProblemFinitePrime>`__ .


.. spadInput
::

	1/y


.. spadMathAnswer
.. spadVerbatim

::

    There are 12 exposed and 13 unexposed library operations named / 
       having 2 argument(s) but none was determined to be applicable. 
       Use HyperDoc Browse, or issue
                                 )display op /
       to learn more about the available operations. Perhaps 
       package-calling the operation or using coercions on the arguments
       will allow you to apply the operation.
  
    Cannot find a definition or applicable library operation named / 
       with argument type(s) 
                                PositiveInteger
                                 IntegerMod 6
       
       Perhaps you should use "@" to indicate the required return type, 
       or "$" to specify which version of the function you need.



This defines a to be an algebraic number, that is, a root of a
polynomial equation.


.. spadInput
::

	a := rootOf(a^5 + a^3 + a^2 + 3,a)


.. spadMathAnswer
.. spadMathOutput
.. math::

  a

.. spadType
:sub:`Type: Expression Integer`



Computations with a are reduced according to the polynomial equation.


.. spadInput
::

	(a + 1)^10


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{{85} \  {{a} ^ {4}}} -{{264} \  {{a} ^ {3}}} -{{378} \  {{a} ^ {2}}}
  -{{458} \  a} -{287}


.. spadType
:sub:`Type: Expression Integer`



Define b to be an algebraic number involving a.


.. spadInput
::

	b := rootOf(b^4 + a,b)


.. spadMathAnswer
.. spadMathOutput
.. math::

  b

.. spadType
:sub:`Type: Expression Integer`



Do some arithmetic.


.. spadInput
::

	2/(b - 1)


.. spadMathAnswer
.. spadMathOutput
.. math::

  2 \over {b -1}

.. spadType
:sub:`Type: Expression Integer`



To expand and simplify this, call ratDenom to rationalize the
denominator.


.. spadInput
::

	ratDenom(%)


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptstyle{
  {{\left( {{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}} -a+1
   \right)}
   \  {{b} ^ {3}}}+{{\left( {{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}}
   -a+1 
   \right)}
   \  {{b} ^ {2}}}+{{\left( {{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}}
   -a+1
   \right)}
   \  b}+{{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}} -a+1}

   
.. spadType
:sub:`Type: Expression Integer`



If we do this, we should get b.


.. spadInput
::

	2/%+1


.. spadMathAnswer
.. spadMathOutput
.. math::

  \scriptstyle{
  {{{\left( {{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}} -a+1
  \right)}
  \  {{b} ^ {3}}}+{{\left( {{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}}
  -a+1
  \right)}
  \  {{b} ^ {2}}}+{{\left( {{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}}
  -a+1
  \right)}
  \  b}+{{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}} -a+3} \over {{{\left(
  {{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}} -a+1
  \right)}
  \  {{b} ^ {3}}}+{{\left( {{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}}
  -a+1
  \right)}
  \  {{b} ^ {2}}}+{{\left( {{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}}
  -a+1
  \right)}
  \  b}+{{a} ^ {4}} -{{a} ^ {3}}+{2 \  {{a} ^ {2}}} -a+1}}


.. spadType
:sub:`Type: Expression Integer`



But we need to rationalize the denominator again.


.. spadInput
::

	ratDenom(%)


.. spadMathAnswer
.. spadMathOutput
.. math::

  b

.. spadType
:sub:`Type: Expression Integer`



Types Quaternion and Octonion are also available. Multiplication of
quaternions is non-commutative, as expected.


.. spadInput
::

  q:=quatern(1,2,3,4)*quatern(5,6,7,8) - quatern(5,6,7,8)*quatern(1,2,3,4)


.. spadMathAnswer
.. spadMathOutput
.. math::

  -{8 \  i}+{{16} \  j} -{8 \  k}

.. spadType
:sub:`Type: Quaternion Integer`

