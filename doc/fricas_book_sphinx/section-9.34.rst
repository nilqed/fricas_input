.. status: ok



9.34 Integer
------------

FriCAS provides many operations for manipulating arbitrary precision
integers. In this section we will show some of those that come from
Integer itself plus some that are implemented in other packages. More
examples of using integers are in the following sections:
`ugIntroNumbersPage <ugIntroNumbersPage>`__ in section
`ugIntroNumbersNumber <ugIntroNumbersNumber>`__
`IntegerNumberTheoryFunctionsXmpPage <section-9.36.html#IntegerNumberTheoryFunctionsXmpPage>`__
,
`DecimalExpansionXmpPage <section-9.15.html#DecimalExpansionXmpPage>`__
, `BinaryExpansionXmpPage <section-9.4.html#BinaryExpansionXmpPage>`__
,
`HexadecimalExpansionXmpPage <section-9.33.html#HexadecimalExpansionXmpPage>`__
, and
`RadixExpansionXmpPage <section-9.65.html#RadixExpansionXmpPage>`__ .



9.34.1 Basic Functions
~~~~~~~~~~~~~~~~~~~~~~

The size of an integer in FriCAS is only limited by the amount of
computer storage you have available. The usual arithmetic operations are
available.


.. spadInput
::

	2^(5678 - 4856 + 2 * 17)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 480481077043500814718154092512592439123952613987168226347385561008808420007630829308634252709141208374307457227821149607627692202643343568752733498024953930242542523045817764949544214392905306388478705146745768073877141698859815495632935288783334250628775936   |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+




.. spadType

:sub:`Type: PositiveInteger`



There are a number of ways of working with the sign of an integer. Let's
use this x as an example.


.. spadInput
::

	x := -101


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| -101   |
+--------+




.. spadType

:sub:`Type: Integer`



First of all, there is the absolute value function.


.. spadInput
::

	abs(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 101   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



The signsignInteger operation returns -1 if its argument is negative, 0
if zero and 1 if positive.


.. spadInput
::

	sign(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| -1   |
+------+




.. spadType

:sub:`Type: Integer`



You can determine if an integer is negative in several other ways.


.. spadInput
::

	x < 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	x <= -1


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	negative?(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



Similarly, you can find out if it is positive.


.. spadInput
::

	x > 0


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	x >= 1


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	positive?(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



This is the recommended way of determining whether an integer is zero.


.. spadInput
::

	zero?(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`







| Use the zero?zero?Integer operation whenever you are testing any
mathematical object for equality with zero. This is usually more
efficient that using = (think of matrices: it is easier to tell if a
matrix is zero by just checking term by term than constructing another
zero matrix and comparing the two matrices term by term) and also avoids
the problem that = is usually used for creating equations.





This is the recommended way of determining whether an integer is equal
to one.


.. spadInput
::

	one?(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



This syntax is used to test equality using =. It says that you want a
Boolean (true or false) answer rather than an equation.


.. spadInput
::

	(x = -101)@Boolean


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



The operations odd?odd?Integer and even?even?Integer determine whether
an integer is odd or even, respectively. They each return a Boolean
object.


.. spadInput
::

	odd?(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	even?(x)


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



The operation gcdgcdInteger computes the greatest common divisor of two
integers.


.. spadInput
::

	gcd(56788,43688)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 4   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The operation lcmlcmInteger computes their least common multiple.


.. spadInput
::

	lcm(56788,43688)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------+
| 620238536   |
+-------------+




.. spadType

:sub:`Type: PositiveInteger`



To determine the maximum of two integers, use maxmaxInteger.


.. spadInput
::

	max(678,567)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 678   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



To determine the minimum, use minminInteger.


.. spadInput
::

	min(678,567)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 567   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



The reduce operation is used to extend binary operations to more than
two arguments. For example, you can use reduce to find the maximum
integer in a list or compute the least common multiple of all integers
in the list.


.. spadInput
::

	reduce(max,[2,45,-89,78,100,-45])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 100   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	reduce(min,[2,45,-89,78,100,-45])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| -89   |
+-------+




.. spadType

:sub:`Type: Integer`




.. spadInput
::

	reduce(gcd,[2,45,-89,78,100,-45])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`




.. spadInput
::

	reduce(lcm,[2,45,-89,78,100,-45])


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| 1041300   |
+-----------+




.. spadType

:sub:`Type: PositiveInteger`



The infix operator / is not used to compute the quotient of integers.
Rather, it is used to create rational numbers as described in
`FractionXmpPage <section-9.12.html#ContinuedFractionXmpPage>`__ .


.. spadInput
::

	13 / 4


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 134   |
+-------+




.. spadType

:sub:`Type: Fraction Integer`



The infix operation quoquoInteger computes the integer quotient.


.. spadInput
::

	13 quo 4


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



The infix operation remremInteger computes the integer remainder.


.. spadInput
::

	13 rem 4


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



One integer is evenly divisible by another if the remainder is zero. The
operation exquoexquoInteger can also be used. See
`ugTypesUnionsPage <ugTypesUnionsPage>`__ in Section
`ugTypesUnionsNumber <ugTypesUnionsNumber>`__ for an example.


.. spadInput
::

	zero?(167604736446952 rem 2003644)


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`



The operation dividedivideInteger returns a record of the quotient and
remainder and thus is more efficient when both are needed.


.. spadInput
::

	d := divide(13,4)


.. spadMathAnswer
.. spadMathOutput
.. math::

+----------------------------+
| [quotient=3,remainder=1]   |
+----------------------------+




.. spadType

:sub:`Type: Record(quotient: Integer,remainder: Integer)`




.. spadInput
::

	d.quotient


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 3   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`



Records are discussed in detail in Section
`ugTypesRecords <section-2.4.html#ugTypesRecords>`__ .


.. spadInput
::

	d.remainder


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----+
| 1   |
+-----+




.. spadType

:sub:`Type: PositiveInteger`







9.34.2 Primes and Factorization
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the operation factorfactorInteger to factor integers. It returns an
object of type Factored Integer. See
`FactoredXmpPage <section-9.22.html#FactoredXmpPage>`__ for a
discussion of the manipulation of factored objects.


.. spadInput
::

	factor 102400


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| 21252   |
+---------+




.. spadType

:sub:`Type: Factored Integer`



The operation prime?prime?Integer returns true or false depending on
whether its argument is a prime.


.. spadInput
::

	prime? 7


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| true   |
+--------+




.. spadType

:sub:`Type: Boolean`




.. spadInput
::

	prime? 8


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------+
| false   |
+---------+




.. spadType

:sub:`Type: Boolean`



The operation nextPrimenextPrimeIntegerPrimesPackage returns the least
prime number greater than its argument.


.. spadInput
::

	nextPrime 100


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------+
| 101   |
+-------+




.. spadType

:sub:`Type: PositiveInteger`



The operation prevPrimeprevPrimeIntegerPrimesPackage returns the
greatest prime number less than its argument.


.. spadInput
::

	prevPrime 100


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| 97   |
+------+




.. spadType

:sub:`Type: PositiveInteger`



To compute all primes between two integers (inclusively), use the
operation primesprimesIntegerPrimesPackage.


.. spadInput
::

	primes(100,175)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------------------------------------------------------------+
| [173,167,163,157,151,149,139,137,131,127,113,109,107,103,101]   |
+-----------------------------------------------------------------+




.. spadType

:sub:`Type: List Integer`



You might sometimes want to see the factorization of an integer when it
is considered a Gaussian integer. See
`ComplexXmpPage <section-9.11.html#ComplexXmpPage>`__ for more details.


.. spadInput
::

	factor(2 :: Complex Integer)


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------+
| -i(1+i)2   |
+------------+




.. spadType

:sub:`Type: Factored Complex Integer`







9.34.3 Some Number Theoretic Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FriCAS provides several number theoretic operations for integers. More
examples are in
`IntegerNumberTheoryFunctionsXmpPage <section-9.36.html#IntegerNumberTheoryFunctionsXmpPage>`__
.

The operation fibonaccifibonacciIntegerNumberTheoryFunctions computes
the Fibonacci numbers. The algorithm has running time for argument n.


.. spadInput
::

	[fibonacci(k) for k in 0..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+------------------------------+
| [0,1,1,2,3,5,8,13,21,34,…]   |
+------------------------------+




.. spadType

:sub:`Type: Stream Integer`



The operation legendrelegendreIntegerNumberTheoryFunctions computes the
Legendre symbol for its two integer arguments where the second one is
prime. If you know the second argument to be prime, use
jacobijacobiIntegerNumberTheoryFunctions instead where no check is made.


.. spadInput
::

	[legendre(i,11) for i in 0..10]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------------+
| [0,1,-1,1,1,1,-1,-1,-1,1,-1]   |
+--------------------------------+




.. spadType

:sub:`Type: List Integer`



The operation jacobijacobiIntegerNumberTheoryFunctions computes the
Jacobi symbol for its two integer arguments. By convention, 0 is
returned if the greatest common divisor of the numerator and denominator
is not 1.


.. spadInput
::

	[jacobi(i,15) for i in 0..9]


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------------------------+
| [0,1,1,0,1,0,0,-1,1,0]   |
+--------------------------+




.. spadType

:sub:`Type: List Integer`



The operation eulerPhieulerPhiIntegerNumberTheoryFunctions computes the
values of Euler's -function where equals the number of positive integers
less than or equal to n that are relatively prime to the positive
integer n.


.. spadInput
::

	[eulerPhi i for i in 1..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+---------------------------+
| [1,1,2,2,4,2,6,4,6,4,…]   |
+---------------------------+




.. spadType

:sub:`Type: Stream Integer`



The operation moebiusMumoebiusMuIntegerNumberTheoryFunctions computes
the Möbius λ function.


.. spadInput
::

	[moebiusMu i for i in 1..]


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------------------+
| [1,-1,-1,0,-1,1,-1,0,0,1,…]   |
+-------------------------------+




.. spadType

:sub:`Type: Stream Integer`



Although they have somewhat limited utility, FriCAS provides Roman
numerals.


.. spadInput
::

	a := roman(78)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| LXXVIII   |
+-----------+




.. spadType

:sub:`Type: RomanNumeral`




.. spadInput
::

	b := roman(87)


.. spadMathAnswer
.. spadMathOutput
.. math::

+-----------+
| LXXXVII   |
+-----------+




.. spadType

:sub:`Type: RomanNumeral`




.. spadInput
::

	a + b


.. spadMathAnswer
.. spadMathOutput
.. math::

+--------+
| CLXV   |
+--------+




.. spadType

:sub:`Type: RomanNumeral`




.. spadInput
::

	a * b


.. spadMathAnswer
.. spadMathOutput
.. math::

+-------------------+
| MMMMMMDCCLXXXVI   |
+-------------------+




.. spadType

:sub:`Type: RomanNumeral`




.. spadInput
::

	b rem a


.. spadMathAnswer
.. spadMathOutput
.. math::

+------+
| IX   |
+------+




.. spadType

:sub:`Type: RomanNumeral`







